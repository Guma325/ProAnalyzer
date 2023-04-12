import 'package:flutter/material.dart';

import '../repositories/summoner_repository.dart';

class MyListTile extends StatefulWidget {
  final int match;

  const MyListTile({super.key, required this.match});

  @override
  State<MyListTile> createState() => _MyListTileState();
}

class _MyListTileState extends State<MyListTile> {
  @override
  Widget build(BuildContext context) {
    final tabela = SummonerRepository.tabela;
    return ListTile(
      leading: Image.asset(tabela[widget.match].iconeInvocador),
      title: Text(
        tabela[widget.match].nomeInvocador,
        textScaleFactor: 1.25,
      ),
      subtitle: Row(
        children: <Widget>[
          CircleAvatar(
            backgroundImage: AssetImage(tabela[widget.match].firstChampion),
          ),
          CircleAvatar(
            backgroundImage: AssetImage(tabela[widget.match].secondChampion),
          ),
          CircleAvatar(
            backgroundImage: AssetImage(tabela[widget.match].thirdChampion),
          ),
        ],
      ),
      trailing: Text(
        "WR:${tabela[widget.match].winrate.toString()}%",
        textScaleFactor: 1.25,
      ),
    );
  }
}
