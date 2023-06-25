import 'package:flutter/material.dart';
import '../api/riot_api.dart';
import '../api/network_image.dart';

class Summoner extends ChangeNotifier {
  late String puuid;
  late int summonerLevel;
  late String summonerIcon;
  String summonerName;
  late String firstChampion;
  late String secondChampion;
  late String thirdChampion;

  Summoner({required this.summonerName}) {
    _setupSummonerInfo();
    _setupMasteryInfo();
    notifyListeners();
  }

  _setupSummonerInfo() async {
    final summonerInfo = await RiotApi().invokeService("GET_PUUID_BYNAME", summonerName);
    if (summonerInfo.runtimeType != int) {
      puuid = summonerInfo["puuid"];
      summonerIcon = await NetworkImageUrl().retrieveSummonerIconUrl(summonerInfo["profileIconId"]);
      summonerLevel = summonerInfo["summonerLevel"];
    }
  }

  _setupMasteryInfo() async {
    final masteryInfo = await RiotApi().invokeService("GET_SUMMONERMASTERY_BYPUUID", puuid);
    if (masteryInfo.runtimeType != int) {
      firstChampion = await NetworkImageUrl().retrieveChampionUrl(masteryInfo[0]["championId"]);
      secondChampion = await NetworkImageUrl().retrieveChampionUrl(masteryInfo[1]["championId"]);
      thirdChampion = await NetworkImageUrl().retrieveChampionUrl(masteryInfo[2]["championId"]);
    }
  }
}
