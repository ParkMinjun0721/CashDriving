// 요약: 구매 상품 데이터를 직렬화하는 모델입니다.
// - Firestore 저장을 위한 map 변환을 제공합니다.
// - 구매 내역 리스트를 복원할 때 사용됩니다.
// - 상품 정보와 구매 시점 등의 필드를 담습니다.
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
