if exists('g:loaded_syntastic_clojure_cljkondo_checker')
    finish
endif

" I don't actually know why this is important. I just copied it from other
" Syntastic checkers. I know it has something to do with VIM vs VI.
let s:save_cpo = &cpo
set cpo&vim

function! SyntaxCheckers_clojure_cljkondo_GetLocList() dict
    let makeprg = self.makeprgBuild({ 'args': '--lint' })

    let errorformat = '%f:%l:%c:\ Parse\ %t%*[^:]:\ %m,%f:%l:%c:\ %t%*[^:]:\ %m'

    return SyntasticMake({
                \ 'makeprg': makeprg,
                \ 'errorformat': errorformat })
endfunction

call g:SyntasticRegistry.CreateAndRegisterChecker({
            \ 'filetype': 'clojure',
            \ 'name': 'cljkondo',
            \ 'exec': 'clj-kondo' })

let g:loaded_syntastic_clojure_cljkondo_checker = 1

let &cpo = s:save_cpo
unlet s:save_cpo
