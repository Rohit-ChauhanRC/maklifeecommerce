class SellModel {
  int? id;
  String? productName;
  String? productId;
  String? productWeight;
  String? price;
  String? productQuantity;
  String? receivingDate;

  SellModel({
    this.id,
    this.productName,
    this.productId,
    this.productWeight,
    this.price,
    this.receivingDate,
    this.productQuantity,
  });

  factory SellModel.fromMap(Map<String, dynamic> json) => SellModel(
        id: json["id"] ?? 0,
        productName: json["productName"] ?? "",
        productId: json["productId"] ?? "",
        productWeight: json["productWeight"] ?? "",
        price: json["price"] ?? "",
        productQuantity: json["productQuantity"].toString() ?? "",
        receivingDate: json["receivingDate"] ?? "",
      );

  Map<String, dynamic> toMap() => {
        "id": id,
        "productName": productName,
        "productId": productId,
        "productWeight": productWeight,
        "price": price,
        "productQuantity": productQuantity,
        "receivingDate": receivingDate,
      };
}
