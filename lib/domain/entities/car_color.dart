class CarColor {
    int id;
    String name;

    CarColor({
        required this.id,
        required this.name,
    });

    factory CarColor.fromJson(Map<String, dynamic> json) => CarColor(
        id: json["id"],
        name: json["name"],
    );

    Map<String, dynamic> toJson() => {
        "id": id,
        "model": name,
    };
}
