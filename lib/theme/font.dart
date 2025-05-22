/// File: font.dart
/// Purpose: Project의 전체 font 관리
/// Author: 박민준
/// Created: 2024-12-28
/// Last Modified: 2024-12-30 by 박민준

import 'package:flutter/material.dart';

/*
    Font 사용 예제

    < 기본 사용법 >
    Text(
      '헤드라인 XL',
      style: heading_xlarge(context),
    ),
    Text(
      '본문 텍스트 Small',
      style: body_small(context),
    ),

    <폰트 크기, 색상 커스터마이징>
    Text(
      '커스텀 폰트 크기',
      style: heading_large(context).copyWith(fontSize: 28),
    ),
    Text(
      '커스텀 폰트 색상',
      style: body_medium(context).copyWith(color: Colors.red),
    ),

    ❄︎ 주의 사항 ❄︎
    Text() 위젯 사용할때 const 붙이면 안됩니다. 오류나요.

    커스텀 폰트 크기는 거의 사용할 일 없을 것으로 사료됩니다.
    커스텀 폰트 색상은 사용 시 추후 해당 부분만 수정해야 할 듯 해서...
        우선 이렇게 사용하되 다른 방법을 고안해 보겠습니다.
 */

//////////////////////////////////////////////////////////////////////
///////                      기본 폰트들                          ///////
//////////////////////////////////////////////////////////////////////


TextStyle pretendardBlack(BuildContext context) {
    return TextStyle(
        fontFamily: 'Pretendard',
        fontWeight: FontWeight.w900,
        fontSize: 16,
        color: Theme.of(context).colorScheme.onSurface, // Light: 검 Dark: 흰
    );
}

TextStyle pretendardExtraBold(BuildContext context) {
    return TextStyle(
        fontFamily: 'Pretendard',
        fontWeight: FontWeight.w800,
        fontSize: 16,
        color: Theme.of(context).colorScheme.onSurface, // Light: 검 Dark: 흰
    );
}

TextStyle pretendardBold(BuildContext context) {
    return TextStyle(
        fontFamily: 'Pretendard',
        fontWeight: FontWeight.w700,
        fontSize: 16,
        color: Theme.of(context).colorScheme.onSurface, // Light: 검 Dark: 흰
    );
}

TextStyle pretendardSemiBold(BuildContext context) {
    return TextStyle(
        fontFamily: 'Pretendard',
        fontWeight: FontWeight.w600,
        fontSize: 16,
        color: Theme.of(context).colorScheme.onSurface, // Light: 검 Dark: 흰
    );
}

TextStyle pretendardMedium(BuildContext context) {
    return TextStyle(
        fontFamily: 'Pretendard',
        fontWeight: FontWeight.w500,
        fontSize: 12,
        color: Theme.of(context).colorScheme.onSurface, // Light: 검 Dark: 흰
    );
}

TextStyle pretendardRegular(BuildContext context) {
    return TextStyle(
        fontFamily: 'Pretendard',
        fontWeight: FontWeight.w400,
        fontSize: 10,
        color: Theme.of(context).colorScheme.onSurface, // Light: 검 Dark: 흰
    );
}

TextStyle pretendardLight(BuildContext context) {
    return TextStyle(
        fontFamily: 'Pretendard',
        fontWeight: FontWeight.w300,
        fontSize: 14,
        color: Theme.of(context).colorScheme.onSurface, // Light: 검 Dark: 흰
    );
}

TextStyle pretendardExtraLight(BuildContext context) {
    return TextStyle(
        fontFamily: 'Pretendard',
        fontWeight: FontWeight.w200,
        fontSize: 16,
        color: Theme.of(context).colorScheme.onSurface, // Light: 검 Dark: 흰
    );
}

TextStyle pretendardThin(BuildContext context) {
    return TextStyle(
        fontFamily: 'Pretendard',
        fontWeight: FontWeight.w100,
        fontSize: 16,
        color: Theme.of(context).colorScheme.onSurface, // Light: 검 Dark: 흰
    );
}

//////////////////////////////////////////////////////////////////////////////////////////////////////
/////////////////////////////////    Design Team 정의 Heading    //////////////////////////////////////
//////////////////////////////////////////////////////////////////////////////////////////////////////

TextStyle heading_xlarge(BuildContext context) {
    return TextStyle(
        fontFamily: 'Pretendard',
        fontWeight: FontWeight.w700,
        fontSize: 32,
        height: 1.5,
        letterSpacing: 1.0,
        color: Theme.of(context).colorScheme.onSurface, // Light: 검 Dark: 흰
    );
}

TextStyle heading_large(BuildContext context) {
    return TextStyle(
        fontFamily: 'Pretendard',
        fontWeight: FontWeight.w700,
        fontSize: 24,
        height: 1.5,
        letterSpacing: 1.0,
        color: Theme.of(context).colorScheme.onSurface, // Light: 검 Dark: 흰
    );
}

TextStyle heading_medium(BuildContext context) {
    return TextStyle(
        fontFamily: 'Pretendard',
        fontWeight: FontWeight.w700,
        fontSize: 22,
        height: 1.5,
        letterSpacing: 0.0,
        color: Theme.of(context).colorScheme.onSurface, // Light: 검 Dark: 흰
    );
}

TextStyle heading_small(BuildContext context) {
    return TextStyle(
        fontFamily: 'Pretendard',
        fontWeight: FontWeight.w700,
        fontSize: 20,
        height: 1.5,
        letterSpacing: 0.0,
        color: Theme.of(context).colorScheme.onSurface, // Light: 검 Dark: 흰
    );
}

