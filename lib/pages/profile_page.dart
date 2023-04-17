import 'package:flutter/material.dart';
import 'package:myapp/models/summoner.dart';
import 'package:myapp/components/my_matchlisttile.dart';
import 'package:myapp/repositories/match_repository.dart';

class ProfilePage extends StatefulWidget {
  const ProfilePage({super.key});

  @override
  State<ProfilePage> createState() => _ProfilePageState();
}

class _ProfilePageState extends State<ProfilePage> {
  @override
  Widget build(BuildContext context) {
    final tabela = MatchRepository.tabela;
    final user = Summoner(
        iconeInvocador: "images/summoners_icons/666.png",
        nomeInvocador: "Kami",
        firstChampion: "images/champions/Caitlyn_0.jpg",
        secondChampion: "images/champions/Mordekaiser_0.jpg",
        thirdChampion: "images/champions/Nasus_0.jpg",
        winrate: 55);
    return Scaffold(
      body: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            const SizedBox(height: 70),
            CircleAvatar(
              maxRadius: 50,
              backgroundImage: AssetImage(user.iconeInvocador),
            ),
            const SizedBox(height: 20),
            Text(
              user.nomeInvocador,
              style: TextStyle(
                  color: Colors.grey[600],
                  fontSize: 28,
                  fontWeight: FontWeight.bold),
            ),
            const SizedBox(height: 20),
            Center(
              child: Wrap(
                children: <Widget>[
                  Padding(
                    padding: const EdgeInsets.only(right: 5),
                    child: CircleAvatar(
                      maxRadius: 30,
                      backgroundImage: AssetImage(user.firstChampion),
                    ),
                  ),
                  Padding(
                    padding: const EdgeInsets.only(right: 5),
                    child: CircleAvatar(
                      maxRadius: 30,
                      backgroundImage: AssetImage(user.secondChampion),
                    ),
                  ),
                  Padding(
                    padding: const EdgeInsets.only(right: 5),
                    child: CircleAvatar(
                      maxRadius: 30,
                      backgroundImage: AssetImage(user.thirdChampion),
                    ),
                  ),
                ],
              ),
            ),
            const SizedBox(height: 20),
            Text(
              "WR:${user.winrate.toString()}%",
              style: TextStyle(
                  color: Colors.grey[600],
                  fontSize: 21,
                  fontWeight: FontWeight.bold),
            ),
            const SizedBox(height: 20),
            Expanded(
              child: ListView.separated(
                  padding: EdgeInsets.zero,
                  itemBuilder: (BuildContext context, int match) {
                    return MyMatchListTile(match: match);
                  },
                  //padding: const EdgeInsets.all(25),
                  separatorBuilder: (_, __) => const Divider(),
                  itemCount: tabela.length),
            ),
          ],
        ),
      ),
    );
  }
}
