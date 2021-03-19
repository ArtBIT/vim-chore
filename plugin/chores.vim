" Header {{{
" plugin:
"   Vim Chores
"
" desc.:
"   A tiny plugin for running tedious tasks.
"
" }}}
"
"early exit if loaded
if exists("chores#loaded")
    finish
endif

" Save CPO {{{
let s:save_cpo = &cpo
set cpo&vim
" }}}
"

" Default config options {{{
" taken from https://github.com/Shougo/neomru.vim/blob/master/autoload/neomru.vim
function! chores#set_default(var, val, ...)  
    if !exists(a:var)
        let alternate_var = get(a:000, 0, '')
        let {a:var} = exists(alternate_var) ? {alternate_var} : a:val
    endif
endfunction 

let s:defaults = {
            \ 'About': 'A tiny plugin for running tedious tasks.'
            \ }

call chores#set_default('g:Chores', s:defaults)
"}}}
 
" chores#get function {{{
function! chores#get()
    let chore_dict = exists('g:chores_dict_name') ? g:chores_dict_name : 'g:VimChores'
	return {chore_dict}
endfunction
"}}}

" chores#list function {{{
function! chores#list(dict)
	let index = 1
	let list = ['Pick a chore:']

	for key in sort(keys(a:dict))
		let list = add(l:list, l:index . ': ' . key)
		let index+=1
	endfor

	return l:list
endfunction
"}}}
 
" chores#pick function {{{
function! chores#run()
    let chores_dict = chores#get()
    let list = chores#list(chores_dict)
	let chore = inputlist(l:list)

	if (l:chore != 0 && l:chore <= len(chores_dict))
		let keys = sort(keys(chores_dict))
        let index = l:chore - 1
        let key = l:keys[l:index]
        echo ""
		execute chores_dict[key]
	endif
endfunction
"}}}

nnoremap <leader>ch :call chores#run()<CR>

"set script as loaded
let chores#loaded = 1

" Restore CPO {{{
let &cpo = s:save_cpo
unlet s:save_cpo
" }}}
