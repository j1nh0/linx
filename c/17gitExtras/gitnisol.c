/*gitnisol.c*/
}else if(strcmp(applet,"gitnisol")==0){
/*THIS NEEDS WORK*/
 char *gitnisol[1000]={
  "> .gitnisolusage;> .gitnisollog;for GITNISOL in $(cat ./.gitnisol);do cd $GITNISOL;gitreset;sync;cd ..;du -sh $GITNISOL >> .gitnisolusage;sync;done"
/* "if [ -f ./.gitnisol ];then clear;> .gitnisolusage;> .gitnisollog;for GITNISOL in $(cat ./.gitnisol);do cd $GITNISOL;gitreset && echo -e \n$GITNISOL push complete\n >> ../.gitnisollog || echo -e \n$GITNISOL push fail\n >> ../.gitnisollog;sync;cd ..;du $GITNISOL >> .gitnisolusage;sync;done;else echo -e \n\nNOT GIT NISOL REPO\n\n;fi;"*/
 };
 while(gitnisol[i]!=NULL){
  sprintf(cmd,"%s",gitnisol[i]);
  system(cmd);
  i++;
 };
