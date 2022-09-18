enum BattleStatus { inProcess, youWin, youLost, draw }

String battleStatusToString(BattleStatus status) {
  switch (status) {
    case BattleStatus.inProcess:
      {
        return "inProcess";
      }
    case BattleStatus.draw:
      {
        return "draw";
      }
    case BattleStatus.youWin:
      {
        return "youWin";
      }
    case BattleStatus.youLost:
      {
        return "youLost";
      }
  }
}

BattleStatus? battleStatusFromString(String string) {
  if (string == "inProcess") {
    return BattleStatus.inProcess;
  }
  if (string == "youWin") {
    return BattleStatus.youWin;
  }
  if (string == "youLost") {
    return BattleStatus.youLost;
  }
  if (string == "draw") {
    return BattleStatus.draw;
  }
  return null;
}
