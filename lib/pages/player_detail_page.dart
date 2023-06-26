import "package:flutter/material.dart";
import "package:myapp/models/summoner.dart";
import 'package:myapp/components/my_matchlisttile.dart';

// ignore: must_be_immutable
class PlayerDetailPage extends StatefulWidget {
  Summoner summoner;

  PlayerDetailPage({super.key, required this.summoner});

  @override
  State<PlayerDetailPage> createState() => _PlayerDetailPageState();
}

class _PlayerDetailPageState extends State<PlayerDetailPage> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: Colors.grey.shade300,
        title: Text(widget.summoner.summonerName),
      ),
      body: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            const SizedBox(height: 20),
            CircleAvatar(
              maxRadius: 50,
              backgroundImage: NetworkImage(widget.summoner.summonerIcon),
            ),
            const SizedBox(height: 20),
            Text(
              widget.summoner.summonerName,
              style: TextStyle(color: Colors.grey[600], fontSize: 28, fontWeight: FontWeight.bold),
            ),
            const SizedBox(height: 20),
            Center(
              child: Wrap(
                children: <Widget>[
                  Padding(
                    padding: const EdgeInsets.only(right: 5),
                    child: CircleAvatar(
                      maxRadius: 30,
                      backgroundImage: NetworkImage(widget.summoner.firstChampion),
                    ),
                  ),
                  Padding(
                    padding: const EdgeInsets.only(right: 5),
                    child: CircleAvatar(
                      maxRadius: 30,
                      backgroundImage: NetworkImage(widget.summoner.secondChampion),
                    ),
                  ),
                  Padding(
                    padding: const EdgeInsets.only(right: 5),
                    child: CircleAvatar(
                      maxRadius: 30,
                      backgroundImage: NetworkImage(widget.summoner.thirdChampion),
                    ),
                  ),
                ],
              ),
            ),
            const SizedBox(height: 20),
            Expanded(
              child: ListView(
                children: [
                  MyMatchListTile(match: widget.summoner.firstMatch),
                  MyMatchListTile(match: widget.summoner.secondMatch),
                  MyMatchListTile(match: widget.summoner.thirdMatch),
                ],
              ),
            ),
          ],
        ),
      ),
    );
  }
}
