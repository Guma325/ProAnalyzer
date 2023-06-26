import 'package:flutter/material.dart';
import 'package:myapp/pages/match_detail_page.dart';
import 'package:myapp/models/match.dart';

class MyMatchListTile extends StatefulWidget {
  Match match;

  MyMatchListTile({super.key, required this.match});

  @override
  State<MyMatchListTile> createState() => _MyMatchListTile();
}

Text checkVictory(bool win) {
  Color color;
  if (win) {
    color = Colors.green.shade600;
    return Text(
      "Win",
      textScaleFactor: 1.25,
      style: TextStyle(color: color, fontSize: 10, fontWeight: FontWeight.bold),
    );
  } else {
    color = Colors.red.shade600;
    return Text(
      "Lose",
      textScaleFactor: 1.25,
      style: TextStyle(color: color, fontSize: 10, fontWeight: FontWeight.bold),
    );
  }
}

class _MyMatchListTile extends State<MyMatchListTile> {
  showMatchDetails(Match match) {
    Navigator.push(
        context,
        MaterialPageRoute(
            builder: (_) => MatchDetailPage(
                  match: match,
                )));
  }

  @override
  Widget build(BuildContext context) {
    return ListTile(
      hoverColor: Colors.grey[300],
      leading: ClipRRect(
          borderRadius: BorderRadius.circular(10.0),
          child: Image.network(widget.match.championPlayed)),
      title: Text(
        "${widget.match.kills.toString()}/${widget.match.deaths.toString()}/${widget.match.assists.toString()}",
        textScaleFactor: 1.25,
        style: TextStyle(color: Colors.grey[900], fontSize: 12, fontWeight: FontWeight.bold),
      ),
      subtitle: Row(
        children: <Widget>[
          Padding(
            padding: const EdgeInsets.fromLTRB(0.0, 5.0, 1.0, 0.0),
            child: CircleAvatar(
              backgroundImage: NetworkImage(widget.match.item1),
            ),
          ),
          Padding(
            padding: const EdgeInsets.fromLTRB(0.0, 5.0, 1.0, 0.0),
            child: CircleAvatar(
              backgroundImage: NetworkImage(widget.match.item2),
            ),
          ),
          Padding(
            padding: const EdgeInsets.fromLTRB(0.0, 5.0, 1.0, 0.0),
            child: CircleAvatar(
              backgroundImage: NetworkImage(widget.match.item3),
            ),
          ),
          Padding(
            padding: const EdgeInsets.fromLTRB(0.0, 5.0, 1.0, 0.0),
            child: CircleAvatar(
              backgroundImage: NetworkImage(widget.match.item4),
            ),
          ),
          Padding(
            padding: const EdgeInsets.fromLTRB(0.0, 5.0, 1.0, 0.0),
            child: CircleAvatar(
              backgroundImage: NetworkImage(widget.match.item5),
            ),
          ),
          Padding(
            padding: const EdgeInsets.fromLTRB(0.0, 5.0, 1.0, 0.0),
            child: CircleAvatar(
              backgroundImage: NetworkImage(widget.match.item6),
            ),
          ),
        ],
      ),
      trailing: checkVictory(widget.match.matchResult),
      onTap: () => showMatchDetails(widget.match),
    );
  }
}
