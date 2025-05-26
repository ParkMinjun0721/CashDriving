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
