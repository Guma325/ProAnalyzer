import 'dart:ffi';

import 'package:flutter/material.dart';
import 'package:myapp/components/bottom_navbar.dart';
import 'package:myapp/components/my_button.dart';
import 'package:myapp/components/my_textfield.dart';
import 'package:myapp/repositories/summoner_repository.dart';

class HomePage extends StatefulWidget {
  const HomePage({super.key});

  @override
  State<HomePage> createState() => _MyStatefulWidgetState();
}

class _MyStatefulWidgetState extends State<HomePage>
    with TickerProviderStateMixin {
  late TabController _tabController;

  @override
  void initState() {
    super.initState();
    _tabController = TabController(length: 5, vsync: this);
  }

  @override
  Widget build(BuildContext context) {
    final tabela = SummonerRepository.tabela;

    return Scaffold(
      backgroundColor: Colors.transparent,
      appBar: AppBar(
        backgroundColor: Colors.transparent,
        toolbarHeight: 5,
        automaticallyImplyLeading: false,
        bottom: TabBar(
          controller: _tabController,
          indicator: BoxDecoration(
              borderRadius: BorderRadius.circular(40),
              border: Border.all(color: Colors.black)),
          splashBorderRadius: BorderRadius.circular(80),
          tabs: const <Widget>[
            Tab(
              icon: ImageIcon(AssetImage('images/summoners_icons/top.png')),
            ),
            Tab(
              icon: ImageIcon(AssetImage('images/summoners_icons/jg.png')),
            ),
            Tab(
              icon: ImageIcon(AssetImage('images/summoners_icons/mid.png')),
            ),
            Tab(
              icon: ImageIcon(AssetImage('images/summoners_icons/adc.png')),
            ),
            Tab(
              icon: ImageIcon(AssetImage('images/summoners_icons/sup.png')),
            ),
          ],
        ),
      ),
      body: TabBarView(
        controller: _tabController,
        children: <Widget>[
          Scaffold(
              body: ListView.separated(
                  itemBuilder: (BuildContext context, int match) {
                    return ListTile(
                      leading: Image.asset(tabela[match].iconeInvocador),
                      title: Text(tabela[match].nomeInvocador),
                      trailing: Image.asset(tabela[match].firstChampion),
                    );
                  },
                  padding: const EdgeInsets.all(25),
                  separatorBuilder: (_, __) => const Divider(),
                  itemCount: tabela.length)),
          Scaffold(
              body: ListView.separated(
                  itemBuilder: (BuildContext context, int match) {
                    return ListTile(
                      leading: Image.asset(tabela[match].iconeInvocador),
                      title: Text(
                        tabela[match].nomeInvocador,
                        textScaleFactor: 1.25,
                      ),
                      subtitle: Row(
                        children: <Widget>[
                          SizedBox(
                            height: 50,
                            width: 50,
                            child: Image.asset(tabela[match].firstChampion),
                          ),
                          SizedBox(
                            height: 50,
                            width: 50,
                            child: Image.asset(tabela[match].secondChampion),
                          ),
                          SizedBox(
                            height: 50,
                            width: 50,
                            child: Image.asset(tabela[match].thirdChampion),
                          )
                        ],
                      ),
                      trailing: Text(
                        "${tabela[match].winrate.toString()}%",
                        textScaleFactor: 1.25,
                      ),
                    );
                  },
                  padding: const EdgeInsets.all(25),
                  separatorBuilder: (_, __) => const Divider(),
                  itemCount: tabela.length)),
          Scaffold(
              body: ListView.separated(
                  itemBuilder: (BuildContext context, int match) {
                    return ListTile(
                      leading: Image.asset(tabela[match].iconeInvocador),
                      title: Text(tabela[match].nomeInvocador),
                      trailing: Image.asset(tabela[match].firstChampion),
                    );
                  },
                  padding: const EdgeInsets.all(25),
                  separatorBuilder: (_, __) => const Divider(),
                  itemCount: tabela.length)),
          Scaffold(
              body: ListView.separated(
                  itemBuilder: (BuildContext context, int match) {
                    return ListTile(
                      leading: Image.asset(tabela[match].iconeInvocador),
                      title: Text(tabela[match].nomeInvocador),
                      trailing: Image.asset(tabela[match].firstChampion),
                    );
                  },
                  padding: const EdgeInsets.all(25),
                  separatorBuilder: (_, __) => const Divider(),
                  itemCount: tabela.length)),
          Scaffold(
              body: ListView.separated(
                  itemBuilder: (BuildContext context, int match) {
                    return ListTile(
                      leading: Image.asset(tabela[match].iconeInvocador),
                      title: Text(tabela[match].nomeInvocador),
                      trailing: Image.asset(tabela[match].firstChampion),
                    );
                  },
                  padding: const EdgeInsets.all(25),
                  separatorBuilder: (_, __) => const Divider(),
                  itemCount: tabela.length)),
        ],
      ),
    );
  }
}
