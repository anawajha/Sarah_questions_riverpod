class CarType {
  int id;
  String locale;
  String name;

  CarType({
    required this.id,
    required this.locale,
    required this.name,
  });

  factory CarType.fromJson(Map<String, dynamic> json) => CarType(
        id: json["id"],
        locale: json["locale"],
        name: json["name"],
      );

  Map<String, dynamic> toJson() => {
        "id": id,
        "locale": locale,
        "name": name,
      };
}
