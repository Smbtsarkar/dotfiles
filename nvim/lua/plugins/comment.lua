-- Ensuring the Comment plugin is installed
local status, comment = pcall(require, "Comment")
if not status then
    return
end

comment.setup()
