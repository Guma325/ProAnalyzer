import '../api/riot_api.dart';
import 'package:http/http.dart' as http;
import 'dart:convert';

class Match {
  final String version = "13.12.1";
  late String puuid;
  late String matchId;
  late String championPlayed;
  late bool matchResult;
  late int kills;
  late int deaths;
  late int assists;
  late String item1;
  late String item2;
  late String item3;
  late String item4;
  late String item5;
  late String item6;
  late String summonerSpell1;
  late String summonerSpell2;

  Match._create(String matchid, String puid) {
    matchId = matchid;
    puuid = puid;
  }

  static Future<Match> create(String matchid, String puid) async {
    var sum = Match._create(matchid, puid);
    await sum._setupMatchInfo();
    return sum;
  }

  _setupMatchInfo() async {
    final matchInfo = await RiotApi().invokeService("GET_MATCH_BYMATCHID", matchId);
    if (matchInfo.runtimeType != int) {
      dynamic match = matchInfo["info"];
      dynamic participants = match["participants"];
      participants.forEach((player) async {
        if (player["puuid"] == puuid) {
          championPlayed = await retrieveChampionUrl(player["championId"]);
          matchResult = player["win"];
          kills = player["kills"];
          deaths = player["deaths"];
          assists = player["assists"];
          item1 = await retrieveItenUrl(player["item0"]);
          item2 = await retrieveItenUrl(player["item1"]);
          item3 = await retrieveItenUrl(player["item2"]);
          item4 = await retrieveItenUrl(player["item3"]);
          item5 = await retrieveItenUrl(player["item4"]);
          item6 = await retrieveItenUrl(player["item5"]);
          summonerSpell1 = await retrieveSummonerSpell(player["summoner1Id"]);
          summonerSpell2 = await retrieveSummonerSpell(player["summoner2Id"]);
        }
      });
    }
    print("---------------------------------{finished}");
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
    return "http://ddragon.leagueoflegends.com/cdn/13.12.1/img/champion/$currentChampion.png";
  }

  Future<String> retrieveItenUrl(int itenId) async {
    if (itenId != 0) {
      return "http://ddragon.leagueoflegends.com/cdn/$version/img/item/$itenId.png";
    } else {
      return "https://hextech.tools/img/champion.0a13d083.svg";
    }
  }

  Future<String> retrieveSummonerSpell(int spellid) async {
    String spellUrl = "http://ddragon.leagueoflegends.com/cdn/$version/data/en_US/summoner.json";
    final spellsJson = await http.get(Uri.parse(spellUrl));
    Map<String, dynamic> championsList = json.decode(spellsJson.body)["data"];
    String currentSpell = "SummonerFlash";
    championsList.forEach((key, value) {
      if (value["key"] == spellid.toString()) {
        currentSpell = key;
      }
    });
    return "http://ddragon.leagueoflegends.com/cdn/13.12.1/img/spell/$currentSpell.png";
  }
}
