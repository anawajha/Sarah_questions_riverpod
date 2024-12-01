class CarModel {
    int id;
    String model;

    CarModel({
        required this.id,
        required this.model,
    });

    factory CarModel.fromJson(Map<String, dynamic> json) => CarModel(
        id: json["id"],
        model: json["model"],
    );

    Map<String, dynamic> toJson() => {
        "id": id,
        "model": model,
    };
}
