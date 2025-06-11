import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:seven_days/features/player/presentation/providers/current_player_provider.dart';

class ChallengesPages extends ConsumerWidget {
  const ChallengesPages({super.key});

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final player = ref.watch(playerProvider);

    final challenges = player?.challenges ?? [];

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
