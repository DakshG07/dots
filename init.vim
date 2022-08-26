"    ____      _ __        _
"   /  _/___  (_) /__   __(_)___ ___
"   / // __ \/ / __/ | / / / __ `__ \
" _/ // / / / / /__| |/ / / / / / / /
"/___/_/ /_/_/\__(_)___/_/_/ /_/ /_/
" Dukk's Opiniated Neovim Config


call plug#begin()
    " Appearance
    Plug 'feline-nvim/feline.nvim'
    Plug 'ryanoasis/vim-devicons' " Icons
    Plug 'kyazdani42/nvim-web-devicons' " Also icons
    Plug 'catppuccin/nvim', {'as': 'catppuccin'} " Best theme

    
    " Utilities
    Plug 'sheerun/vim-polyglot' "  Nice
    Plug 'jiangmiao/auto-pairs' "  Also nice
    Plug 'ap/vim-css-color'
    Plug 'kyazdani42/nvim-tree.lua'
    Plug 'p00f/nvim-ts-rainbow'
    Plug 'romgrk/barbar.nvim'
    Plug 'nvim-telescope/telescope.nvim' " I mean...it's telescope!
    Plug 'ur4ltz/surround.nvim'          " Really useful plugin...maybe I should move it down there.
    Plug 'https://github.com/folke/which-key.nvim' " Which-key because no one can remember everything.
    Plug 'D:\Coding Projects\kak.nvim\plugin\kak.nvim.vim' " Kak plugin
    Plug 'vimwiki/vimwiki ' " Nice tool

    " Some Useful Things
    Plug 'andweeb/presence.nvim'   " Discord RPC
    Plug 'famiu/nvim-reload'       " Time-saver
    Plug 'rcarriga/nvim-notify'    " Notifications
    Plug 'justinmk/vim-sneak'
    Plug 'nvim-orgmode/orgmode'    " Org mode! <- will remove soon
    Plug 'nvim-neorg/neorg'        " Org mode but better 
    Plug 'glepnir/dashboard-nvim'  " Vim dashboard!


    " LSP & related
    Plug 'williamboman/mason.nvim'
    Plug 'neovim/nvim-lspconfig'
    Plug 'neovim/nvim-lspconfig'
    Plug 'glepnir/lspsaga.nvim', { 'branch': 'main' }
    Plug 'https://git.sr.ht/~whynothugo/lsp_lines.nvim', { 'branch': 'main' } " Just kinda cool to have
    Plug 'hrsh7th/cmp-nvim-lsp'
    Plug 'hrsh7th/cmp-buffer'               " completion from buffers
    Plug 'hrsh7th/cmp-path'                 " completion from paths
    Plug 'hrsh7th/cmp-cmdline'              " completion from command line
    Plug 'hrsh7th/nvim-cmp'                 " completion engine
    Plug 'hrsh7th/cmp-vsnip'                " vsnip support yay
    Plug 'hrsh7th/vim-vsnip'
    Plug 'simrat39/rust-tools.nvim'         " rust is amazing!

    " Debugging
    Plug 'nvim-lua/plenary.nvim'
    Plug 'mfussenegger/nvim-dap'

    " Completion / linters etc.
    Plug 'plasticboy/vim-markdown'
    Plug 'nvim-treesitter/nvim-treesitter', {'do': ':TSUpdate'}

    " Git
    Plug 'airblade/vim-gitgutter'
call plug#end()
colorscheme catppuccin " Best colorscheme
" set guifont=CaskaydiaCove\ NF:h16 " Best font
set guifont=Mono\ Dukk " Best font
set autoindent smartindent
set clipboard+=unnamedplus
set number
set encoding=utf-8
set relativenumber
set mouse=n
set tm=0 " Personal preference
let NERDTreeShowHidden=1
let g:neovide_cursor_vfx_mode = "ripple"
let g:catppuccin_flavour = "mocha"
nnoremap <leader>sv :source $MYVIMRC<CR>
nnoremap <leader>ev :e $MYVIMRC<CR>
nnoremap <leader><space><space> :NvimTreeFocus<CR>
nnoremap <leader>tt :vert terminal<CR>
nnoremap <leader>n :res 0<CR>
nnoremap <leader>m :res 10<CR>
nnoremap C-j <Down>
nnoremap C-k <Up>
" Telescope
nnoremap <leader>ff <cmd>Telescope find_files<cr>
nnoremap <leader>fb <cmd>Telescope buffers<cr>
nnoremap <leader>fh <cmd>Telescope help_tags<cr>

