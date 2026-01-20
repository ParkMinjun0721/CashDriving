// 요약: Provider 기반 레거시 앱 엔트리입니다.
// - `MultiProvider`로 모델을 주입합니다.
// - `MaterialApp.router`에 기본 테마와 라우터를 연결합니다.
// - 현재는 Riverpod 기반 구조와 병행되는 레거시 경로입니다.
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:example_tmap_navi/common/app_routes.dart';
import 'package:example_tmap_navi/models/car_config_model.dart';
import 'package:example_tmap_navi/models/drive_model.dart';

class TmapExampleApp extends StatelessWidget {
  const TmapExampleApp({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return MultiProvider(
      providers: [
        Provider(create: (context) => CarConfigModel()),
        Provider(create: (context) => DriveModel()),
      ],
      child: MaterialApp.router(
        title: 'Tmap UI SDK Example',
        theme: ThemeData(
          primarySwatch: Colors.blue,
        ),
        debugShowCheckedModeBanner: false,
        routerConfig: router(),
      ),
    );
  }
}
