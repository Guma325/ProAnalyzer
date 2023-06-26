import 'package:flutter/material.dart';
import 'package:myapp/models/summoner.dart';

class SummonerRepository extends ChangeNotifier {
  final List<Summoner> _tabela = [];
  final loading = ValueNotifier(true);
  List<Summoner> get tabela => _tabela;

  SummonerRepository() {
    _setupSummonersTable();
  }

  _setupSummonersTable() async {
    showLoading(true);
    _tabela.add(await Summoner.create("MDK GhostSoul"));
    _tabela.add(await Summoner.create("MDK Guma"));
    _tabela.add(await Summoner.create("Skyë"));
    _tabela.add(await Summoner.create("Avô do Churros"));
    showLoading(false);
  }

  showLoading(bool value) {
    loading.value = value;
    notifyListeners();
  }
}
