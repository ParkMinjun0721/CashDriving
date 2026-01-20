// 요약: 에코 미션 목록과 메타데이터 모델입니다.
// - 미션 제목, 보상, 설명 등 메타 정보를 보관합니다.
// - 미션 화면/상태 관리에서 사용됩니다.
// - 추후 서버 연동 데이터 구조로 확장 가능합니다.

// 미션 데이터 모델
class EcoMission {
  final String id;
  final String title;
  final String description;
  final int point;
  final double current;
  final double goal;
  final String currentLabel;
  final String goalLabel;
  final int type; // 0: 일일, 1: 주간, 2: 맞춤형
  bool isAccepted;

  EcoMission({
    required this.id,
    required this.title,
    required this.description,
    required this.point,
    required this.current,
    required this.goal,
    required this.currentLabel,
    required this.goalLabel,
    required this.type,
    this.isAccepted = false,
  });

  EcoMission copyWith({bool? isAccepted}) {
    return EcoMission(
      id: id,
      title: title,
      description: description,
      point: point,
      current: current,
      goal: goal,
      currentLabel: currentLabel,
      goalLabel: goalLabel,
      type: type,
      isAccepted: isAccepted ?? this.isAccepted,
    );
  }
}