# example_tmap_navi

Tmap UI SDK 기반의 내비게이션/에코 드라이빙 데모 앱입니다. Google 로그인과 Firebase 연동, 주행 통계·포인트·미션·상점 등 앱 흐름을 포함합니다.

## 프로젝트 정보
- 과목: 인간과 컴퓨터 상호작용 수업 프로젝트
- 팀명: HGU (Hot Guy Union)
- 팀 구성: 김승환, 김예찬, 김유겸, 양찬, 최재효, 박민준
- 기획: 전원
- 메인 개발: 김승환, 김예찬, 김유겸, 박민준
- 계산 알고리즘: 최재효
- 논문 및 보고서: 최재효, 양찬

## 주요 기능
- Google 로그인 및 Firebase 사용자 데이터 생성/조회
- Tmap UI SDK 초기화 및 주행 시작
- 출발/도착지 선택(구글 지도 + 리버스 지오코딩)
- 에코 드라이빙 지표 계산(급가속/급감속/안정 주행) 및 주행 요약
- 대시보드(에코 스코어 트렌드, 탄소 절감, 랭킹 등)
- 포인트 샵(쿠폰/굿즈) 및 구매 이력 상태 관리
- 하단 탭 네비게이션(Home/Dashboard/Mission/Shop/MyPage)

## 기술 스택
- Flutter 3.8+, Dart
- 상태 관리: Riverpod(주) + Provider(일부 레거시)
- 라우팅: GoRouter
- 지도/위치: Tmap UI SDK, Google Maps, Geolocator
- 인증/데이터: Firebase Auth, Cloud Firestore, Firebase Storage

## 프로젝트 구조
- `lib/main.dart`: Firebase 초기화, 앱 엔트리
- `lib/routes/app_routes.dart`: GoRouter 라우팅
- `lib/services/tmap_sdk_initializer.dart`: Tmap SDK 초기화/권한
- `lib/pages/drive/drive_page.dart`: 주행 이벤트 수집 및 에코 점수 계산
- `lib/pages/location/location_picker_page.dart`: 출발/도착지 선택
- `lib/views/*`: 화면(UI) 구성
- `lib/viewmodels/*`: Riverpod 상태 관리
- `tmap_ui_sdk_local/`: 로컬 Tmap UI SDK 패키지

## 실행 전 설정
아래 값들은 실제 서비스 키로 교체해야 합니다.

1) Tmap UI SDK 키 설정
- `lib/services/tmap_sdk_initializer.dart`의 `AuthData` 값
- `lib/pages/root/root_page.dart`의 `AuthData` 값

2) Google Maps/Geocoding API 키 설정
- `lib/pages/location/placename_getter.dart`의 `googleApiKey`

3) Firebase 설정
- `firebase_options.dart`가 포함되어 있으나, 실제 프로젝트로 쓰려면 `flutterfire configure`로 재생성하고 각 플랫폼 설정 파일을 반영하세요.
  - Android: `android/app/google-services.json`
  - iOS: `ios/Runner/GoogleService-Info.plist`

4) 위치 권한
- AndroidManifest/iOS Info.plist에 위치 권한이 필요합니다.
  - 관련 로직: `lib/services/location_utils.dart`, `lib/utils/location_utils.dart`

## 실행 방법
```bash
flutter pub get
flutter run
```

## 참고 사항
- 일부 화면은 데모/플레이스홀더가 포함되어 있습니다(예: DrivingMapView, PointShop의 Exchange 탭).
- Tmap UI SDK는 로컬 패키지(`tmap_ui_sdk_local`)를 사용합니다. 필요 시 SDK 제공처 문서를 참고해 업데이트하세요.
