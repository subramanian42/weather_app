class PageDetails {
  String returnUrl(String cityname) {
    return 'https://api.openweathermap.org/data/2.5/weather?q=$cityname&appid=d81a0484c4938209ae6267b28597236f';
  }
}

final PageDetails user = PageDetails();
