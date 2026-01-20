// 요약: 상품 정보를 담는 모델입니다.
// - 카테고리, 포인트 가격, 이미지 URL을 포함합니다.
// - 포인트 샵 UI와 구매 로직에서 사용됩니다.
// - 상품 타입 분류를 위한 enum을 제공합니다.
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
