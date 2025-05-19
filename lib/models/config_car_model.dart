import 'package:flutter/material.dart';
import 'package:tmap_ui_sdk/config/sdk_config.dart';
import 'package:tmap_ui_sdk/tmap_ui_sdk.dart';
import 'package:tmap_ui_sdk/tmap_ui_sdk_manager.dart';

class ConfigCarModel {
  SDKConfig get normalCar => SDKConfig(
    carType: UISDKCarModel.normal,
    fuelType: UISDKFuel.gas,
    showTrafficAccident: true,
    mapTextSize: UISDKMapFontSize.small,
    nightMode: UISDKAutoNightModeType.auto,
    isUseSpeedReactMapScale: true,
    isShowTrafficInRoute: false,
    isShowExitPopupWhenStopDriving: true,
  );
}

Future<void> setCarConfig() async {
  ConfigCarModel model = ConfigCarModel();
  bool? result = await TmapUISDKManager().setConfigSDK(model.normalCar);
  if (result == true) {
    print("차량 설정 적용 완료");
  } else {
    print("차량 설정 적용 실패");
  }
}
