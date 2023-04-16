import 'package:flutter/material.dart';

import '../repositories/match_repository.dart';

class MyMatchListTile extends StatefulWidget {
  final int match;

  const MyMatchListTile({super.key, required this.match});

  @override
  State<MyMatchListTile> createState() => _MyMatchListTile();
}

Text checkVictory(result) {
  Color color;
  if (result == "Win") {
    color = Colors.green.shade600;
  } else {
    color = Colors.red.shade600;
  }
  return Text(
    result,
    textScaleFactor: 1.25,
    style: TextStyle(color: color, fontSize: 10, fontWeight: FontWeight.bold),
  );
}

class _MyMatchListTile extends State<MyMatchListTile> {
  @override
  Widget build(BuildContext context) {
    final tabela = MatchRepository.tabela;
    return ListTile(
        hoverColor: Colors.grey[500],
        leading: ClipRRect(
            borderRadius: BorderRadius.circular(10.0),
            child: Image.asset(tabela[widget.match].championPlayed)),
        title: Text(
          "${tabela[widget.match].kills.toString()}/${tabela[widget.match].deaths.toString()}/${tabela[widget.match].assists.toString()}",
          textScaleFactor: 1.25,
          style: TextStyle(
              color: Colors.grey[900],
              fontSize: 12,
              fontWeight: FontWeight.bold),
        ),
        subtitle: Row(
          children: <Widget>[
            Padding(
              padding: const EdgeInsets.fromLTRB(0.0, 5.0, 1.0, 0.0),
              child: CircleAvatar(
                backgroundImage: AssetImage(tabela[widget.match].item1),
              ),
            ),
            Padding(
              padding: const EdgeInsets.fromLTRB(0.0, 5.0, 1.0, 0.0),
              child: CircleAvatar(
                backgroundImage: AssetImage(tabela[widget.match].item2),
              ),
            ),
            Padding(
              padding: const EdgeInsets.fromLTRB(0.0, 5.0, 1.0, 0.0),
              child: CircleAvatar(
                backgroundImage: AssetImage(tabela[widget.match].item3),
              ),
            ),
            Padding(
              padding: const EdgeInsets.fromLTRB(0.0, 5.0, 1.0, 0.0),
              child: CircleAvatar(
                backgroundImage: AssetImage(tabela[widget.match].item4),
              ),
            ),
            Padding(
              padding: const EdgeInsets.fromLTRB(0.0, 5.0, 1.0, 0.0),
              child: CircleAvatar(
                backgroundImage: AssetImage(tabela[widget.match].item5),
              ),
            ),
            Padding(
              padding: const EdgeInsets.fromLTRB(0.0, 5.0, 1.0, 0.0),
              child: CircleAvatar(
                backgroundImage: AssetImage(tabela[widget.match].item6),
              ),
            ),
          ],
        ),
        trailing: checkVictory(tabela[widget.match].matchResult));
  }
}
