class Match {
  String championPlayed;
  String matchResult;
  int kills;
  int deaths;
  int assists;
  String item1;
  String item2;
  String item3;
  String item4;
  String item5;
  String item6;
  String summonerSpell1;
  String summonerSpell2;

  Match(
      {required this.championPlayed,
      required this.matchResult,
      required this.kills,
      required this.deaths,
      required this.assists,
      required this.item1,
      required this.item2,
      required this.item3,
      required this.item4,
      required this.item5,
      required this.item6,
      required this.summonerSpell1,
      required this.summonerSpell2});
}
