" normal mode mappings
nnoremap <silent> <Leader>hh :call matchadd('HighlightLineGrey', '\%' . line('.') . 'l')<CR>
nnoremap <silent> <Leader>hr :call matchadd('HighlightLineRed', '\%' . line('.') . 'l')<CR>
nnoremap <silent> <Leader>hy :call matchadd('HighlightLineYellow', '\%' . line('.') . 'l')<CR>
nnoremap <silent> <Leader>hg :call matchadd('HighlightLineGreen', '\%' . line('.') . 'l')<CR>
nnoremap <silent> <Leader>hb :call matchadd('HighlightLineBlue', '\%' . line('.') . 'l')<CR>
nnoremap <silent> <Leader>H :call Clearmatch()<CR>
nnoremap <silent> <Leader>hc :call clearmatches()<CR>

" visual mode mappings
vnoremap <silent> <Leader>hh :<c-u> call VisualAdd(visualmode(), 'HighlightLineGrey')<CR>
vnoremap <silent> <Leader>hr :<c-u> call VisualAdd(visualmode(), 'HighlightLineRed')<CR>
vnoremap <silent> <Leader>hy :<c-u> call VisualAdd(visualmode(), 'HighlightLineYellow')<CR>
vnoremap <silent> <Leader>hg :<c-u> call VisualAdd(visualmode(), 'HighlightLineGreen')<CR>
vnoremap <silent> <Leader>hb :<c-u> call VisualAdd(visualmode(), 'HighlightLineBlue')<CR>
vnoremap <silent> <Leader>hc :<c-u> call VisualClear(visualmode())<CR>
vnoremap <silent> <Leader>H :<c-u> call VisualClear(visualmode())<CR>

" highlight groups
highlight HighlightLineYellow ctermbg=DarkYellow guibg=DarkYellow
highlight HighlightLineBlue ctermbg=DarkBlue guibg=DarkBlue
highlight HighlightLineGreen ctermbg=DarkGreen guibg=DarkGreen
highlight HighlightLineRed ctermbg=DarkRed guibg=DarkRed
highlight HighlightLineGrey ctermbg=DarkGrey guibg=DarkGrey

" functions
function! Clearmatch()
    "
    " Removes all HighlightLine related matches from the current line
    "
    " Parameters
    "   None
    "
    " Returns
    "   None
    "
    let l:matches = getmatches()
    for l:item in l:matches

        let l:line = l:item['pattern'][2:-2]

        if l:line == line('.') && match(l:item['group'], '\vHighlightLine\w+') == 0
            call matchdelete(l:item['id'])
        endif
    endfor
endfunction

function! VisualAdd(type, highlight)
    "
    " Needs to be called from linewise visual mode. Highlight all selected lines
    " with the specified highlighting group.
    "
    " Parameters
    "   type        type of visual selection that was used
    "   highlight   the highlight group to add the selected lines to
    "
    " Returns
    "   None
    "
    if a:type != 'V'
        echo 'Online linewise visual mode is supported'
        return
    endif

    let l:start = getpos("'<")[1]
    let l:end = getpos("'>")[1]

    while l:start <= l:end
        call matchadd(a:highlight, '\%' . l:start . 'l')
        let l:start += 1
    endwhile
endfunction

function! VisualClear(type)
    "
    " Needs to be called from linewise visual mode. Removes HighlightLine
    " related matches from the selected lines.
    "
    " Parameters
    "   type        type of visual selection that was used
    "
    " Returns
    "   None
    "
    if a:type != 'V'
        echo 'Online linewise visual mode is supported'
        return
    endif

    let l:start = getpos("'<")[1]
    let l:end = getpos("'>")[1]

    let l:matches = getmatches()

    for l:item in l:matches

        let l:line = l:item['pattern'][2:-2]

        if (l:start <= l:line) && (l:line <= l:end) && match(l:item['group'], '\vHighlightLine\w+') == 0
            call matchdelete(l:item['id'])
        endif
    endfor
endfunction
