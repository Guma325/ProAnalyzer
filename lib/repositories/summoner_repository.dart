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

  _setupSummonersTable() async{
    _tabela.add(await Summoner.create("MDK GhostSoul"));
    _tabela.add(await Summoner.create("MDK Guma"));
    _tabela.add(await Summoner.create("Skyë"));
    _tabela.add(await Summoner.create("Avô do Churros"));
    _tabela.add(await Summoner.create("enxadao2000"));
    
  }
  showLoading(bool value){
    loading.value = value;
    notifyListeners();
  }
}
