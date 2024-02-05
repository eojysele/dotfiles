local utils = {}

function utils.set_group_settings(group, settings)
    vim.api.nvim_set_hl(0, group, settings)
end

return utils
