import 'package:flutter/material.dart';
import 'package:tmap_ui_sdk/config/sdk_config.dart';
import 'package:tmap_ui_sdk/tmap_ui_sdk.dart';

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
