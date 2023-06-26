import 'package:flutter/material.dart';
import 'package:myapp/models/summoner.dart';
import 'package:myapp/components/my_matchlisttile.dart';

class ProfilePage extends StatefulWidget {
  const ProfilePage({super.key});

  @override
  State<ProfilePage> createState() => _ProfilePageState();
}

class _ProfilePageState extends State<ProfilePage> {
  @override
  Widget build(BuildContext context) => Scaffold(
        body: FutureBuilder<Summoner>(
          future: Summoner.create("KillerGray"),
          builder: (context, snapshot) {
            switch (snapshot.connectionState) {
              case ConnectionState.waiting:
                return const Center(child: CircularProgressIndicator());
              default:
                if (!snapshot.hasError && snapshot.hasData) {
                  Summoner? user = snapshot.data;
                  return Center(
                    child: Column(
                      mainAxisAlignment: MainAxisAlignment.center,
                      children: [
                        const SizedBox(height: 70),
                        CircleAvatar(
                          maxRadius: 50,
                          backgroundImage: NetworkImage(user!.summonerIcon),
                        ),
                        const SizedBox(height: 20),
                        Text(
                          user.summonerName,
                          style: TextStyle(color: Colors.grey[600], fontSize: 28, fontWeight: FontWeight.bold),
                        ),
                        const SizedBox(height: 20),
                        Center(
                          child: Wrap(
                            children: <Widget>[
                              Padding(
                                padding: const EdgeInsets.only(right: 5),
                                child: CircleAvatar(
                                  maxRadius: 30,
                                  backgroundImage: NetworkImage(user.firstChampion),
                                ),
                              ),
                              Padding(
                                padding: const EdgeInsets.only(right: 5),
                                child: CircleAvatar(
                                  maxRadius: 30,
                                  backgroundImage: NetworkImage(user.secondChampion),
                                ),
                              ),
                              Padding(
                                padding: const EdgeInsets.only(right: 5),
                                child: CircleAvatar(
                                  maxRadius: 30,
                                  backgroundImage: NetworkImage(user.thirdChampion),
                                ),
                              ),
                            ],
                          ),
                        ),
                        const SizedBox(height: 20),
                        Expanded(
                          child: ListView(
                            children: [
                              MyMatchListTile(match: user.firstMatch),
                              MyMatchListTile(match: user.secondMatch),
                              MyMatchListTile(match: user.thirdMatch),
                            ],
                          ),
                        ),
                      ],
                    ),
                  );
                } else {
                  return const Center(child: Text("Has error"));
                }
            }
          },
        ),
      );
}
