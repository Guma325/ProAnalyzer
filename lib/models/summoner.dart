import 'package:flutter/material.dart';
import '../api/riot_api.dart';
import 'package:http/http.dart' as http;
import 'dart:convert';

class Summoner extends ChangeNotifier {
  final String version = "13.12.1";
  final String url = "http://ddragon.leagueoflegends.com/cdn/13.12.1/img";
  late String puuid;
  late int summonerLevel;
  late String summonerIcon;
  String summonerName;
  late String firstChampion;
  late String secondChampion;
  late String thirdChampion;

  Summoner({required this.summonerName}) {
    _setupSummonerInfo();
    // _setupMasteryInfo();
  }

  _setupSummonerInfo() async {
    final summonerInfo = await RiotApi().invokeService("GET_PUUID_BYNAME", summonerName);
    if (summonerInfo.runtimeType != int) {
      puuid = summonerInfo["puuid"];
      print("------------------------------------- {$puuid}");
      summonerIcon = await retrieveSummonerIconUrl(summonerInfo["profileIconId"]);
      summonerLevel = summonerInfo["summonerLevel"];


      final masteryInfo = await RiotApi().invokeService("GET_SUMMONERMASTERY_BYPUUID", puuid);
      if (masteryInfo.runtimeType != int) {
        firstChampion = await retrieveChampionUrl(masteryInfo[0]["championId"]);
        secondChampion = await retrieveChampionUrl(masteryInfo[1]["championId"]);
        thirdChampion = await retrieveChampionUrl(masteryInfo[2]["championId"]);
      }
    }

    
  }


  Future<String> retrieveChampionUrl(int championid) async {
    String championsUrl = "http://ddragon.leagueoflegends.com/cdn/$version/data/en_US/champion.json";
    final championsJson = await http.get(Uri.parse(championsUrl));
    Map<String, dynamic> championsList = json.decode(championsJson.body)["data"];
    String currentChampion = "Aatrox";

    championsList.forEach((key, value) {
        if(value["key"] == championid.toString()){
          currentChampion = key;
        }
    });
    return "$url/champion/$currentChampion.png";
  }

  Future<String> retrieveSummonerIconUrl(int iconid) async {
    return "http://ddragon.leagueoflegends.com/cdn/$version/img/profileicon/$iconid.png";
  }
}
