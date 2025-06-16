import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:seven_days/features/challenge/domain/usecases/destroy_challenge_usecase.dart';
import 'package:seven_days/features/challenge/presentation/providers/states/destroy_challenge_state.dart';
import 'package:seven_days/features/challenge/presentation/providers/states/notifiers/destroy_challenge_notifier.dart';
import 'package:seven_days/injection_container.dart';

final destroyChallengeProvider =
    StateNotifierProvider<DestroyChallengeNotifier, DestroyChallengeState>(
  (ref) {
    final DestroyChallengeUsecase destroyChallengeUsecase =
        sl<DestroyChallengeUsecase>();
    return DestroyChallengeNotifier(
        destroyChallengeUsecase: destroyChallengeUsecase);
  },
);
