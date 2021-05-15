"   _____ _____
"  |  _  |   __|  Piotr Serafin
"  |   __|__   |  https://piotrserafin.dev
"  |__|  |_____|  https://github.com/piotrserafin
"

" VIMWIKI
let personal = {}
let personal.path = '~/Documents/vimwiki/personal.wiki/'
let personal.syntax = 'markdown'
let personal.ext = '.md'
let personal.auto_diary_index = 1

let work = {}
let work.path = '~/Documents/vimwiki/work.wiki/'
let work.syntax = 'markdown'
let work.ext = '.md'
let work.auto_diary_index = 1

let g:vimwiki_list = [personal, work]
let g:vimwiki_markdown_link_ext = 1
let g:vimwiki_global_ext = 0
let g:vimwiki_folding = ''
let g:vimwiki_dir_link = 'index'

" CALENDAR + VIMWIKI
let g:calendar_diary = '~/Documents/vimwiki/work.wiki/diary'
