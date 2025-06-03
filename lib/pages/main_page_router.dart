import 'dart:math';

import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:seven_days/core/enums/challenge_status.dart';
import 'package:seven_days/features/challenge/domain/entity/challenge.dart';
import 'package:seven_days/features/challenge/presentation/pages/challenges_pages.dart';
import 'package:seven_days/features/challenge/presentation/providers/create_challenge_provider.dart';
import 'package:seven_days/features/game/presentation/pages/live_game/live_game_page.dart';
import 'package:seven_days/features/game/presentation/pages/retry_active_game_page.dart';
import 'package:seven_days/features/game/presentation/pages/start_game_page.dart';
import 'package:seven_days/features/game/presentation/providers/states/active_game_state.dart';
import 'package:seven_days/features/challenge/presentation/providers/states/create_challenge_state.dart'
    as ccs;
import 'package:seven_days/features/player/domain/entity/player.dart';
import 'package:seven_days/features/player/presentation/providers/notifiers/current_player_provider.dart';
import 'package:seven_days/pages/my_botom_navigation_bar.dart';

class MainPageRouter extends StatefulWidget {
  final ActiveGameState state;
  final Player currentPlayer;
  const MainPageRouter(
      {super.key, required this.state, required this.currentPlayer});

  @override
  State<MainPageRouter> createState() => _MainPageRouterState();
}

class _MainPageRouterState extends State<MainPageRouter> {
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
      0: router(state: widget.state),
      1: ChallengesPages(
        challenges: widget.currentPlayer.challenges,
      ),
      2: Text("page 2"),
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
                              // Method de creation ou d update challenge et pledge.
                              final title = _controller.text.trim();
                              if (title.isEmpty) return;
                              final Challenge challenge = Challenge(
                                  id: 11,
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
