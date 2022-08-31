class UniversityModel {
  late String name;
  late String country;
  late String alphaTwoCode;
  late dynamic stateProvince;
  late List<String?> domains;
  late List<String?> webPages;

  UniversityModel({
    required this.name,
    required this.country,
    required this.alphaTwoCode,
    required this.stateProvince,
    required this.domains,
    required this.webPages,
  });

  factory UniversityModel.fromJson(Map<String, dynamic> json) {
    return UniversityModel(
        name: json['name'],
        country: json['country'],
        alphaTwoCode: json['alpha_two_code'],
        stateProvince: json['state-province'],
        domains: List<String?>.from(json['domains']),
        webPages: List<String?>.from(json['web_pages']));
  }
}
