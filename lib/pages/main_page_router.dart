import 'package:flutter/material.dart';
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
    return Scaffold(
      appBar: AppBar(
        title: Text(widget.currentPlayer.name),
      ),
      body: router(state: widget.state),
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
