// 요약: 포인트와 구매 이력 상태를 관리합니다.
// - 현재 포인트 값을 전역 상태로 제공합니다.
// - 구매 이력을 추가/갱신하는 API를 포함합니다.
// - 포인트 샵 및 로그인 초기화에 활용됩니다.
import 'package:flutter_riverpod/flutter_riverpod.dart';
import '../models/purchased_product.dart';

final pointProvider = StateNotifierProvider<PointController, int>((ref) {
  return PointController();
});

class PointController extends StateNotifier<int> {
  PointController() : super(20000); // 초기 포인트

  bool purchase(int cost) {
    if (state >= cost) {
      state -= cost;
      return true;
    }
    return false;
  }

  void earn(int amount) {
    state += amount;
  }

  void set(int newValue) {
    state = newValue;
  }
}

final purchaseHistoryProvider =
StateNotifierProvider<PurchaseHistoryController, List<PurchasedProduct>>((ref) {
  return PurchaseHistoryController();
});

class PurchaseHistoryController extends StateNotifier<List<PurchasedProduct>> {
  PurchaseHistoryController() : super([]);

  void add(PurchasedProduct product) {
    state = [...state, product];
  }

  void clear() {
    state = [];
  }

  void setAll(List<PurchasedProduct> products) {
    state = products;
  }
}
