import 'package:http/http.dart' as http;
import 'dart:convert';

class NetworkImageUrl {
  String version = "13.12.1";
  String url = "http://ddragon.leagueoflegends.com/cdn/13.12.1/img/";

  Future<String> retrieveChampionUrl(int championid) async {
    String championsUrl = "http://ddragon.leagueoflegends.com/cdn/$version/data/en_US/champion.json";
    final championsJson = await http.get(Uri.parse(championsUrl));
    dynamic championsList = json.decode(championsJson.body)["data"];
    dynamic currentChampion;
    for (var champion in championsList) {
      if (champion[champion]["key"] == championid) {
        currentChampion = champion[champion];
        break;
      }
    }
    String champName = currentChampion["name"];
    return "$url/champion/$champName.png";
  }

  Future<String> retrieveSummonerIconUrl(int iconid) async {
    return "http://ddragon.leagueoflegends.com/cdn/$version/img/profileicon/$iconid.png";
  }
}
