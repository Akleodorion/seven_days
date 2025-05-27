enum PledgeStatus {
  created,
  pending,
  ongoing,
  done,
  unknown;

  const PledgeStatus();

  factory PledgeStatus.fromJson({required String statusName}) {
    final Map<String, PledgeStatus> map = {
      'created': PledgeStatus.created,
      'pending': PledgeStatus.pending,
      'ongoing': PledgeStatus.ongoing,
      'done': PledgeStatus.done,
    };
    return map[statusName] ?? PledgeStatus.unknown;
  }

  get string {
    Map<PledgeStatus, String> map = {
      PledgeStatus.created: 'created',
      PledgeStatus.ongoing: 'ongoing',
      PledgeStatus.done: 'done',
    };

    return map[this];
  }
}
