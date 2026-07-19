return {
    name = "build with clang",
    builder = function()
        local file = vim.fn.expand("%:p")
        local start_dir = vim.fn.expand("%:p:h")
        local is_windows = vim.fn.has("win32") == 1

        local function find_root(markers)
            local found = vim.fs.find(markers, { upward = true, path = start_dir })[1]
            return found and vim.fs.dirname(found) or nil
        end

        local cmd, cwd

        local cmake_root = find_root({ "CMakeLists.txt" })
        local build_script = is_windows and "build.bat" or "build.sh"
        local script_root = find_root({ build_script })
        local make_root = (not is_windows) and find_root({ "Makefile" }) or nil

        if cmake_root then
            cmd = { "cmake", "--build", "build" }
            cwd = cmake_root
        elseif script_root then
            cmd = is_windows and { build_script } or { "./" .. build_script }
            cwd = script_root
        elseif make_root then
            cmd = { "make" }
            cwd = make_root
        else
            cmd = { "clang++", file }
        end

        return {
            cmd = cmd,
            cwd = cwd,
            components = {
                {
                    "on_output_quickfix",
                    errorformat = table.concat({
                        -- clang++ / g++ (Linux, macOS): file.cpp:10:5: error: message
                        [[%f:%l:%c:\ %t%*[^:]:\ %m]],
                        -- cl.exe with column (VS2017+): file.cpp(10,5): error C2143: message
                        [[%f(%l\,%c):\ %t%*[^:]:\ %m]],
                        -- cl.exe without column: file.cpp(10): error C2143: message
                        [[%f(%l):\ %t%*[^:]:\ %m]],
                        -- CMake Error at CMakeLists.txt:10 (context):
                        [[%E%.%#CMake\ Error\ at\ %f:%l\ (%.%#):]],
                        -- CMake Warning / Warning (dev) at CMakeLists.txt:20 (message):
                        [[%W%.%#CMake\ Warning%.%#\ at\ %f:%l\ (%.%#):]],
                        -- continuation: CMake's body text is indented by two spaces
                        [[%C\ \ %m]],
                        -- close the block on the next non-indented line (blank line, "--" log line, etc.)
                        [[%Z%.%#]],
                    }, ","),
                    close = true,
                    items_only = true,
                    set_diagnostics = true,
                },
                { "on_result_diagnostics",         remove_on_restart = true },
                { "on_result_diagnostics_trouble", args = { "focus=false" }, close = true },
                { "unique",                        replace = true },
                "default",
            },
        }
    end,
    condition = {
        callback = function(opts)
            if vim.bo.filetype == "cpp" then
                return true
            end
            local found = vim.fs.find("CMakeLists.txt", { upward = true, type = "file", path = opts.dir })[1]
            if found then
                return true
            end
            return false, "Not a cpp file and no CMakeLists.txt found"
        end,
    },
}
