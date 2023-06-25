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
    return const Text("KKKKKKKKK");
  }
}
