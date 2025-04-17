
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