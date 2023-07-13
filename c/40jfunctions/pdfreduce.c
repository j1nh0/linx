/*pdfreduce.c*/
}else if(strcmp(applet,"pdfreduce")==0){
 system("for PDF in $(ls *pdf);do gs -sDEVICE=pdfwrite -dCompatabilityLevel=1.4 -dPDFSETTINGS=/ebook -dBATCH -dNOPAUSE -sOutputFile=$PDF.pdf $PDF;cat $PDF.pdf>$PDF;rm $PDF.pdf;done");
