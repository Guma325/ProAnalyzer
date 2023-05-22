import 'package:flutter/material.dart';
import 'package:myapp/models/match.dart';
import '../repositories/match_repository.dart';

class MatchDetailPage extends StatefulWidget {
  Match match;

  MatchDetailPage({super.key, required this.match});

  @override
  State<MatchDetailPage> createState() => _MatchDetailPageState();
}

Color checkVictory(result) {
  if (result == "Win") {
    return Colors.green.shade600;
  } else {
    return Colors.red.shade600;
  }
}

class _MatchDetailPageState extends State<MatchDetailPage> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
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
        backgroundColor: checkVictory(widget.match.matchResult),
      ),
      body: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            SizedBox(
              height: 100,
              child: ClipRRect(
                  borderRadius: BorderRadius.circular(10.0),
                  child: Image.asset(widget.match.championPlayed)),
            ),
          ],
        ),
      ),
    );
  }
}
