class ChampionScreen extends StatefulWidget {
  @override
  ChampionScreenState createState() => ChampionScreenState();
}

class ChampionScreenState extends State<ChampionScreen> {
  List<String> championNames = []; // Lista para armazenar os nomes dos campeões
  String baseUrl = 'http://ddragon.leagueoflegends.com/cdn/{version}/img/champion/';

  @override
  void initState() {
    super.initState();
    fetchChampionList();
  }

  Future<void> fetchChampionList() async {
    String apiUrl = 'https://ddragon.leagueoflegends.com/api/versions.json';
    var response = await http.get(Uri.parse(apiUrl));
    if (response.statusCode == 200) {
      var versions = json.decode(response.body);
      String version = versions[0];
      String championUrl = baseUrl.replaceAll('{version}', version);
      apiUrl = 'https://ddragon.leagueoflegends.com/cdn/${version}/data/en_US/champion.json';
      response = await http.get(Uri.parse(apiUrl));
      if (response.statusCode == 200) {
        var championData = json.decode(response.body)['data'];
        setState(() {
          championNames = championData.keys.toList();
        });
      }
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Imagens dos Campeões'),
      ),
      body: GridView.count(
        crossAxisCount: 2,
        children: championNames.map((championName) {
          String imageUrl = '${baseUrl}${championName}.png';
          return Image.network(
            imageUrl,
            fit: BoxFit.cover,
          );
        }).toList(),
      ),
    );
  }
}