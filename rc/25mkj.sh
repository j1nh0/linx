mkj(){
 cp -fv ../j1nh0.c ../j1nh0.c.bckp
 echo '/*'>>99closinglink/closinglink.c
 ls */*|cut -d'/' -f2|cut -d'.' -f1|sed --expression='s/^/  "/g'|sed --expression='s/$/",/g'>>99closinglink/closinglink.c
 echo '*/'>>99closinglink/closinglink.c
 nano -ic 99closinglink/closinglink.c
 cat */* > ../j1nh0.c
}
