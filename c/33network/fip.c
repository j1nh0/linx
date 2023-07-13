/*fip.c*/
}else if(strcmp(applet,"fip")==0){
 void usage(){printf("\nUSAGE: fip ${IP ADDRESS}\n\n");};
 if(argc==1){
  usage();
 }else{
  cls();
  sprintf(cmd,"trace -t %s|grep -e 'IP Address' -e 'Country' -e 'Region' -e 'City' -e 'Zip code' -e 'Time zone' -e 'ISP'",sel);
  system(cmd);
  printf("\n####\n\n");
  sprintf(cmd,"curl https://db-ip.com/%s|grep -e 'ipAddress' -e 'continentCode' -e 'continentName' -e 'countryCode' -e 'countryName' -e 'stateProv' -e 'city'",sel);
  system(cmd);
  printf("\n####\n\n");
  sprintf(cmd,"curl https://www.geolocation.com/?ip=%s | grep -e '\"ip\"' -e '\"country_code\"' -e '\"country_name\"' -e '\"region_name\"' -e '\"city_name\"' -e '\"latitude\"' -e '\"logitude\"' -e '\"zip_code\"' -e '\"time_zone\"' -e '\"asn\"' -e '\"as\"' -e '\"isp\"' -e '\"domain\"' -e '\"net_speed\"' -e '\"idd_code\"' -e '\"area_code\"' -e '\"weather_station_code\"' -e '\"weather_station_name\"' -e '\"mcc\"' -e '\"mnc\"' -e '\"mobile_brand\"' -e '\"elevation\"' -e '\"usage_type\"' -e '\"address_type\"'",sel);
  system(cmd);
  printf("\n####\n\n");
 };
