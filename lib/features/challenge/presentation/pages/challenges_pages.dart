import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
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
    var challenges = [];
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
                            return Column(
                              mainAxisAlignment: MainAxisAlignment.spaceAround,
                              children: [
                                Row(
                                  children: [
                                    Expanded(
                                      child: Center(
                                        child: Text("Edit"),
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
                                  decoration: InputDecoration(
                                      labelText: challenge.description),
                                ),
                                Consumer(
                                  builder: (context, ref, child) {
                                    return ElevatedButton(
                                      onPressed: () async {
                                        final title = _controller.text.trim();
                                        if (title.isEmpty) return;

                                        if (context.mounted) {
                                          Navigator.pop(context);
                                        }
                                      },
                                      child: Text("Modifier un challenge"),
                                    );
                                  },
                                )
                              ],
                            );
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
