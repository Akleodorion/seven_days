import 'package:flutter/material.dart';
import 'package:seven_days/features/challenge/presentation/pages/challenges_pages.dart';
import 'package:seven_days/features/game/presentation/pages/live_game/live_game_page.dart';
import 'package:seven_days/features/game/presentation/pages/retry_active_game_page.dart';
import 'package:seven_days/features/game/presentation/pages/start_game_page.dart';
import 'package:seven_days/features/game/presentation/providers/states/active_game_state.dart';
import 'package:seven_days/features/player/domain/entity/player.dart';
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
  @override
  void initState() {
    super.initState();
    _currentIndex = 0;
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
                      Container(
                          padding: EdgeInsets.symmetric(horizontal: 30),
                          child: TextFormField()),
                      ElevatedButton(
                        onPressed: () {
                          // Method de creation ou d update challenge et pledge.
                        },
                        child: Text("Modifier / Créer un challenge"),
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
