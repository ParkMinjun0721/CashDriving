// 요약: 공용 확인/안내 다이얼로그를 제공합니다.
// - 제목/버튼 텍스트를 받아 재사용 가능한 UI를 구성합니다.
// - 권한 안내와 같은 UX 흐름에서 사용됩니다.
// - 외부 탭을 막거나 허용하는 옵션을 포함합니다.
import 'package:flutter/material.dart';

Future<T> simpleDialog<T>({
  required BuildContext context,
  String? titleText,
  String? bodyText,
  String? rightButtonText,
  String? leftButtonText,
  VoidCallback? onRightBtnPressed,
  VoidCallback? onLeftBtnPressed,
  bool shouldDismissOnTouchOutside = true,
}) async {
  return await showDialog(
    context: context,
    builder: (BuildContext context) {
      return WillPopScope(
        onWillPop: () async {
          return shouldDismissOnTouchOutside;
        },
        child: Container(
          margin: const EdgeInsets.all(24),
          alignment: Alignment.center,
          child: Card(
            clipBehavior: Clip.hardEdge,
            shape: RoundedRectangleBorder(
              borderRadius: BorderRadius.circular(8),
            ),
            elevation: 5,
            child: Column(
              mainAxisSize: MainAxisSize.min,
              children: [
                if (titleText != null) ...[
                  Container(
                    padding: EdgeInsets.only(
                      top: bodyText != null ? 32 : 48,
                      bottom: bodyText != null ? 12 : 48,
                      right: 20,
                      left: 20,
                    ),
                    child: Text(
                      titleText,
                      textAlign: TextAlign.center,
                      style: const TextStyle(
                          color: Color(0xFF171819),
                          fontSize: 18,
                          height: 24 / 18),
                    ),
                  ),
                ],
                if (bodyText != null) ...[
                  Container(
                    padding: EdgeInsets.only(
                      top: titleText != null ? 12 : 48,
                      bottom: titleText != null ? 32 : 48,
                      left: 20,
                      right: 20,
                    ),
                    child: Text(
                      bodyText,
                      textAlign: TextAlign.center,
                      style: const TextStyle(
                          color: Color(0xFF8C9299),
                          fontSize: 14,
                          height: 20 / 14),
                    ),
                  ),
                ],
                Row(
                  children: [
                    if (leftButtonText != null) ...[
                      Expanded(
                        child: InkWell(
                          onTap: () {
                            onLeftBtnPressed?.call();
                            if (shouldDismissOnTouchOutside) {
                              Navigator.pop(context);
                            }
                          },
                          child: Container(
                            width: double.infinity,
                            height: 52,
                            color: const Color(0xFFEEF0F3),
                            alignment: Alignment.center,
                            child: Text(
                              leftButtonText,
                              style: const TextStyle(
                                color: Color(0xFF171819),
                                fontSize: 16,
                                height: 22 / 16,
                              ),
                            ),
                          ),
                        ),
                      ),
                    ],
                    if (rightButtonText != null) ...[
                      Expanded(
                        child: InkWell(
                          onTap: () {
                            onRightBtnPressed?.call();
                            if (shouldDismissOnTouchOutside) {
                              Navigator.pop(context);
                            }
                          },
                          child: Container(
                            width: double.infinity,
                            height: 52,
                            color: const Color(0xFF0064FF),
                            alignment: Alignment.center,
                            child: Text(
                              rightButtonText,
                              style: const TextStyle(
                                color: Colors.white,
                                fontSize: 16,
                                height: 22 / 16,
                              ),
                            ),
                          ),
                        ),
                      ),
                    ],
                  ],
                ),
              ],
            ),
          ),
        ),
      );
    },
  );
}
