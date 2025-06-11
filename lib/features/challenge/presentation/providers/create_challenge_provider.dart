import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:seven_days/features/challenge/domain/usecases/create_challenge_usecase.dart';
import 'package:seven_days/features/challenge/presentation/providers/states/create_challenge_state.dart';
import 'package:seven_days/features/challenge/presentation/providers/states/notifiers/create_challenge_notifier.dart';
import 'package:seven_days/injection_container.dart';

final createChallengeProvider =
    StateNotifierProvider<CreateChallengeNotifier, CreateChallengeState>(
  (ref) {
    final CreateChallengeUsecase createChallengeUsecase =
        sl<CreateChallengeUsecase>();
    return CreateChallengeNotifier(
        createChallengeUsecase: createChallengeUsecase);
  },
);
