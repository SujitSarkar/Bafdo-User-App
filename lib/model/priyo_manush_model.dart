class PriyoManushModel {
  String? name;
  String? relation;
  String? specialDay;
  String? date;
  String? imageLink;

  PriyoManushModel({
    this.name, this.relation, this.specialDay, this.date, this.imageLink});
}

List<PriyoManushModel> priyomanushDataList() {
  List<PriyoManushModel> lst = [];
  lst.add(PriyoManushModel(
      name: 'Sumon Ahmed',
      relation: 'Brother',
      specialDay: 'Brother\'s Day',
      date: '04 / 03 / 2021',
      imageLink: 'assets/app_icon/body_icon/priyo_male.png'
  ));
  lst.add(PriyoManushModel(
      name: 'Afridi sheikh',
      relation: 'Brother',
      specialDay: 'Brother\'s Day',
      date: '04 / 03 / 2021',
      imageLink: 'assets/app_icon/body_icon/priyo_female.png'
  ));
  lst.add(PriyoManushModel(
      name: 'Afridi sheikh',
      relation: 'Brother',
      specialDay: 'Brother\'s Day',
      date: '04 / 03 / 2021',
      imageLink: 'assets/app_icon/body_icon/priyo_male.png'
  ));  lst.add(PriyoManushModel(
      name: 'Afridi sheikh',
      relation: 'Brother',
      specialDay: 'Brother\'s Day',
      date: '04 / 03 / 2021',
      imageLink: 'assets/app_icon/body_icon/priyo_female.png'
  ));  lst.add(PriyoManushModel(
      name: 'Afridi sheikh',
      relation: 'Brother',
      specialDay: 'Brother\'s Day',
      date: '04 / 03 / 2021',
      imageLink: 'assets/app_icon/body_icon/priyo_male.png'
  ));
  lst.add(PriyoManushModel(
      name: 'Sumon Ahmed',
      relation: 'Brother',
      specialDay: 'Brother\'s Day',
      date: '04 / 03 / 2021',
      imageLink: 'assets/app_icon/body_icon/priyo_male.png'
  ));
  lst.add(PriyoManushModel(
      name: 'Sumon Ahmed',
      relation: 'Brother',
      specialDay: 'Brother\'s Day',
      date: '04 / 03 / 2021',
      imageLink: 'assets/app_icon/body_icon/priyo_male.png'
  ));

  return lst;
}