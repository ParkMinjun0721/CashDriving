// 요약: 상품 데이터 제공을 위한 레포지토리 계층입니다.
// - 카테고리별 상품 목록을 구성해 제공합니다.
// - UI에서 필요한 기본 데이터를 정리합니다.
// - 향후 원격 데이터 소스와 연동하기 위한 분리 계층입니다.
// repositories/product_repository.dart
import '../models/product.dart';

final List<Product> couponProducts = [
  Product(
    name: 'Starbucks Americano',
    point: 1000,
    imageUrl: 'https://example.com/starbucks.jpg',
    category: ProductCategory.coupon,
  ),
  Product(
    name: 'Gas Discount Coupon 3,000₩',
    point: 2000,
    imageUrl: 'https://example.com/gas_coupon.jpg',
    category: ProductCategory.coupon,
  ),
  Product(
    name: 'Eco Bag',
    point: 3000,
    imageUrl: 'https://example.com/eco_bag.jpg',
      category: ProductCategory.goods,
  ),
  Product(
    name: 'Tumbler',
    point: 5000,
    imageUrl: 'https://example.com/tumbler.jpg',
      category: ProductCategory.goods,
  ),
];
