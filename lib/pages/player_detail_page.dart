import "package:flutter/material.dart";
import "package:myapp/models/summoner.dart";
import 'package:myapp/components/my_matchlisttile.dart';
import 'package:myapp/repositories/match_repository.dart';

class PlayerDetailPage extends StatefulWidget {
  Summoner summoner;

  PlayerDetailPage({super.key, required this.summoner});

  @override
  State<PlayerDetailPage> createState() => _PlayerDetailPageState();
}

class _PlayerDetailPageState extends State<PlayerDetailPage> {
  @override
  Widget build(BuildContext context) {
    final tabela = MatchRepository.tabela;

    return Scaffold(
      appBar: AppBar(
        backgroundColor: Colors.grey.shade300,
        title: Text(widget.summoner.nomeInvocador),
      ),
      body: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            const SizedBox(height: 20),
            CircleAvatar(
              maxRadius: 50,
              backgroundImage: AssetImage(widget.summoner.iconeInvocador),
            ),
            const SizedBox(height: 20),
            Text(
              widget.summoner.nomeInvocador,
              style: TextStyle(
                  color: Colors.grey[600],
                  fontSize: 28,
                  fontWeight: FontWeight.bold),
            ),
            const SizedBox(height: 20),
            Center(
              child: Wrap(
                children: <Widget>[
                  Padding(
                    padding: const EdgeInsets.only(right: 5),
                    child: CircleAvatar(
                      maxRadius: 30,
                      backgroundImage:
                          AssetImage(widget.summoner.firstChampion),
                    ),
                  ),
                  Padding(
                    padding: const EdgeInsets.only(right: 5),
                    child: CircleAvatar(
                      maxRadius: 30,
                      backgroundImage:
                          AssetImage(widget.summoner.secondChampion),
                    ),
                  ),
                  Padding(
                    padding: const EdgeInsets.only(right: 5),
                    child: CircleAvatar(
                      maxRadius: 30,
                      backgroundImage:
                          AssetImage(widget.summoner.thirdChampion),
                    ),
                  ),
                ],
              ),
            ),
            const SizedBox(height: 20),
            Text(
              "WR:${widget.summoner.winrate.toString()}%",
              style: TextStyle(
                  color: Colors.grey[600],
                  fontSize: 21,
                  fontWeight: FontWeight.bold),
            ),
            const SizedBox(height: 20),
            Expanded(
              child: ListView.separated(
                  padding: EdgeInsets.zero,
                  itemBuilder: (BuildContext context, int match) {
                    return MyMatchListTile(match: match);
                  },
                  //padding: const EdgeInsets.all(25),
                  separatorBuilder: (_, __) => const Divider(),
                  itemCount: tabela.length),
            ),
          ],
        ),
      ),
    );
  }
}
