import 'package:flutter/material.dart';
import 'package:myapp/models/match.dart';
import '../repositories/match_repository.dart';

class MatchDetailPage extends StatefulWidget {
  Match match;

  MatchDetailPage({super.key, required this.match});

  @override
  State<MatchDetailPage> createState() => _MatchDetailPageState();
}

Color checkVictoryappBar(result) {
  if (result == "Win") {
    return Colors.green.shade400;
  } else {
    return Colors.red.shade400;
  }
}

Color checkVictoryBackGround(result) {
  if (result == "Win") {
    return Colors.green.shade100;
  } else {
    return Colors.red.shade100;
  }
}

class _MatchDetailPageState extends State<MatchDetailPage> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: checkVictoryBackGround(widget.match.matchResult),
      appBar: AppBar(
        title: Align(
          alignment: Alignment.centerRight,
          child: Text(
            "${widget.match.kills.toString()}/${widget.match.deaths.toString()}/${widget.match.assists.toString()}",
            textScaleFactor: 1.25,
            style: TextStyle(
                color: Colors.grey.shade300,
                fontSize: 15,
                fontWeight: FontWeight.bold),
          ),
        ),
        backgroundColor: checkVictoryappBar(widget.match.matchResult),
      ),
      body: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            SizedBox(
              height: 140,
              child: ClipRRect(
                  borderRadius: BorderRadius.circular(10.0),
                  child: Image.asset(widget.match.championPlayed)),
            ),
            const SizedBox(
              height: 20,
            ),
            Center(
              child: Wrap(
                children: <Widget>[
                  Padding(
                    padding: const EdgeInsets.only(right: 5),
                    child: CircleAvatar(
                      maxRadius: 50,
                      backgroundImage: AssetImage(widget.match.summonerSpell1),
                    ),
                  ),
                  Padding(
                    padding: const EdgeInsets.only(right: 5),
                    child: CircleAvatar(
                      maxRadius: 50,
                      backgroundImage: AssetImage(widget.match.summonerSpell2),
                    ),
                  ),
                ],
              ),
            ),
            const SizedBox(
              height: 20,
            ),
            Center(
              child: Wrap(
                children: <Widget>[
                  Padding(
                    padding: const EdgeInsets.only(right: 5),
                    child: CircleAvatar(
                      maxRadius: 40,
                      backgroundImage: AssetImage(widget.match.item1),
                    ),
                  ),
                  Padding(
                    padding: const EdgeInsets.only(right: 5),
                    child: CircleAvatar(
                      maxRadius: 40,
                      backgroundImage: AssetImage(widget.match.item2),
                    ),
                  ),
                  Padding(
                    padding: const EdgeInsets.only(right: 5),
                    child: CircleAvatar(
                      maxRadius: 40,
                      backgroundImage: AssetImage(widget.match.item3),
                    ),
                  ),
                ],
              ),
            ),
            Center(
              child: Wrap(
                children: <Widget>[
                  Padding(
                    padding: const EdgeInsets.only(right: 5),
                    child: CircleAvatar(
                      maxRadius: 40,
                      backgroundImage: AssetImage(widget.match.item4),
                    ),
                  ),
                  Padding(
                    padding: const EdgeInsets.only(right: 5),
                    child: CircleAvatar(
                      maxRadius: 40,
                      backgroundImage: AssetImage(widget.match.item5),
                    ),
                  ),
                  Padding(
                    padding: const EdgeInsets.only(right: 5),
                    child: CircleAvatar(
                      maxRadius: 40,
                      backgroundImage: AssetImage(widget.match.item6),
                    ),
                  ),
                ],
              ),
            ),
          ],
        ),
      ),
    );
  }
}
