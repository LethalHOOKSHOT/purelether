import '../widgets/game_screen/battle_status.dart';

class Statistics {
  String id;
  String userId;
  int wins;
  int draws;
  int loses;
  BattleStatus lastBattleStatus;

  Statistics(
      {required this.id,
      required this.userId,
      this.draws = 0,
      this.loses = 0,
      this.wins = 0,
      this.lastBattleStatus = BattleStatus.inProcess});

  Map<String, dynamic> toJson() => {
        "id": id,
        "userId": userId,
        "wins": wins,
        "draws": draws,
        "loses": loses,
        "lastBattleStatus": battleStatusToString(lastBattleStatus)
      };

  static Statistics fromJson(Map<String, dynamic> json) => Statistics(
      id: json['id'],
      userId: json['userId'],
      wins: json['wins'],
      loses: json['loses'],
      draws: json['draws'],
      lastBattleStatus: battleStatusFromString(json['lastBattleStatus'])!);

  @override
  String toString() {
    return "Statistics{id: $id, userId: $userId, wins: $wins, loses: $loses, draws: $draws, lastBattleStatus: $lastBattleStatus";
  }
}
