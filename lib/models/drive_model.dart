// 요약: 주행 요청 데이터와 상태를 담는 모델입니다.
// - 출발지/도착지 좌표와 이름을 저장합니다.
// - 주행 모드(에코/일반) 선택 값을 보관합니다.
// - 경로 요청 시 필요한 데이터 구조를 제공합니다.
import 'package:flutter/foundation.dart';
import 'package:tmap_ui_sdk/route/data/planning_option.dart';
import 'package:tmap_ui_sdk/route/data/route_point.dart';
import 'package:tmap_ui_sdk/route/data/route_request_data.dart';

class DriveModel extends ChangeNotifier {
  bool safeDriving = false;
  bool continueDriving = false;

  // ✨ 사용자가 고른 좌표를 저장할 필드
  RoutePoint? _selectedSource;
  RoutePoint? _selectedDestination;

  /// 외부에서 출발지 설정할 때 호출
  void setSource(RoutePoint src) {
    _selectedSource = src;
    notifyListeners();
  }

  /// 외부에서 목적지 설정할 때 호출
  void setDestination(RoutePoint dest) {
    _selectedDestination = dest;
    notifyListeners();
  }

  // ★ mode 플래그 전용 setter
  void setSafeDriving(bool val) {
    safeDriving = val;
    // 이어주행 모드는 반대
    // continueDriving = false;
    if (val) continueDriving = false;
    notifyListeners();
  }

  void setContinueDriving(bool val) {
    continueDriving = val;
    if (val) safeDriving = false;
    notifyListeners();
  }

  /// 실제 Tmap에 넘길 요청 데이터
  RouteRequestData get routeRequestData {
    // 모드 플래그가 켜져 있으면 안전/이어주행 옵션만 보낸다
    if (safeDriving || continueDriving) {
      return RouteRequestData(
        safeDriving: safeDriving,
        continueDriving: continueDriving,
      );
    }

    // ① 유저가 선택한 좌표가 있으면 그것, 없으면 기본값
    final source = _selectedSource ??
        RoutePoint(latitude: 36.102305, longitude: 129.391364, name: "한동대학교 벧엘관");
    final destination = _selectedDestination ??
        RoutePoint(latitude: 36.082299, longitude: 129.398445, name: "하나로마트");

    // ② 나머지 옵션들
    final options = [PlanningOption.recommend, PlanningOption.shortest];
    // final wayPoints = <RoutePoint>[
    //   RoutePoint(
    //       latitude: 37.563343, longitude: 126.987702, name: "명동성당"),
    //   RoutePoint(
    //       latitude: 37.575672, longitude: 126.977039, name: "광화문"),
    // ];

    return RouteRequestData(
      source: source,
      destination: destination,
      // wayPoints: wayPoints,
      routeOption: options,
    );
  }
}