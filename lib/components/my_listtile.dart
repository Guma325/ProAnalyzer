import 'package:flutter/material.dart';
import 'package:myapp/models/summoner.dart';
import 'package:myapp/pages/player_detail_page.dart';
import 'package:myapp/pages/profile_page.dart';

import '../repositories/summoner_repository.dart';

class MyListTile extends StatefulWidget {
  final int summoner;

  const MyListTile({super.key, required this.summoner});

  @override
  State<MyListTile> createState() => _MyListTileState();
}

class _MyListTileState extends State<MyListTile> {
  showPlayerDetails(Summoner summoner) {
    Navigator.push(
        context,
        MaterialPageRoute(
            builder: (_) => PlayerDetailPage(
                  summoner: summoner,
                )));
  }

  @override
  Widget build(BuildContext context) {
    final tabela = SummonerRepository.tabela;
    return ListTile(
      hoverColor: Colors.grey[500],
      leading: ClipRRect(
          borderRadius: BorderRadius.circular(10.0),
          child: Image.asset(tabela[widget.summoner].iconeInvocador)),
      title: Text(
        tabela[widget.summoner].nomeInvocador,
        textScaleFactor: 1.25,
        style: TextStyle(
            color: Colors.grey[800], fontSize: 15, fontWeight: FontWeight.bold),
      ),
      subtitle: Row(
        children: <Widget>[
          Padding(
            padding: const EdgeInsets.fromLTRB(0.0, 5.0, 5.0, 0.0),
            child: CircleAvatar(
              backgroundImage:
                  AssetImage(tabela[widget.summoner].firstChampion),
            ),
          ),
          Padding(
            padding: const EdgeInsets.fromLTRB(0.0, 5.0, 5.0, 0.0),
            child: CircleAvatar(
              backgroundImage:
                  AssetImage(tabela[widget.summoner].secondChampion),
            ),
          ),
          Padding(
            padding: const EdgeInsets.fromLTRB(0.0, 5.0, 5.0, 0.0),
            child: CircleAvatar(
              backgroundImage:
                  AssetImage(tabela[widget.summoner].thirdChampion),
            ),
          ),
        ],
      ),
      trailing: Text(
        "WR:${tabela[widget.summoner].winrate.toString()}%",
        textScaleFactor: 1.25,
        style: TextStyle(
            color: Colors.grey[600], fontSize: 10, fontWeight: FontWeight.bold),
      ),
      onTap: () => showPlayerDetails(tabela[widget.summoner]),
    );
  }
}
