enum Station {
  myZUkrainy,
  pl,
}

extension StationExtension on Station {
  static Station fromString(String value) => Station.values.firstWhere((element) => element.toString() == value);
}
