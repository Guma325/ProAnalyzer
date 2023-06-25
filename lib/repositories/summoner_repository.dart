import 'package:flutter/material.dart';
import 'package:myapp/models/summoner.dart';

class SummonerRepository extends ChangeNotifier {
  final List<Summoner> _tabela = [];
  final loading = ValueNotifier(true);
  List<Summoner> get tabela => _tabela;

  
  SummonerRepository() {
    showLoading(true);
    _setupSummonersTable();
    showLoading(false);
    notifyListeners();
  }

  _setupSummonersTable() {

    _tabela.add(Summoner(summonerName: 'MDK GhostSoul'));
    _tabela.add(Summoner(summonerName: 'MDK Guma'));
    _tabela.add(Summoner(summonerName: 'Skyë'));
    _tabela.add(Summoner(summonerName: 'Avô do Churros'));
    
  }
  showLoading(bool value){
    loading.value = value;
    notifyListeners();
  }
}
