import 'package:flutter_riverpod/flutter_riverpod.dart';
import '../models/product.dart';

final couponProductProvider = Provider<List<Product>>((ref) {
  return [
    Product(
      name: 'Starbucks Americano',
      point: 1000,
      imageUrl: 'https://content-prod-live.cert.starbucks.com/binary/v2/asset/137-98029.jpg',
      category: ProductCategory.coupon,
    ),
    Product(
      name: 'Eco Tumbler Beverage Coupon',
      point: 5000,
      imageUrl: 'https://www.wishbucket.io/_next/image?url=https%3A%2F%2Fd2gfz7wkiigkmv.cloudfront.net%2Fpickin%2F2%2F1%2F2%2FniWWNcWJTym0e_cTMettoQ&w=1080&q=75',
      category: ProductCategory.coupon,
    ),
    Product(
      name: 'Tumbler',
      point: 2000,
      imageUrl: 'https://shopsolestatesboro.com/cdn/shop/files/19998707_2d059bd1-af32-4a16-a0b1-5c1194e0c060_1.jpg?v=1702586323',
      category: ProductCategory.goods,
    ),
    Product(
      name: 'Eco Bag',
      point: 3000,
      imageUrl: 'https://totebagmart.com/cdn/shop/files/wholesale-cotton-cn1515.webp?v=1709645152',
      category: ProductCategory.goods,
    ),
  ];
});
