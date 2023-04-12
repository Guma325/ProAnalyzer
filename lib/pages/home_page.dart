import 'dart:ffi';

import 'package:flutter/material.dart';
import 'package:myapp/components/bottom_navbar.dart';
import 'package:myapp/components/my_button.dart';
import 'package:myapp/components/my_textfield.dart';
import 'package:myapp/repositories/matches_repository.dart';

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
    final tabela = MatchesRepository.tabela;

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
              icon: ImageIcon(AssetImage('images/top.png')),
            ),
            Tab(
              icon: ImageIcon(AssetImage('images/jg.png')),
            ),
            Tab(
              icon: ImageIcon(AssetImage('images/mid.png')),
            ),
            Tab(
              icon: ImageIcon(AssetImage('images/adc.png')),
            ),
            Tab(
              icon: ImageIcon(AssetImage('images/sup.png')),
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
