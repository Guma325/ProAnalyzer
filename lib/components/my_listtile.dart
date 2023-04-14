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
      hoverColor: Colors.grey[500],
      leading: ClipRRect(
        borderRadius: BorderRadius.circular(10.0),
        child: Image.asset(
          tabela[widget.match].iconeInvocador
          )
      ),
      title: Text(
        tabela[widget.match].nomeInvocador,
        textScaleFactor: 1.25,
        style: TextStyle(
                  color: Colors.grey[800],
                  fontSize: 15,
                  fontWeight: FontWeight.bold
                  ),
      ),
      subtitle: Row(
        children: <Widget>[
          Padding(
            padding: const EdgeInsets.fromLTRB(0.0, 5.0, 5.0, 0.0),
            child: CircleAvatar(
              backgroundImage: AssetImage(tabela[widget.match].firstChampion),
            ),
          ),
          Padding(
            padding: const EdgeInsets.fromLTRB(0.0, 5.0, 5.0, 0.0),
            child: CircleAvatar(
              backgroundImage: AssetImage(tabela[widget.match].secondChampion),
            ),
          ),
          Padding(
            padding: const EdgeInsets.fromLTRB(0.0, 5.0, 5.0, 0.0),
            child: CircleAvatar(
              backgroundImage: AssetImage(tabela[widget.match].thirdChampion),
            ),
          ),
        ],
      ),
      trailing: Text(
        "WR:${tabela[widget.match].winrate.toString()}%",
        textScaleFactor: 1.25,
        style: TextStyle(
                  color: Colors.grey[600],
                  fontSize: 10,
                  fontWeight: FontWeight.bold
                  ),
      ),
    );
  }
}
