import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:seven_days/features/challenge/domain/entity/challenge.dart';
import 'package:seven_days/features/challenge/presentation/pages/widgets/challenge_modal_bottom_sheet.dart';
import 'package:seven_days/features/player/presentation/providers/current_player_provider.dart';
import 'package:seven_days/features/player/presentation/providers/states/current_player_state.dart';

class ChallengesPages extends ConsumerStatefulWidget {
  const ChallengesPages({super.key});

  @override
  ConsumerState<ChallengesPages> createState() => _ChallengesPagesState();
}

class _ChallengesPagesState extends ConsumerState<ChallengesPages> {
  final TextEditingController _controller = TextEditingController();

  @override
  void initState() {
    super.initState();
  }

  @override
  void dispose() {
    _controller.dispose(); // important pour éviter les fuites de mémoire
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    final state = ref.watch(currentPlayerProvider);
    List<Challenge> challenges = [];
    if (state is Loaded) {
      challenges = state.player.challenges;
    }

    return Center(
      child: Column(
        children: [
          Text('Liste des défis'),
          if (challenges.isEmpty)
            SizedBox(
              height: 300,
              child: Center(
                child: Text("Vous n'avez pas encore créé de défi"),
              ),
            ),
          if (challenges.isNotEmpty)
            for (var challenge in challenges)
              Container(
                margin: EdgeInsets.symmetric(vertical: 10),
                decoration: BoxDecoration(border: Border.all()),
                child: ListTile(
                  title: Text(challenge.description),
                  trailing: IconButton(
                    onPressed: () {
                      // pop up edit
                      showModalBottomSheet(
                          context: context,
                          builder: (context) {
                            return ChallengeModalBottomSheet(
                                challenge: challenge);
                          });
                    },
                    icon: Icon(
                      Icons.settings,
                    ),
                  ),
                ),
              )
        ],
      ),
    );
  }
}