" Using Lua functions
nnoremap <leader>ff <cmd>lua require('telescope.builtin').find_files()<cr>
nnoremap <leader>fg <cmd>lua require('telescope.builtin').live_grep()<cr>
nnoremap <leader>fb <cmd>lua require('telescope.builtin').buffers()<cr>
nnoremap <leader>fh <cmd>lua require('telescope.builtin').help_tags()<cr>
augroup highlight_yank
    autocmd!
    autocmd TextYankPost * silent! lua require'vim.highlight'.on_yank("IncSearch", 1000)
augroup END
" Tab bar config
" Move to previous/next
nnoremap <silent>    <A-,> <Cmd>BufferPrevious<CR>
nnoremap <silent>    <A-.> <Cmd>BufferNext<CR>
" Re-order to previous/next
nnoremap <silent>    <A-<> <Cmd>BufferMovePrevious<CR>
nnoremap <silent>    <A->> <Cmd>BufferMoveNext<CR>
" Goto buffer in position...
nnoremap <silent>    <A-1> <Cmd>BufferGoto 1<CR>
nnoremap <silent>    <A-2> <Cmd>BufferGoto 2<CR>
nnoremap <silent>    <A-3> <Cmd>BufferGoto 3<CR>
nnoremap <silent>    <A-4> <Cmd>BufferGoto 4<CR>
nnoremap <silent>    <A-5> <Cmd>BufferGoto 5<CR>
nnoremap <silent>    <A-6> <Cmd>BufferGoto 6<CR>
nnoremap <silent>    <A-7> <Cmd>BufferGoto 7<CR>
nnoremap <silent>    <A-8> <Cmd>BufferGoto 8<CR>
nnoremap <silent>    <A-9> <Cmd>BufferGoto 9<CR>
nnoremap <silent>    <A-0> <Cmd>BufferLast<CR>
" Pin/unpin buffer
nnoremap <silent>    <A-p> <Cmd>BufferPin<CR>
" Close buffer
nnoremap <silent>    <A-c> <Cmd>BufferClose<CR>
" Wipeout buffer
"                          :BufferWipeout
" Close commands
"                          :BufferCloseAllButCurrent
"                          :BufferCloseAllButPinned
"                          :BufferCloseAllButCurrentOrPinned
"                          :BufferCloseBuffersLeft
"                          :BufferCloseBuffersRight
" Magic buffer-picking mode
nnoremap <silent> <C-p>    <Cmd>BufferPick<CR>
" Sort automatically by...
nnoremap <silent> <Space>bb <Cmd>BufferOrderByBufferNumber<CR>
nnoremap <silent> <Space>bd <Cmd>BufferOrderByDirectory<CR>
nnoremap <silent> <Space>bl <Cmd>BufferOrderByLanguage<CR>
nnoremap <silent> <Space>bw <Cmd>BufferOrderByWindowNumber<CR>
lua << END
-- Surround.nvim
require("surround").setup{}
-- Lsp Autocomplete

-- LSP Lines setup 
require("lsp_lines").setup()
vim.diagnostic.config({
    virtual_text = false,
})

-- Mason setup
require("mason").setup()

-- Which key setup
require("which-key").setup()

-- Dashboard config
local db = require("dashboard")

