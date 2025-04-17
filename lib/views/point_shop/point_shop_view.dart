import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import '../../theme/font.dart';
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
      bottomNavigationBar: const BottomNavBar(currentIndex: 0),
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
        hintText: '🔍 상품 검색',
        border: OutlineInputBorder(borderRadius: BorderRadius.circular(12)),
        isDense: true,
        contentPadding: const EdgeInsets.symmetric(horizontal: 12, vertical: 10),
      ),
    );
  }
}

class _PointShopTabSection extends StatelessWidget {
  final TabController tabController;

  const _PointShopTabSection({required this.tabController});

  @override
  Widget build(BuildContext context) {
    return Expanded(
      child: Column(
        children: [
          TabBar(
            controller: tabController,
            indicatorColor: Colors.black,
            labelColor: Colors.black,
            unselectedLabelColor: Colors.grey,
            labelStyle: pretendardBold(context),
            tabs: const [
              Tab(text: '쿠폰'),
              Tab(text: '굿즈'),
              Tab(text: '현금 전환'),
            ],
          ),
          const SizedBox(height: 16),
          Expanded(
            child: TabBarView(
              controller: tabController,
              children: const [
                _ProductGridSection(),
                Center(child: Text("굿즈 페이지 준비 중")),
                Center(child: Text("현금 전환 페이지 준비 중")),
              ],
            ),
          ),
        ],
      ),
    );
  }
}

class _ProductGridSection extends StatelessWidget {
  const _ProductGridSection();

  @override
  Widget build(BuildContext context) {
    final products = [
      {'name': '스타벅스 아메리카노', 'point': '1,000P'},
      {'name': '주유 할인권 3,000원', 'point': '2,000P'},
      {'name': '에코백', 'point': '3,000P'},
      {'name': '텀블러', 'point': '5,000P'},
    ];

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
        return Container(
          decoration: BoxDecoration(
            borderRadius: BorderRadius.circular(12),
            border: Border.all(color: Colors.grey.shade300),
          ),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.stretch,
            children: [
              Expanded(
                child: Container(
                  color: Colors.grey.shade300,
                  child: const Center(child: Text('Image')),
                ),
              ),
              Padding(
                padding: const EdgeInsets.all(8.0),
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Text(product['name']!, style: pretendardMedium(context)),
                    const SizedBox(height: 4),
                    Text(product['point']!, style: pretendardRegular(context)),
                    const SizedBox(height: 8),
                    SizedBox(
                      width: double.infinity,
                      child: ElevatedButton(
                        style: ElevatedButton.styleFrom(
                          backgroundColor: Colors.black,
                          foregroundColor: Colors.white,
                          padding: const EdgeInsets.symmetric(vertical: 8),
                          shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(6)),
                        ),
                        onPressed: () {},
                        child: const Text('교환하기'),
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
