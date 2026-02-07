class CountryModel {
  final String name;
  late final String tag;

  CountryModel({required this.name}) {
    tag = name[0].toUpperCase();
  }
}
