// 요약: 주행 요청 데이터와 모드를 관리합니다.
// - 출발/도착지 설정을 저장하고 제공합니다.
// - 에코 주행 여부 등 주행 옵션을 보관합니다.
// - 주행 시작 화면에서 참조됩니다.
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:example_tmap_navi/models/drive_model.dart';

final driveModelProvider = ChangeNotifierProvider<DriveModel>((ref) {
  return DriveModel();
});
