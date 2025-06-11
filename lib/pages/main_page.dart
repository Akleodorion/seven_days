import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:seven_days/core/enums/challenge_status.dart';
import 'package:seven_days/features/challenge/domain/entity/challenge.dart';
import 'package:seven_days/features/challenge/presentation/pages/challenges_pages.dart';
import 'package:seven_days/features/challenge/presentation/providers/create_challenge_provider.dart';
import 'package:seven_days/features/game/presentation/pages/game_page.dart';
import 'package:seven_days/features/game/presentation/pages/live_game/live_game_page.dart';
import 'package:seven_days/features/game/presentation/pages/retry_active_game_page.dart';
import 'package:seven_days/features/game/presentation/pages/start_game_page.dart';
import 'package:seven_days/features/game/presentation/providers/states/active_game_state.dart';
import 'package:seven_days/features/challenge/presentation/providers/states/create_challenge_state.dart'
    as ccs;
import 'package:seven_days/features/player/domain/entity/player.dart';
import 'package:seven_days/features/player/presentation/providers/current_player_provider.dart';
import 'package:seven_days/features/pledge/presentation/pages/pledges_page.dart';
import 'package:seven_days/pages/my_botom_navigation_bar.dart';

class MainPage extends StatefulWidget {
  final Player currentPlayer;
  const MainPage({super.key, required this.currentPlayer});

  @override
  State<MainPage> createState() => _MainPageState();
}

class _MainPageState extends State<MainPage> {
  late int _currentIndex;

  final TextEditingController _controller = TextEditingController();
  @override
  void initState() {
    super.initState();
    _currentIndex = 0;
  }

  @override
  void dispose() {
    _controller.dispose(); // important pour éviter les fuites de mémoire
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    final Map<int, Widget> pages = {
      0: GamePage(),
      1: ChallengesPages(),
      2: PledgesPage(),
    };

    return Scaffold(
      appBar: AppBar(
        title: Text(widget.currentPlayer.name),
      ),
      body: pages[_currentIndex],
      floatingActionButton: (_currentIndex == 1 || _currentIndex == 2)
          ? FloatingActionButton(
              onPressed: () {
                showModalBottomSheet(
                  context: context,
                  builder: (context) => Column(
                    mainAxisAlignment: MainAxisAlignment.spaceAround,
                    children: [
                      Row(
                        children: [
                          Expanded(
                            child: Center(
                              child: Text("Edit/new"),
                            ),
                          ),
                          IconButton(
                            onPressed: () {},
                            icon: Icon(
                              Icons.delete,
                              color: Colors.red,
                            ),
                          ),
                        ],
                      ),
                      TextFormField(
                        controller: _controller,
                        decoration:
                            InputDecoration(labelText: "Nom du challenge"),
                      ),
                      Consumer(
                        builder: (context, ref, child) {
                          return ElevatedButton(
                            onPressed: () async {
                              final title = _controller.text.trim();
                              if (title.isEmpty) return;

                              final Challenge challenge = Challenge(
                                  id: null,
                                  description: title,
                                  status: ChallengeStatus.created,
                                  playerId: widget.currentPlayer.id,
                                  gameId: null);

                              final state = await ref
                                  .read(createChallengeProvider.notifier)
                                  .createChallenge(challenge: challenge);
                              if (state is ccs.Loaded) {
                                ref
                                    .read(currentPlayerProvider.notifier)
                                    .updateCurrentPlayerChallengeList(
                                        newChallenge: state.challenge);
                              }
                              if (context.mounted) {
                                Navigator.pop(context);
                              }
                            },
                            child: Text("Modifier / Créer un challenge"),
                          );
                        },
                      )
                    ],
                  ),
                );
              },
              child: Icon(Icons.abc_outlined),
            )
          : null,
      bottomNavigationBar: MyBottomNavigationBar(
          currentIndex: _currentIndex,
          onTap: (int value) {
            setState(() {
              _currentIndex = value;
            });
          }),
    );
  }
}

Widget router({required ActiveGameState? state}) {
  Widget widget = Placeholder();
  if (state is Loaded && state.game == null) {
    widget = StartGamePage();
  } else if (state is Loaded && state.game != null) {
    widget = LiveGamePage();
  } else if (state is Error) {
    widget = RetryActiveGamePage();
  } else {
    widget = CircularProgressIndicator();
  }
  return widget;
}
