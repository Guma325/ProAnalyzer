import 'package:flutter/material.dart';
import 'package:myapp/models/summoner.dart';

class SummonerRepository extends ChangeNotifier {
  final List<Summoner> _tabela = [];
  List<Summoner> get tabela => _tabela;

  SummonerRepository() {
    _setupSummonersTable();
    notifyListeners();
  }

  _setupSummonersTable() {
    _tabela.add(Summoner(summonerName: 'MDK GhostSoul'));
    _tabela.add(Summoner(summonerName: 'MDK Guma'));
  }
}
