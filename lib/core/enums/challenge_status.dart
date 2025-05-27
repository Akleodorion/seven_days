enum ChallengeStatus {
  created,
  ongoing,
  done,
  unknown;

  const ChallengeStatus();

  factory ChallengeStatus.fromJson({required String name}) {
    Map<String, ChallengeStatus> map = {
      'created': ChallengeStatus.created,
      'ongoing': ChallengeStatus.ongoing,
      'done': ChallengeStatus.done,
    };

    return map[name] ?? ChallengeStatus.unknown;
  }

  get string {
    Map<ChallengeStatus, String> map = {
      ChallengeStatus.created: 'created',
      ChallengeStatus.ongoing: 'ongoing',
      ChallengeStatus.done: 'done',
    };

    return map[this];
  }
}
