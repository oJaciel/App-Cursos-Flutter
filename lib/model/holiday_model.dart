class HolidayEntity {
  String? name;
  String? date;

  HolidayEntity({this.name, this.date});

  //Recebendo dados via JSON
  static HolidayEntity fromJson(Map<String, dynamic> map) {
    return HolidayEntity(name: map['name'], date: map['date']);
  }
}
