// 요약: 차량 설정(승용/트럭) 모델을 정의합니다.
// - 차량 타입별 설정 값을 구조화합니다.
// - SDK 설정 호출 시 필요한 파라미터를 제공합니다.
// - 차량 구성 옵션 확장에 대비한 모델입니다.
// lib/models/car_config_model.dart

import 'package:flutter/foundation.dart';              // ← 추가
import 'package:tmap_ui_sdk/config/sdk_config.dart';
import 'package:tmap_ui_sdk/config/uisdk_truck_option.dart';

class CarConfigModel extends ChangeNotifier {          // ← extends ChangeNotifier
  SDKConfig get normalConfig => SDKConfig(
    carType: UISDKCarModel.normal,
    fuelType: UISDKFuel.diesel,
    showTrafficAccident: true,
    mapTextSize: UISDKMapFontSize.small,
    nightMode: UISDKAutoNightModeType.auto,
    isUseSpeedReactMapScale: true,
    isShowTrafficInRoute: true,
    isShowExitPopupWhenStopDriving: true,
    useRealTimeAutoReroute: true,
  );

  SDKConfig get truckConfig => SDKConfig(
    carType: UISDKCarModel.truck,
    truckOption: _truckOption,
    fuelType: UISDKFuel.diesel,
    showTrafficAccident: true,
    mapTextSize: UISDKMapFontSize.large,
    nightMode: UISDKAutoNightModeType.auto,
    isUseSpeedReactMapScale: true,
    isShowTrafficInRoute: true,
    isShowExitPopupWhenStopDriving: false,
    useRealTimeAutoReroute: false,
  );

  UISDKTruckOption get _truckOption => UISDKTruckOption(
    truckHeight: 300, // cm
    truckLength: 0,
    truckLoadingWeight: 25000, // kg
    truckType: TruckType.constructionTruck,
    truckWidth: 0,
  );

// **만약** 런타임에 현재 config를 바꿔야 하고, 그때 UI 갱신이 필요하다면
// 아래처럼 setter를 추가하고 notifyListeners()를 호출하세요.
//
// SDKConfig _currentConfig;
// CarConfigModel() : _currentConfig = normalConfig;
//
// SDKConfig get currentConfig => _currentConfig;
//
// void useTruckConfig() {
//   _currentConfig = truckConfig;
//   notifyListeners();
// }
//
// void useNormalConfig() {
//   _currentConfig = normalConfig;
//   notifyListeners();
// }
}
