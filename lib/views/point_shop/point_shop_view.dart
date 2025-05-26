// point_shop_view.dart (with category-filtered product_provider integration)
import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import '../../theme/font.dart';
import '../../theme/theme.dart';
import '../../viewmodels/point_provider.dart';
import '../../viewmodels/product_provider.dart';
import '../../models/product.dart';
import '../../models/purchased_product.dart';
import '../../widgets/bottom_nav_bar.dart';
import '../../widgets/custom_app_bar.dart';

class PointShopView extends ConsumerStatefulWidget {
  const PointShopView({super.key});

  @override
  ConsumerState<PointShopView> createState() => _PointShopViewState();
}

class _PointShopViewState extends ConsumerState<PointShopView> with SingleTickerProviderStateMixin {
  late TabController _tabController;

  @override
  void initState() {
    super.initState();
    _tabController = TabController(length: 3, vsync: this);
  }

  @override
  void dispose() {
    _tabController.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: const CustomAppBar_PointShop(),
      bottomNavigationBar: const BottomNavBar(currentIndex: 3),
      body: Padding(
        padding: const EdgeInsets.symmetric(horizontal: 16),
        child: Column(
          children: [
            const _PointShopSearchSection(),
            const SizedBox(height: 16),
            _PointShopTabSection(tabController: _tabController),
          ],
        ),
      ),
    );
  }
}

class _PointShopSearchSection extends StatelessWidget {
  const _PointShopSearchSection();

  @override
  Widget build(BuildContext context) {
    return TextField(
      decoration: InputDecoration(
        hintText: 'Search products',
        border: OutlineInputBorder(borderRadius: BorderRadius.circular(12)),
        isDense: true,
        contentPadding: const EdgeInsets.symmetric(horizontal: 12, vertical: 10),
      ),
    );
  }
}

class _PointShopTabSection extends ConsumerWidget {
  final TabController tabController;

  const _PointShopTabSection({required this.tabController});

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final allProducts = ref.watch(couponProductProvider);

    final couponProducts = allProducts
        .where((p) => p.category == ProductCategory.coupon)
        .toList();
    final goodsProducts = allProducts
        .where((p) => p.category == ProductCategory.goods)
        .toList();

    return Expanded(
      child: Column(
        children: [
          TabBar(
            controller: tabController,
            indicatorColor: Colors.black,
            labelColor: Colors.black,
            unselectedLabelColor: Colors.grey,
            labelStyle: pretendardBold(context).copyWith(fontSize: 13),
            tabs: const [
              Tab(text: 'Coupon'),
              Tab(text: 'Goods'),
              Tab(text: 'Exchange'),
            ],
          ),
          const SizedBox(height: 16),
          Expanded(
            child: TabBarView(
              controller: tabController,
              children: [
                _ProductGridSection(products: couponProducts),
                _ProductGridSection(products: goodsProducts),
                const Center(child: Text("Cash exchange page coming soon")),
              ],
            ),
          ),
        ],
      ),
    );
  }
}

class _ProductGridSection extends ConsumerWidget {
  final List<Product> products;
  const _ProductGridSection({required this.products});

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final customColors = Theme.of(context).extension<CustomColors>()!;
    final point = ref.watch(pointProvider);
    final pointController = ref.read(pointProvider.notifier);
    final purchaseHistory = ref.read(purchaseHistoryProvider.notifier);

    return GridView.builder(
      padding: const EdgeInsets.only(top: 8),
      gridDelegate: const SliverGridDelegateWithFixedCrossAxisCount(
        crossAxisCount: 2,
        mainAxisSpacing: 16,
        crossAxisSpacing: 16,
        childAspectRatio: 0.75,
      ),
      itemCount: products.length,
      itemBuilder: (context, index) {
        final product = products[index];
        final bool canPurchase = point >= product.point;

        return Container(
          decoration: BoxDecoration(
            borderRadius: BorderRadius.circular(12),
            border: Border.all(color: Colors.grey.shade300),
          ),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.stretch,
            children: [
              Expanded(
                child: Image.network(
                  product.imageUrl,
                  fit: BoxFit.cover,
                  errorBuilder: (context, error, stackTrace) => const Center(child: Text('Image')),
                ),
              ),
              Padding(
                padding: const EdgeInsets.all(8.0),
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Text(product.name, style: pretendardMedium(context)),
                    const SizedBox(height: 4),
                    Text('${product.point} P', style: pretendardRegular(context)),
                    const SizedBox(height: 8),
                    SizedBox(
                      width: double.infinity,
                      child: ElevatedButton(
                        style: ElevatedButton.styleFrom(
                          backgroundColor: canPurchase ? customColors.primary : Colors.grey,
                          foregroundColor: Colors.white,
                          padding: const EdgeInsets.symmetric(vertical: 8),
                          shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(6)),
                        ),
                        onPressed: canPurchase
                            ? () async {
                          final success = pointController.purchase(product.point);
                          if (success) {
                            final updatedProducts = [...ref.read(purchaseHistoryProvider), PurchasedProduct(name: product.name, point: product.point)];
                            purchaseHistory.setAll(updatedProducts);

                            // ✅ Firestore 업데이트
                            final user = FirebaseAuth.instance.currentUser;
                            if (user != null) {
                              await FirebaseFirestore.instance.collection('user').doc(user.uid).update({
                                'point': ref.read(pointProvider),
                                'product': updatedProducts.map((p) => p.toMap()).toList(),
                              });
                            }

                            // ✅ 알림 등
                            ScaffoldMessenger.of(context).showSnackBar(
                              const SnackBar(content: Text('Product purchased!')),
                            );
                          }
                        }
                            : null,
                        child: const Text('Purchase'),
                      ),
                    )
                  ],
                ),
              ),
            ],
          ),
        );
      },
    );
  }
}

