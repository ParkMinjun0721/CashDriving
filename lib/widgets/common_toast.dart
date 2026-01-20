// 요약: 앱 전역에서 사용하는 토스트 헬퍼입니다.
// - 짧은 메시지를 사용자에게 표준 방식으로 알립니다.
// - 반복되는 토스트 호출을 간단한 API로 감쌉니다.
// - SDK 초기화/권한 안내 등에 활용됩니다.
import 'package:fluttertoast/fluttertoast.dart';

class CommonToast {
  static show(String msg) {
    Fluttertoast.showToast(
      msg: msg,
      toastLength: Toast.LENGTH_SHORT,
    );
  }
}
