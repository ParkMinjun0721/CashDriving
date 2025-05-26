class PurchasedProduct {
  final String name;
  final int point;

  PurchasedProduct({
    required this.name,
    required this.point,
  });

  /// Firestore에서 불러온 Map → PurchasedProduct 객체로 변환
  factory PurchasedProduct.fromMap(Map<String, dynamic> map) {
    return PurchasedProduct(
      name: map['name'] ?? 'Unknown',
      point: map['point'] ?? 0,
    );
  }

  /// PurchasedProduct 객체 → Firestore에 저장할 Map 형태로 변환
  Map<String, dynamic> toMap() {
    return {
      'name': name,
      'point': point,
    };
  }

  @override
  String toString() => '$name ($point P)';
}
