return {
    'stevearc/oil.nvim',
    event = 'VimEnter',
    opts = {
        default_file_explorer = true,
        delete_to_trash = true,
        view_options = {
            show_hidden = true,
            natural_order = true,
            is_always_hidden = function(name, _)
                return name == ".."
            end
        },
        win_options = {
            wrap = true,
        },
    }
}
