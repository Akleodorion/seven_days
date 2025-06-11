import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:seven_days/features/game/presentation/providers/active_game_provider.dart';
import 'package:seven_days/features/player/presentation/providers/current_player_provider.dart';
import 'package:seven_days/features/player/presentation/providers/fetch_players_provider.dart';
import 'package:seven_days/features/player/presentation/providers/states/current_player_state.dart';
import 'package:seven_days/pages/main_page.dart';

class InitialPage extends ConsumerStatefulWidget {
  const InitialPage({super.key});

  @override
  ConsumerState<InitialPage> createState() => _InitialPageState();
}

class _InitialPageState extends ConsumerState<InitialPage> {
  Future<CurrentPlayerState> _futureState() async {
    final state = ref.watch(currentPlayerProvider);
    return state;
  }

  @override
  void initState() {
    ref.read(currentPlayerProvider.notifier).currentPlayer();
    ref.read(fetchPlayersProvider.notifier).fetchPlayer();
    ref.read(activeGameProvider.notifier).activeGame();
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return FutureBuilder(
        future: _futureState(),
        builder: (BuildContext context, snapshot) {
          final CurrentPlayerState? state = snapshot.data;
          if (state is Loaded) {
            return MainPage(
              currentPlayer: state.player,
            );
          }
          if (state is Error) {
            // Apparaitre un snackbar message
            return Text("Erreur");
          }

          return Center(child: CircularProgressIndicator());
        });
  }
}