TextStyle heading_xsmall(BuildContext context) {
    return TextStyle(
        fontFamily: 'Pretendard',
        fontWeight: FontWeight.w700,
        fontSize: 18,
        height: 1.5,
        letterSpacing: 0.0,
        color: Theme.of(context).colorScheme.onSurface, // Light: 검 Dark: 흰
    );
}

TextStyle heading_xxsmall(BuildContext context) {
    return TextStyle(
        fontFamily: 'Pretendard',
        fontWeight: FontWeight.w700,
        fontSize: 16,
        height: 1.5,
        letterSpacing: 0.0,
        color: Theme.of(context).colorScheme.onSurface, // Light: 검 Dark: 흰
    );
}

//////////////////////////////////////////////////////////////////////////////////////////////////////
/////////////////////////////////      Design Team 정의 Body     //////////////////////////////////////
//////////////////////////////////////////////////////////////////////////////////////////////////////

TextStyle body_large_semi(BuildContext context) {
    return TextStyle(
        fontFamily: 'Pretendard',
        fontWeight: FontWeight.w600,
        fontSize: 20,
        height: 1.5,
        letterSpacing: 0.0,
        color: Theme.of(context).colorScheme.onSurface, // Light: 검 Dark: 흰
    );
}

TextStyle body_medium_semi(BuildContext context) {
    return TextStyle(
        fontFamily: 'Pretendard',
        fontWeight: FontWeight.w600,
        fontSize: 18,
        height: 1.5,
        letterSpacing: 0.0,
        color: Theme.of(context).colorScheme.onSurface, // Light: 검 Dark: 흰
    );
}

TextStyle body_small_semi(BuildContext context) {
    return TextStyle(
        fontFamily: 'Pretendard',
        fontWeight: FontWeight.w600,
        fontSize: 16,
        height: 1.5,
        letterSpacing: 0.0,
        color: Theme.of(context).colorScheme.onSurface, // Light: 검 Dark: 흰
    );
}

TextStyle body_xsmall_semi(BuildContext context) {
    return TextStyle(
        fontFamily: 'Pretendard',
        fontWeight: FontWeight.w600,
        fontSize: 14,
        height: 1.5,
        letterSpacing: 0.0,
        color: Theme.of(context).colorScheme.onSurface, // Light: 검 Dark: 흰
    );
}

TextStyle body_xxsmall_semi(BuildContext context) {
    return TextStyle(
        fontFamily: 'Pretendard',
        fontWeight: FontWeight.w600,
        fontSize: 12,
        height: 1.5,
        letterSpacing: 0.0,
        color: Theme.of(context).colorScheme.onSurface, // Light: 검 Dark: 흰
    );
}

TextStyle body_large(BuildContext context) {
    return TextStyle(
        fontFamily: 'Pretendard',
        fontWeight: FontWeight.w400,
        fontSize: 20,
        height: 1.5,
        letterSpacing: 0.0,
        color: Theme.of(context).colorScheme.onSurface, // Light: 검 Dark: 흰
    );
}

TextStyle body_medium(BuildContext context) {
    return TextStyle(
        fontFamily: 'Pretendard',
        fontWeight: FontWeight.w400,
        fontSize: 18,
        height: 1.5,
        letterSpacing: 0.0,
        color: Theme.of(context).colorScheme.onSurface, // Light: 검 Dark: 흰
    );
}

TextStyle body_small(BuildContext context) {
    return TextStyle(
        fontFamily: 'Pretendard',
        fontWeight: FontWeight.w400,
        fontSize: 16,
        height: 1.5,
        letterSpacing: 0.0,
        color: Theme.of(context).colorScheme.onSurface, // Light: 검 Dark: 흰
    );
}

TextStyle body_xsmall(BuildContext context) {
    return TextStyle(
        fontFamily: 'Pretendard',
        fontWeight: FontWeight.w400,
        fontSize: 14,
        height: 1.5,
        letterSpacing: 0.0,
        color: Theme.of(context).colorScheme.onSurface, // Light: 검 Dark: 흰
    );
}

TextStyle body_xxsmall(BuildContext context) {
    return TextStyle(
        fontFamily: 'Pretendard',
        fontWeight: FontWeight.w400,
        fontSize: 12,
        height: 1.5,
        letterSpacing: 0.0,
        color: Theme.of(context).colorScheme.onSurface, // Light: 검 Dark: 흰
    );
}

//////////////////////////////////////////////////////////////////////////////////////////////////////
/////////////////////////////////        Reading Part Font      //////////////////////////////////////
//////////////////////////////////////////////////////////////////////////////////////////////////////

TextStyle reading_exercise(BuildContext context) {
    return TextStyle(
        fontFamily: 'NotoSerif',
        fontWeight: FontWeight.w400,
        fontSize: 16,
        height: 1.8,
        letterSpacing: 0.0,
        color: Theme.of(context).colorScheme.onSurface, // Light: 검 Dark: 흰
    );
}

TextStyle reading_textstyle(BuildContext context) {
    return TextStyle(
        fontFamily: 'NotoSerif',
        fontWeight: FontWeight.w500,
        fontSize: 18,
        height: 2.3,
        letterSpacing: 0.0,
        color: Theme.of(context).colorScheme.onSurface, // Light: 검 Dark: 흰
    );
}

//////////////////////////////////////////////////////////////////////////////////////////////////////
/////////////////////////////////      폰트 색, 사이즈 등 개별 사용   //////////////////////////////////////
//////////////////////////////////////////////////////////////////////////////////////////////////////

TextStyle pretendardBoldPrimary(BuildContext context) {
    return TextStyle(
        fontFamily: 'Pretendard',
        fontWeight: FontWeight.w700,
        fontSize: 36,
        color: Theme.of(context).colorScheme.primary, // Light: 검 Dark: 흰
    );
}