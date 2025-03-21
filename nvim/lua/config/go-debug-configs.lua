local dap = require("dap")

dap.configurations["go"] = {
    {
        type = "delve",
        name = "Debug Current File",
        request = "launch",
        program = "${file}",
        showLog = "true",
    },
    {
        type = "delve",
        name = "Debug Current Test", -- configuration for debugging test files
        request = "launch",
        mode = "test",
        program = "${file}",
    },
    -- works with go.mod packages and sub packages
    {
        type = "delve",
        name = "Debug Module Tests (go.mod)",
        request = "launch",
        mode = "test",
        program = "./${relativeFileDirname}",
    },
}
