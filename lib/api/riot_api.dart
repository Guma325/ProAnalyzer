import 'package:http/http.dart' as http;
import 'dart:convert';

class RiotApi {
  String url = "https://br1.api.riotgames.com/";
  String apikey = "RGAPI-6d9dff97-03ae-4520-a1e3-26546cd698df";
  RiotApi();

  Future<dynamic> invokeService(String service, String requestInfo) async {
    String serviceEndPoint = "";
    switch (service) {
      case "GET_PUUID_BYNAME":
        serviceEndPoint = "${url}lol/summoner/v4/summoners/by-name/$requestInfo?api_key=$apikey";
        break;
      case "GET_SUMMONERMASTERY_BYPUUID":
        serviceEndPoint = "${url}lol/champion-mastery/v4/champion-masteries/by-puuid/$requestInfo?api_key=$apikey";
        break;
    }
    final response = await http.get(Uri.parse(serviceEndPoint));
    if (response.statusCode == 200) {
      return json.decode(response.body);
    } else {
      return response.statusCode;
    }
  }
}
