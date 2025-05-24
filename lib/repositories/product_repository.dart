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
