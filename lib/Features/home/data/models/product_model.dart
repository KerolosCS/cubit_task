// ignore_for_file: public_member_api_docs, sort_constructors_first
class ProductModel {
  static String img = 'assets/images/image.png';
  final String name;
  final double price;
  int quantity;
  int quanInCart;

  ProductModel({
    required this.name,
    required this.price,
    required this.quantity,
    required this.quanInCart,
  });

  factory ProductModel.fromJson(Map<String, dynamic> json) => ProductModel(
        name: json['name'],
        price: json['price'],
        quantity: json['quantity'],
        quanInCart: json['quanInCart'],
      );

  Map<String, dynamic> toJson() => {
        "name": name,
        "price": price,
        'quantity': quantity,
      };
}
