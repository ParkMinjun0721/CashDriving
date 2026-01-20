// 요약: 좌표를 주소로 변환하는 리버스 지오코딩 유틸입니다.
// - Google Geocoding API를 사용해 주소를 조회합니다.
// - 위도/경도 기반으로 한국어 주소를 반환합니다.
// - 에러 상황에서는 기본 메시지를 반환합니다.
import 'package:google_geocoding_api/google_geocoding_api.dart';
import 'package:google_maps_flutter/google_maps_flutter.dart';

// Google API 키 설정
const String googleApiKey = 'AIzaSyArz1qIls9zBVmI7ZdFGdTQd8eaocDpb68';  // 여기에 본인의 API 키 입력

Future<String> getPlaceNameFromLatLng(LatLng latLng) async {
  final geocoding = GoogleGeocodingApi(googleApiKey);

  try {
    final response = await geocoding.reverse(
      '${latLng.latitude},${latLng.longitude}',
      language: 'ko',
    );

    if (response.results.isNotEmpty) {
      return response.results.first.formattedAddress ?? "주소 없음";
    } else {
      return "주소를 찾을 수 없음";
    }
  } catch (e) {
    return "에러 발생: ${e.toString()}";
  }
}
