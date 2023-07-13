/*aptmssql.c*/
}else if(strcmp(applet,"aptmssql")==0){
 char *aptmssql[1000]={
  "wget -qO- https://packages.microsoft.com/keys/microsoft.asc | sudo tee /etc/apt/trusted.gpg.d/microsoft.asc",
  "sudo add-apt-repository \"$(wget -qO- https://packages.microsoft.com/config/ubuntu/20.04/mssql-server-2022.list)\"",
  "sudo ACCEPT_EULA=Y DEBIAN_FRONTEND=noninteractive apt -y --install-recommends update",
  "sudo ACCEPT_EULA=Y DEBIAN_FRONTEND=noninteractive apt -y --install-recommends install mssql-server",
  "sudo ACCEPT_EULA=Y DEBIAN_FRONTEND=noninteractive apt -y --install-recommends install curl",
  "sudo apt update",
  "curl https://packages.microsoft.com/keys/microsoft.asc | sudo tee /etc/apt/trusted.gpg.d/microsoft.asc",
  "curl https://packages.microsoft.com/config/ubuntu/20.04/prod.list | sudo tee /etc/apt/sources.list.d/msprod.list",
  "sudo ACCEPT_EULA=Y DEBIAN_FRONTEND=noninteractive apt -y --install-recommends update",
  "sudo ACCEPT_EULA=Y DEBIAN_FRONTEND=noninteractive apt -y --install-recommends install mssql-tools",
  "sudo ACCEPT_EULA=Y DEBIAN_FRONTEND=noninteractive apt -y --install-recommends install unixodbc-dev"
 };
 sprintf(cmd,"%s update",apt);
 system(cmd);
 while(aptmssql[i]!=NULL){
  sprintf(cmd,"%s",aptmssql[i]);
  system(cmd);
  i++;
 };
 system("sudo /opt/mssql/bin/mssql-conf setup");
 sync();
