enum ProductCategory {
  coupon,
  goods,
}

class Product {
  final String name;
  final int point;
  final String imageUrl;
  final ProductCategory category;

  Product({
    required this.name,
    required this.point,
    required this.imageUrl,
    required this.category,
  });
}
