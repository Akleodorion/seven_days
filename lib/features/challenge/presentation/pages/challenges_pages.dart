import 'package:flutter/material.dart';
import 'package:seven_days/features/challenge/domain/entity/challenge.dart';

class ChallengesPages extends StatelessWidget {
  final List<Challenge> challenges;
  const ChallengesPages({
    super.key,
    required this.challenges,
  });

  @override
  Widget build(BuildContext context) {
    return Center(
      child: Column(
        children: [
          Text('Liste des défis'),
          if (challenges.isEmpty)
            SizedBox(
              height: 300,
              child: Center(
                child: Text("Vous n'avez pas encore créer de défi"),
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
                      onPressed: () {},
                      icon: Icon(
                        Icons.settings,
                      )),
                ),
              )
        ],
      ),
    );
  }
}
