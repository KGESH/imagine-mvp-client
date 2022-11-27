class PrintVendor {
  late final int id;
  late final int width;
  late final int height;
  late final int price;
  late final int quantity;

  PrintVendor({
    required this.id,
    required this.width,
    required this.height,
    required this.price,
    required this.quantity,
  });

  factory PrintVendor.fromJson(Map<String, dynamic> json) {
    return PrintVendor(
      id: json['id'],
      width: json['width'],
      height: json['height'],
      price: json['price'],
      quantity: json['quantity'],
    );
  }

  Map<String, dynamic> toJson() {
    return {
      'id': id,
      'width': width,
      'height': height,
      'price': price,
      'quantity': quantity,
    };
  }
}