db.custom_header = function()
    local quotes = {
        "It's not safe to go alone! Take this.",
        "Welcome back, master.",
        "ggdG",
        "Beginning descent into chaos.",
        "owo",
        "Death is inevitable.",
    }
    local random_quote = quotes[math.random(#quotes)]
    return {
        [[______  _   _  _   __ _   __ _   _  _____ ___  ___]],
        [[|  _  \| | | || | / /| | / /| | | ||_   _||  \/  |]],
        [[| | | || | | || |/ / | |/ / | | | |  | |  | .  . |]],
        [[| | | || | | ||    \ |    \ | | | |  | |  | |\/| |]],
        [[| |/ / | |_| || |\  \| |\  \\ \_/ / _| |_ | |  | |]],
        [[|___/   \___/ \_| \_/\_| \_/ \___/  \___/ \_|  |_/]],
        [[              The GigaChad Text Editor            ]],
        random_quote,
        [[]],
    }
end

db.custom_center = {
    {
        icon = "  ",
        desc = "Restore latest session                  ",
        action = "SessionLoad",
    },
    {
        icon = "  ",
        desc = "Find File                               ",
        action = "Telescope find_files find_command=rg,--hidden,--files",
    },
    {
        icon = "  ",
        desc = "File Browser                            ",
        action = "Telescope file_browser",
    },
    {
        icon = "  ",
        desc = "Find word                               ",
        action = "Telescope live_grep",
    },
    {
        icon = "  ",
        desc = "Open Personal dotfiles                  ",
        action = "Telescope dotfiles path=C:/Users/daksh/AppData/Local/nvim",
    },
}
require('neorg').setup {
    load = {
        ["core.defaults"] = {},
        ["core.norg.dirman"] = {
            config = {
                workspaces = {
                    work = "~/notes/work",
                    home = "~/notes/home",
                }
            }
        }
    }
}

-- Load custom tree-sitter grammar for org filetype
require('orgmode').setup_ts_grammar()

-- Tree-sitter configuration
require'nvim-treesitter.configs'.setup {
  -- If TS highlights are not enabled at all, or disabled via `disable` prop, highlighting will fallback to default Vim syntax highlighting
  highlight = {
    enable = true,
    additional_vim_regex_highlighting = {'org'}, -- Required for spellcheck, some LaTex highlights and code block highlights that do not have ts grammar
  },
  ensure_installed = {'org'}, -- Or run :TSUpdate org
}

require('orgmode').setup({
  org_todo_keywords = {'TODO', 'WAITING', '|', 'DONE', 'DELEGATED'},
  org_todo_keyword_faces = {
    WAITING = ':foreground blue :weight bold',
    DELEGATED = ':background #FFFFFF :slant italic :underline on',
    TODO = ':background #000000 :foreground red', -- overrides builtin color for `TODO` keyword
  }
})
require'nvim-treesitter.configs'.setup {
  -- A list of parser names, or "all"
  ensure_installed = { "c", "lua", "rust", "norg" },

  -- Install parsers synchronously (only applied to `ensure_installed`)
  sync_install = false,

  -- List of parsers to ignore installing (for "all")
  ignore_install = {},
  rainbow = {
      enable = true,
      extended_mode = true,
      max_file_lines = nil,
  },

  highlight = {
    -- `false` will disable the whole extension
    enable = true,

    -- NOTE: these are the names of the parsers and not the filetype. (for example if you want to
    -- disable highlighting for the `tex` filetype, you need to include `latex` in this list as this is
    -- the name of the parser)
    -- list of language that will be disabled
    disable = {},

    -- Setting this to true will run `:h syntax` and tree-sitter at the same time.
    -- Set this to `true` if you depend on 'syntax' being enabled (like for indentation).
    -- Using this option may slow down your editor, and you may see some duplicate highlights.
    -- Instead of true it can also be a list of languages
    additional_vim_regex_highlighting = false,
  },
}
require("catppuccin").setup({
  styles = {
    comments = "italic",
    functions = "italic",
    keywords = "italic",
    strings = "NONE",
    variables = "NONE",
  },
  integrations = {
    treesitter = true,
    lsp_saga = true,
    gitgutter = true,
    vim_sneak = true,
    ts_rainbow = true,
      
}})
require('feline').setup({
   components = require('catppuccin.core.integrations.feline'),
})
require("nvim-tree").setup()
require("presence"):setup({
    -- General options
    auto_update = true,
    neovim_image_text = "The GigaChad Text Editor",
    main_image = "file", -- Main image display (either "neovim" or "file")
    blacklist = {}, -- A list of strings or Lua patterns that disable Rich Presence if the current file name, path, or workspace matches
    buttons = function(buffer, repo_url)
        if repo_url == nil then
            return false
        end

        return {
            {
                    label = "Steal like an artist",
                    url = repo_url,
            }
        }
    end,
    debounce_timeout = 10, -- Number of seconds to debounce events (or calls to `:lua package.loaded.presence:update(<filename>, true)`)
    file_assets = {
        yaml = { "Kubernetes", "https://raw.githubusercontent.com/kubernetes/kubernetes/master/logo/logo.png" },
    },
    -- Rich Presence text options
    editing_text = "Slapping up %s", -- Format string rendered when an editable file is loaded in the buffer (either string or function(filename: string): string)
    file_explorer_text = "Browsing %s", -- Format string rendered when browsing a file explorer (either string or function(file_explorer_name: string): string)
    git_commit_text = "Git Nonsense", -- Format string rendered when committing changes in git (either string or function(filename: string): string)
    plugin_manager_text = "Screwing up plugins", -- Format string rendered when managing plugins (either string or function(plugin_manager_name: string): string)
    reading_text = "Reading %s", -- Format string rendered when a read-only or unmodifiable file is loaded in the buffer (either string or function(filename: string): string)
    workspace_text = "👉 %s 👈", -- Format string rendered when in a git repository (either string or function(project_name: string|nil, filename: string): string)
    line_number_text = "Line %s out of %s", -- Format string rendered when `enable_line_number` is set to true (either string or function(line_number: number, line_count: number): string)
})
-- Setup nvim-cmp.
local cmp = require'cmp'

cmp.setup({
snippet = {
  -- REQUIRED - you must specify a snippet engine
  expand = function(args)
    vim.fn["vsnip#anonymous"](args.body) -- For `vsnip` users.
    -- require('luasnip').lsp_expand(args.body) -- For `luasnip` users.
    -- require('snippy').expand_snippet(args.body) -- For `snippy` users.
    -- vim.fn["UltiSnips#Anon"](args.body) -- For `ultisnips` users.
  end,
},
window = {
  completion = cmp.config.window.bordered(),
  documentation = cmp.config.window.bordered(),
},
mapping = cmp.mapping.preset.insert({
  ['<C-b>'] = cmp.mapping.scroll_docs(-4),
  ['<C-f>'] = cmp.mapping.scroll_docs(4),
  ['<C-Space>'] = cmp.mapping.complete(),
  ['<C-e>'] = cmp.mapping.abort(),
  ["<Tab>"] = cmp.mapping.confirm({ select = true }),
}),
sources = cmp.config.sources({
  { name = 'nvim_lsp' },
  { name = 'vsnip' }, -- For vsnip users.
  -- { name = 'luasnip' }, -- For luasnip users.
  -- { name = 'ultisnips' }, -- For ultisnips users.
  -- { name = 'snippy' }, -- For snippy users.
}, {
  { name = 'buffer' },
})
})

-- Set configuration for specific filetype.
cmp.setup.filetype('gitcommit', {
sources = cmp.config.sources({
  { name = 'cmp_git' }, -- You can specify the `cmp_git` source if you were installed it.
}, {
  { name = 'buffer' },
})
})

-- Use buffer source for `/` (if you enabled `native_menu`, this won't work anymore).
cmp.setup.cmdline('/', {
mapping = cmp.mapping.preset.cmdline(),
sources = {
  { name = 'buffer' }
}
})

-- Use cmdline & path source for ':' (if you enabled `native_menu`, this won't work anymore).
cmp.setup.cmdline(':', {
mapping = cmp.mapping.preset.cmdline(),
sources = cmp.config.sources({
  { name = 'path' }
}, {
  { name = 'cmdline' }
})
})

-- Setup lspconfig.
local capabilities = require('cmp_nvim_lsp').update_capabilities(vim.lsp.protocol.make_client_capabilities())
-- Replace <YOUR_LSP_SERVER> with each lsp server you've enabled.
require('lspconfig')['rust-analyzer'].setup {
    capabilities = capabilities,
    on_attach = on_attach
}
require('lspconfig')['tailwindcss-language-server'].setup {
    capabilities = capabilities,
    on_attach = on_attach
}
require('lspconfig')['html-lsp'].setup {
    capabilities = capabilities,
    on_attach = on_attach
}
require('lspconfig')['tsserver'].setup {
    capabilities = capabilities,
    on_attach = on_attach
}
require('lspconfig')['pyright'].setup {
    capabilities = capabilities,
    on_attach = on_attach
}
require('lspconfig')['gopls'].setup {
    capabilities = capabilities,
    on_attach = on_attach
}

-- Mappings.
-- See `:help vim.diagnostic.*` for documentation on any of the below functions
local opts = { noremap=true, silent=true }
vim.keymap.set('n', '<space>e', vim.diagnostic.open_float, opts)
vim.keymap.set('n', '[d', vim.diagnostic.goto_prev, opts)
vim.keymap.set('n', ']d', vim.diagnostic.goto_next, opts)
vim.keymap.set('n', '<space>q', vim.diagnostic.setloclist, opts)

-- Use an on_attach function to only map the following keys
-- after the language server attaches to the current buffer
local on_attach = function(client, bufnr)
  -- Enable completion triggered by <c-x><c-o>
  vim.api.nvim_buf_set_option(bufnr, 'omnifunc', 'v:lua.vim.lsp.omnifunc')

  -- Mappings.
  -- See `:help vim.lsp.*` for documentation on any of the below functions
  local bufopts = { noremap=true, silent=true, buffer=bufnr }
  vim.keymap.set('n', 'gD', vim.lsp.buf.declaration, bufopts)
  vim.keymap.set('n', 'gd', vim.lsp.buf.definition, bufopts)
  vim.keymap.set('n', 'K', vim.lsp.buf.hover, bufopts)
  vim.keymap.set('n', 'gi', vim.lsp.buf.implementation, bufopts)
  vim.keymap.set('n', '<C-k>', vim.lsp.buf.signature_help, bufopts)
  vim.keymap.set('n', '<space>wa', vim.lsp.buf.add_workspace_folder, bufopts)
  vim.keymap.set('n', '<space>wr', vim.lsp.buf.remove_workspace_folder, bufopts)
  vim.keymap.set('n', '<space>wl', function()
    print(vim.inspect(vim.lsp.buf.list_workspace_folders()))
  end, bufopts)
  vim.keymap.set('n', '<space>D', vim.lsp.buf.type_definition, bufopts)
  vim.keymap.set('n', '<space>rn', vim.lsp.buf.rename, bufopts)
  vim.keymap.set('n', '<space>ca', vim.lsp.buf.code_action, bufopts)
  vim.keymap.set('n', 'gr', vim.lsp.buf.references, bufopts)
  vim.keymap.set('n', '<space>f', vim.lsp.buf.formatting, bufopts)
end

local lsp_flags = {
  -- This is the default in Nvim 0.7+
  debounce_text_changes = 150,
}
require('lspconfig')['pyright'].setup{
    on_attach = on_attach,
    flags = lsp_flags,
}
require('lspconfig')['tsserver'].setup{
    on_attach = on_attach,
    flags = lsp_flags,
}
require('lspconfig')['rust_analyzer'].setup {
capabilities = capabilities
}
require('rust-tools').setup({})
local saga = require 'lspsaga'
saga.init_lsp_saga()
-- a bunch of lspsaga stuff
vim.keymap.set("n", "gh", "<cmd>Lspsaga lsp_finder<CR>", { silent = true,noremap = true})
local action = require("lspsaga.codeaction")

-- or use command
vim.keymap.set("n", "<leader>ca", "<cmd>Lspsaga code_action<CR>", { silent = true,noremap = true })
vim.keymap.set("v", "<leader>ca", "<cmd><C-U>Lspsaga range_code_action<CR>", { silent = true,noremap = true })
vim.keymap.set("n", "K", "<cmd>Lspsaga hover_doc<CR>", { silent = true })

local action = require("lspsaga.action")
-- scroll down hover doc or scroll in definition preview
vim.keymap.set("n", "<C-f>", function()
    action.smart_scroll_with_saga(1)
end, { silent = true })
-- scroll up hover doc
vim.keymap.set("n", "<C-b>", function()
    action.smart_scroll_with_saga(-1)
end, { silent = true })
-- or command
vim.keymap.set("n", "gs", "<Cmd>Lspsaga signature_help<CR>", { silent = true })
-- or command
vim.keymap.set("n", "gr", "<cmd>Lspsaga rename<CR>", { silent = true })
-- close rename win use <C-c> in insert mode or `q` in normal mode or `:q`
-- or use command
vim.keymap.set("n", "gd", "<cmd>Lspsaga preview_definition<CR>", { silent = true })
vim.keymap.set("n", "<leader>cd", "<cmd>Lspsaga show_line_diagnostics<CR>", { silent = true })
vim.keymap.set("n", "<leader>cd", "<cmd>Lspsaga show_cursor_diagnostics<CR>", { silent = true })

-- or jump to error
vim.keymap.set("n", "[E", function()
  require("lspsaga.diagnostic").goto_prev({ severity = vim.diagnostic.severity.ERROR })
end, { silent = true })
vim.keymap.set("n", "]E", function()
  require("lspsaga.diagnostic").goto_next({ severity = vim.diagnostic.severity.ERROR })
end, { silent = true })
-- or use command
vim.keymap.set("n", "[e", "<cmd>Lspsaga diagnostic_jump_next<CR>", { silent = true })
vim.keymap.set("n", "]e", "<cmd>Lspsaga diagnostic_jump_prev<CR>", { silent = true })
END
