enum GameStatus {
  created,
  ongoing,
  over,
  decided,
  archived,
  unknown;

  const GameStatus();

  factory GameStatus.fromJson({required String name}) {
    Map<String, GameStatus> map = {
      'created': GameStatus.created,
      'ongoing': GameStatus.ongoing,
      'over': GameStatus.over,
      'decided': GameStatus.decided,
      'archived': GameStatus.archived,
    };

    return map[name] ?? GameStatus.unknown;
  }
}
