import 'package:flutter/material.dart';
import '../api/riot_api.dart';
import '../models/match.dart';
import 'package:http/http.dart' as http;
import 'dart:convert';

class Summoner extends ChangeNotifier {
  final String version = "13.12.1";
  final String url = "http://ddragon.leagueoflegends.com/cdn/13.12.1/img";
  late String puuid;
  late int summonerLevel;
  late String summonerIcon;
  late String summonerName;
  late String firstChampion;
  late String secondChampion;
  late String thirdChampion;
  late Match firstMatch;
  late Match secondMatch;
  late Match thirdMatch;

  Summoner._create(String sumName) {
    summonerName = sumName;
  }

  static Future<Summoner> create(String sumName) async {
    var sum = Summoner._create(sumName);
    await sum._setupSummonerInfo();
    return sum;
  }

  _setupSummonerInfo() async {
    final summonerInfo = await RiotApi().invokeService("GET_PUUID_BYNAME", summonerName);
    if (summonerInfo.runtimeType != int) {
      puuid = summonerInfo["puuid"];
      summonerIcon = await retrieveSummonerIconUrl(summonerInfo["profileIconId"]);
      summonerLevel = summonerInfo["summonerLevel"];
      final masteryInfo = await RiotApi().invokeService("GET_SUMMONERMASTERY_BYPUUID", puuid);
      if (masteryInfo.runtimeType != int) {
        firstChampion = await retrieveChampionUrl(masteryInfo[0]["championId"]);
        secondChampion = await retrieveChampionUrl(masteryInfo[1]["championId"]);
        thirdChampion = await retrieveChampionUrl(masteryInfo[2]["championId"]);
      }
      final matchsInfo = await RiotApi().invokeService("GET_MATCHS_BYPUUID", puuid);
      firstMatch = await Match.create(matchsInfo[0], puuid);
      secondMatch = await Match.create(matchsInfo[1], puuid);
      thirdMatch = await Match.create(matchsInfo[2], puuid);
    }
    await Future.delayed(const Duration(milliseconds: 100));
    print("[LOG] $summonerName has finished loading.");
  }

  Future<String> retrieveChampionUrl(int championid) async {
    String championsUrl = "http://ddragon.leagueoflegends.com/cdn/$version/data/en_US/champion.json";
    final championsJson = await http.get(Uri.parse(championsUrl));
    Map<String, dynamic> championsList = json.decode(championsJson.body)["data"];
    String currentChampion = "Aatrox";
    championsList.forEach((key, value) {
      if (value["key"] == championid.toString()) {
        currentChampion = key;
      }
    });
    return "$url/champion/$currentChampion.png";
  }

  Future<String> retrieveSummonerIconUrl(int iconid) async {
    return "http://ddragon.leagueoflegends.com/cdn/$version/img/profileicon/$iconid.png";
  }
}
