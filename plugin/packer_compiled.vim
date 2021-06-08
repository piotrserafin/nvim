" Automatically generated packer.nvim plugin loader code

if !has('nvim-0.5')
  echohl WarningMsg
  echom "Invalid Neovim version for packer.nvim!"
  echohl None
  finish
endif

packadd packer.nvim

try

lua << END
  local time
  local profile_info
  local should_profile = false
  if should_profile then
    local hrtime = vim.loop.hrtime
    profile_info = {}
    time = function(chunk, start)
      if start then
        profile_info[chunk] = hrtime()
      else
        profile_info[chunk] = (hrtime() - profile_info[chunk]) / 1e6
      end
    end
  else
    time = function(chunk, start) end
  end
  
local function save_profiles(threshold)
  local sorted_times = {}
  for chunk_name, time_taken in pairs(profile_info) do
    sorted_times[#sorted_times + 1] = {chunk_name, time_taken}
  end
  table.sort(sorted_times, function(a, b) return a[2] > b[2] end)
  local results = {}
  for i, elem in ipairs(sorted_times) do
    if not threshold or threshold and elem[2] > threshold then
      results[i] = elem[1] .. ' took ' .. elem[2] .. 'ms'
    end
  end

  _G._packer = _G._packer or {}
  _G._packer.profile_output = results
end

time("Luarocks path setup", true)
local package_path_str = "/Users/piotr_serafin/.cache/nvim/packer_hererocks/2.1.0-beta3/share/lua/5.1/?.lua;/Users/piotr_serafin/.cache/nvim/packer_hererocks/2.1.0-beta3/share/lua/5.1/?/init.lua;/Users/piotr_serafin/.cache/nvim/packer_hererocks/2.1.0-beta3/lib/luarocks/rocks-5.1/?.lua;/Users/piotr_serafin/.cache/nvim/packer_hererocks/2.1.0-beta3/lib/luarocks/rocks-5.1/?/init.lua"
local install_cpath_pattern = "/Users/piotr_serafin/.cache/nvim/packer_hererocks/2.1.0-beta3/lib/lua/5.1/?.so"
if not string.find(package.path, package_path_str, 1, true) then
  package.path = package.path .. ';' .. package_path_str
end

if not string.find(package.cpath, install_cpath_pattern, 1, true) then
  package.cpath = package.cpath .. ';' .. install_cpath_pattern
end

time("Luarocks path setup", false)
time("try_loadstring definition", true)
local function try_loadstring(s, component, name)
  local success, result = pcall(loadstring(s))
  if not success then
    vim.schedule(function()
      vim.api.nvim_notify('packer.nvim: Error running ' .. component .. ' for ' .. name .. ': ' .. result, vim.log.levels.ERROR, {})
    end)
  end
  return result
end

time("try_loadstring definition", false)
time("Defining packer_plugins", true)
_G.packer_plugins = {
  ["calendar-vim"] = {
    loaded = true,
    path = "/Users/piotr_serafin/.local/share/nvim/site/pack/packer/start/calendar-vim"
  },
  ["glow.nvim"] = {
    loaded = true,
    path = "/Users/piotr_serafin/.local/share/nvim/site/pack/packer/start/glow.nvim"
  },
  ["goyo.vim"] = {
    loaded = true,
    path = "/Users/piotr_serafin/.local/share/nvim/site/pack/packer/start/goyo.vim"
  },
  gruvbox = {
    loaded = true,
    path = "/Users/piotr_serafin/.local/share/nvim/site/pack/packer/start/gruvbox"
  },
  ["lightline.vim"] = {
    loaded = true,
    path = "/Users/piotr_serafin/.local/share/nvim/site/pack/packer/start/lightline.vim"
  },
  ["limelight.vim"] = {
    loaded = true,
    path = "/Users/piotr_serafin/.local/share/nvim/site/pack/packer/start/limelight.vim"
  },
  ["lspkind-nvim"] = {
    loaded = true,
    path = "/Users/piotr_serafin/.local/share/nvim/site/pack/packer/start/lspkind-nvim"
  },
  ["lspsaga.nvim"] = {
    loaded = true,
    path = "/Users/piotr_serafin/.local/share/nvim/site/pack/packer/start/lspsaga.nvim"
  },
  ["markdown-preview.nvim"] = {
    loaded = true,
    path = "/Users/piotr_serafin/.local/share/nvim/site/pack/packer/start/markdown-preview.nvim"
  },
  ["nvim-colorizer.lua"] = {
    loaded = true,
    path = "/Users/piotr_serafin/.local/share/nvim/site/pack/packer/start/nvim-colorizer.lua"
  },
  ["nvim-compe"] = {
    loaded = true,
    path = "/Users/piotr_serafin/.local/share/nvim/site/pack/packer/start/nvim-compe"
  },
  ["nvim-lspconfig"] = {
    loaded = true,
    path = "/Users/piotr_serafin/.local/share/nvim/site/pack/packer/start/nvim-lspconfig"
  },
  ["nvim-tree.lua"] = {
    loaded = true,
    path = "/Users/piotr_serafin/.local/share/nvim/site/pack/packer/start/nvim-tree.lua"
  },
  ["nvim-treesitter"] = {
    loaded = true,
    path = "/Users/piotr_serafin/.local/share/nvim/site/pack/packer/start/nvim-treesitter"
  },
  ["nvim-web-devicons"] = {
    loaded = true,
    path = "/Users/piotr_serafin/.local/share/nvim/site/pack/packer/start/nvim-web-devicons"
  },
  ["packer.nvim"] = {
    loaded = true,
    path = "/Users/piotr_serafin/.local/share/nvim/site/pack/packer/start/packer.nvim"
  },
  playground = {
    loaded = true,
    path = "/Users/piotr_serafin/.local/share/nvim/site/pack/packer/start/playground"
  },
  ["plenary.nvim"] = {
    loaded = true,
    path = "/Users/piotr_serafin/.local/share/nvim/site/pack/packer/start/plenary.nvim"
  },
  ["popup.nvim"] = {
    loaded = true,
    path = "/Users/piotr_serafin/.local/share/nvim/site/pack/packer/start/popup.nvim"
  },
  ["symbols-outline.nvim"] = {
    loaded = true,
    path = "/Users/piotr_serafin/.local/share/nvim/site/pack/packer/start/symbols-outline.nvim"
  },
  taskwiki = {
    loaded = true,
    path = "/Users/piotr_serafin/.local/share/nvim/site/pack/packer/start/taskwiki"
  },
  ["telescope-fzy-native.nvim"] = {
    loaded = true,
    path = "/Users/piotr_serafin/.local/share/nvim/site/pack/packer/start/telescope-fzy-native.nvim"
  },
  ["telescope.nvim"] = {
    loaded = true,
    path = "/Users/piotr_serafin/.local/share/nvim/site/pack/packer/start/telescope.nvim"
  },
  ultisnips = {
    loaded = true,
    path = "/Users/piotr_serafin/.local/share/nvim/site/pack/packer/start/ultisnips"
  },
  ["vim-be-good"] = {
    loaded = true,
    path = "/Users/piotr_serafin/.local/share/nvim/site/pack/packer/start/vim-be-good"
  },
  ["vim-boxdraw"] = {
    loaded = true,
    path = "/Users/piotr_serafin/.local/share/nvim/site/pack/packer/start/vim-boxdraw"
  },
  ["vim-commentary"] = {
    loaded = true,
    path = "/Users/piotr_serafin/.local/share/nvim/site/pack/packer/start/vim-commentary"
  },
  ["vim-floaterm"] = {
    loaded = true,
    path = "/Users/piotr_serafin/.local/share/nvim/site/pack/packer/start/vim-floaterm"
  },
  ["vim-fugitive"] = {
    loaded = true,
    path = "/Users/piotr_serafin/.local/share/nvim/site/pack/packer/start/vim-fugitive"
  },
  ["vim-maximizer"] = {
    loaded = true,
    path = "/Users/piotr_serafin/.local/share/nvim/site/pack/packer/start/vim-maximizer"
  },
  ["vim-surround"] = {
    loaded = true,
    path = "/Users/piotr_serafin/.local/share/nvim/site/pack/packer/start/vim-surround"
  },
  ["vim-tmux"] = {
    loaded = true,
    path = "/Users/piotr_serafin/.local/share/nvim/site/pack/packer/start/vim-tmux"
  },
  ["vim-tmux-navigator"] = {
    loaded = true,
    path = "/Users/piotr_serafin/.local/share/nvim/site/pack/packer/start/vim-tmux-navigator"
  },
  vimwiki = {
    loaded = true,
    path = "/Users/piotr_serafin/.local/share/nvim/site/pack/packer/start/vimwiki"
  }
}

time("Defining packer_plugins", false)
if should_profile then save_profiles() end

END

catch
  echohl ErrorMsg
  echom "Error in packer_compiled: " .. v:exception
  echom "Please check your config for correctness"
  echohl None
endtry
