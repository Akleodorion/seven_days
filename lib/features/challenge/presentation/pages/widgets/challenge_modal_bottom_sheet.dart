import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:seven_days/features/challenge/data/model/challenge_model.dart';
import 'package:seven_days/features/challenge/domain/entity/challenge.dart';
import 'package:seven_days/features/challenge/presentation/providers/destroy_challenge_provider.dart';
import 'package:seven_days/features/challenge/presentation/providers/states/destroy_challenge_state.dart';
import 'package:seven_days/features/challenge/presentation/providers/update_challenge_provider.dart';
import 'package:seven_days/features/player/presentation/providers/current_player_provider.dart';

class ChallengeModalBottomSheet extends ConsumerStatefulWidget {
  final Challenge challenge;
  const ChallengeModalBottomSheet({super.key, required this.challenge});

  @override
  ConsumerState<ChallengeModalBottomSheet> createState() =>
      _ChallengeModalBottomSheetState();
}

class _ChallengeModalBottomSheetState
    extends ConsumerState<ChallengeModalBottomSheet> {
  final TextEditingController _controller = TextEditingController();

  @override
  void dispose() {
    _controller.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
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
              onPressed: () async {
                final destroyState = await ref
                    .read(destroyChallengeProvider.notifier)
                    .destroyChallenge(challenge: widget.challenge);
                if (destroyState is Loaded) {
                  ref
                      .read(currentPlayerProvider.notifier)
                      .updateCurrentPlayerChallengeList(
                          challenge: widget.challenge, isAdd: false);
                }
                if (context.mounted) {
                  Navigator.of(context).pop();
                }
              },
              icon: Icon(
                Icons.delete,
                color: Colors.red,
              ),
            ),
          ],
        ),
        TextFormField(
          controller: _controller,
          decoration: InputDecoration(labelText: widget.challenge.description),
        ),
        ElevatedButton(
          onPressed: () async {
            final title = _controller.text.trim();
            if (title.isEmpty) return;

            final ChallengeModel newChallenge = ChallengeModel(
              id: widget.challenge.id,
              playerId: widget.challenge.playerId,
              gameId: widget.challenge.gameId,
              description: title,
              status: widget.challenge.status,
            );
            await ref
                .read(updateChallengeProvider.notifier)
                .updateChallenge(challenge: newChallenge);
            if (context.mounted) {
              Navigator.pop(context);
            }
          },
          child: Text("Modifier un challenge"),
        )
      ],
    );
  }
}
