#pdfreduce.sh
~/.bin/pdfreduce)
 find -type f -name "*pdf" -exec gs -sDEVICE=pdfwrite -dCompatabilityLevel=1.4 -dPDFSETTINGS=/ebook -dBATCH -dNOPAUSE -sOutputFile={}.pdf {} \; -exec mv -vf {}.pdf {} \;
 sync
;;
