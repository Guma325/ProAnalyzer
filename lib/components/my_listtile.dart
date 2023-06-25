import 'package:flutter/material.dart';
import 'package:myapp/models/summoner.dart';
import 'package:myapp/pages/player_detail_page.dart';
import 'package:myapp/repositories/summoner_repository.dart';
import 'package:provider/provider.dart';

class MyListTile extends StatefulWidget {
  final int summoner;

  MyListTile({super.key, required this.summoner});

  @override
  State<MyListTile> createState() => _MyListTileState();
}

class _MyListTileState extends State<MyListTile> {
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
    return Consumer<SummonerRepository>(builder: (context, repositorio, child){
      return ListTile(
      hoverColor: Colors.grey[300],
      tileColor:  selecionados.contains(repositorio.tabela[widget.summoner])
      ? Colors.grey[800]
      : null
      ,
      leading: ClipRRect(
              borderRadius: BorderRadius.circular(10.0),
              child: Image.network(repositorio.tabela[widget.summoner].summonerIcon),
            ),
      title: Text(
        repositorio.tabela[widget.summoner].summonerName,
        textScaleFactor: 1.25,
        style: TextStyle(color: Colors.grey[800], fontSize: 15, fontWeight: FontWeight.bold),
      ),
      subtitle: Row(
        children: <Widget>[
          Padding(
            padding: const EdgeInsets.fromLTRB(0.0, 5.0, 5.0, 0.0),
            child: CircleAvatar(
              backgroundImage:
                  NetworkImage(repositorio.tabela[widget.summoner].firstChampion),
            ),
          ),
          Padding(
            padding: const EdgeInsets.fromLTRB(0.0, 5.0, 5.0, 0.0),
            child: CircleAvatar(
              backgroundImage:
                  NetworkImage(repositorio.tabela[widget.summoner].secondChampion),
            ),
          ),
          Padding(
            padding: const EdgeInsets.fromLTRB(0.0, 5.0, 5.0, 0.0),
            child: CircleAvatar(
              backgroundImage:
                  NetworkImage(repositorio.tabela[widget.summoner].thirdChampion),
            ),
          ),
        ],
      ),
      selected: selecionados.contains(repositorio.tabela[widget.summoner]),
      selectedColor: Colors.grey,
      onTap: () => showPlayerDetails(repositorio.tabela[widget.summoner]),
      onLongPress: () {
        setState(() {
          (selecionados.contains(repositorio.tabela[widget.summoner]))
              ? selecionados.remove(repositorio.tabela[widget.summoner])
              : selecionados.add(repositorio.tabela[widget.summoner]);
        });
      },
    );
    },);
  }
}