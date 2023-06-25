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
  late Summoner user;
  Future<Summoner> createProfilePage() async{
   return await Summoner.create("MDK GhostSoul");
  }
  
  @override
  Widget build(BuildContext context) {
    final tabela = MatchRepository.tabela;

    return Scaffold(
      body: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            const SizedBox(height: 70),
            const CircleAvatar(
              maxRadius: 50,
              backgroundImage: NetworkImage("http://ddragon.leagueoflegends.com/cdn/13.12.1/img/profileicon/66.png"),
            ),
            const SizedBox(height: 20),
            Text(
              "KillerGray",
              style: TextStyle(color: Colors.grey[600], fontSize: 28, fontWeight: FontWeight.bold),
            ),
            const SizedBox(height: 20),
            const Center(
              child: Wrap(
                children: <Widget>[
                  Padding(
                    padding: EdgeInsets.only(right: 5),
                    child: CircleAvatar(
                      maxRadius: 30,
                      backgroundImage: NetworkImage("http://ddragon.leagueoflegends.com/cdn/13.12.1/img/champion/Aatrox.png"),
                    ),
                  ),
                  Padding(
                    padding: EdgeInsets.only(right: 5),
                    child: CircleAvatar(
                      maxRadius: 30,
                      backgroundImage: NetworkImage("http://ddragon.leagueoflegends.com/cdn/13.12.1/img/champion/Gnar.png"),
                    ),
                  ),
                  Padding(
                    padding: EdgeInsets.only(right: 5),
                    child: CircleAvatar(
                      maxRadius: 30,
                      backgroundImage: NetworkImage("http://ddragon.leagueoflegends.com/cdn/13.12.1/img/champion/Nilah.png"),
                    ),
                  ),
                ],
              ),
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
