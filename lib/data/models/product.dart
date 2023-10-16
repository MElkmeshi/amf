class Product {
  int? id;
  String? title;
  String? brand;
  int? size;
  String? color;
  String? addtions;
  int? price;
  String? pictureLink;

  Product(
      {this.id,
        this.title,
        this.brand,
        this.size,
        this.color,
        this.addtions,
        this.price,
        this.pictureLink});

  Product.fromJson(Map<String, dynamic> json) {
    id = json['Id'];
    title = json['Title'];
    brand = json['Brand'];
    size = json['Size'];
    color = json['Color'];
    addtions = json['Addtions'];
    price = json['Price'];
    pictureLink = json['pictureLink'];
  }

  Map<String, dynamic> toJson() {
    return {
      'id': id,
      'title': title,
      'brand': brand,
      'size': size,
      'color': color,
      'addtions': addtions,
      "price": price,
    };
  }
}
