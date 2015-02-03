:map <F7> :!pdflatex %; rm `basename % .tex`.log; rm `basename % .tex`.aux; open `basename % .tex`.pdf <cr>
