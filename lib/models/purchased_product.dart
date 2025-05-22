class PurchasedProduct {
  final String name;
  final int point;

  PurchasedProduct({
    required this.name,
    required this.point,
  });

  @override
  String toString() => '$name ($point P)';
}