" my filetype file
if exists("did_load_filetypes")
  finish
endif

augroup oaldetect
   autocmd BufNewFile,BufRead *.oal setf oal
augroup END

