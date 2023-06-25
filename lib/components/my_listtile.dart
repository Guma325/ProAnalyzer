import 'package:flutter/material.dart';
import 'package:myapp/models/summoner.dart';
import 'package:myapp/pages/player_detail_page.dart';
import 'package:provider/provider.dart';
import '../repositories/summoner_repository.dart';

class MyListTile extends StatefulWidget {
  final int summoner;

  const MyListTile({super.key, required this.summoner});

  @override
  State<MyListTile> createState() => _MyListTileState();
}

class _MyListTileState extends State<MyListTile> {
  late List<Summoner> tabela;
  late SummonerRepository summoners;

  List<Summoner> selecionados = [];
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
    summoners = context.watch<SummonerRepository>();
    tabela = summoners.tabela;
    return ListTile(
      hoverColor: Colors.grey[300],
      leading: selecionados.contains(tabela[widget.summoner])
          ? const CircleAvatar(
              child: Icon(
              Icons.check,
            ))
          : ClipRRect(
              borderRadius: BorderRadius.circular(10.0),
              child: Image.network(tabela[widget.summoner].summonerIcon),
            ),
      title: Text(
        tabela[widget.summoner].summonerName,
        textScaleFactor: 1.25,
        style: TextStyle(color: Colors.grey[800], fontSize: 15, fontWeight: FontWeight.bold),
      ),
      subtitle: Row(
        children: <Widget>[
          Padding(
            padding: const EdgeInsets.fromLTRB(0.0, 5.0, 5.0, 0.0),
            child: CircleAvatar(
              backgroundImage:
                  NetworkImage(tabela[widget.summoner].firstChampion),
            ),
          ),
          Padding(
            padding: const EdgeInsets.fromLTRB(0.0, 5.0, 5.0, 0.0),
            child: CircleAvatar(
              backgroundImage:
                  NetworkImage(tabela[widget.summoner].secondChampion),
            ),
          ),
          Padding(
            padding: const EdgeInsets.fromLTRB(0.0, 5.0, 5.0, 0.0),
            child: CircleAvatar(
              backgroundImage:
                  NetworkImage(tabela[widget.summoner].thirdChampion),
            ),
          ),
        ],
      ),
      selected: selecionados.contains(tabela[widget.summoner]),
      selectedColor: Colors.grey,
      onTap: () => showPlayerDetails(tabela[widget.summoner]),
      onLongPress: () {
        setState(() {
          (selecionados.contains(tabela[widget.summoner]))
              ? selecionados.remove(tabela[widget.summoner])
              : selecionados.add(tabela[widget.summoner]);
        });
      },
    );
  }
}
