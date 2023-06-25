import 'package:flutter/material.dart';
import 'package:myapp/components/my_listtile_copy.dart';
import 'package:myapp/models/summoner.dart';
import 'package:myapp/repositories/summoner_repository.dart';
import 'package:provider/provider.dart';

class HomePage extends StatefulWidget {
  const HomePage({super.key});

  @override
  State<HomePage> createState() => _MyStatefulWidgetState();
}

class _MyStatefulWidgetState extends State<HomePage> with TickerProviderStateMixin {
  late TabController _tabController;
  late List<Summoner> tabela;
  late SummonerRepository summoners;

  @override
  void initState() {
    super.initState();
    _tabController = TabController(length: 5, vsync: this);
  }

  @override
  Widget build(BuildContext context) {
    summoners = context.watch<SummonerRepository>();
    tabela = summoners.tabela;
    return Scaffold(
      backgroundColor: Colors.transparent,
      appBar: AppBar(
        backgroundColor: Colors.transparent,
        toolbarHeight: 5,
        automaticallyImplyLeading: false,
        elevation: 0,
        bottom: TabBar(
          controller: _tabController,
          unselectedLabelColor: Colors.grey[400],
          indicator: UnderlineTabIndicator(
            borderSide: BorderSide(color: Colors.grey.shade600, width: 3.5),
            insets: const EdgeInsets.fromLTRB(50.0, 40.0, 50.0, 5.0),
          ),
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
                  itemBuilder: (BuildContext context, int summoner) {
                    return MyListTile(summoner: summoner);
                  },
                  padding: const EdgeInsets.all(25),
                  separatorBuilder: (_, __) => const Divider(),
                  itemCount: tabela.length)),
          Scaffold(
              body: ListView.separated(
                  itemBuilder: (BuildContext context, int summoner) {
                    return MyListTile(summoner: summoner);
                  },
                  padding: const EdgeInsets.all(25),
                  separatorBuilder: (_, __) => const Divider(),
                  itemCount: tabela.length)),
          Scaffold(
              body: ListView.separated(
                  itemBuilder: (BuildContext context, int summoner) {
                    return MyListTile(summoner: summoner);
                  },
                  padding: const EdgeInsets.all(25),
                  separatorBuilder: (_, __) => const Divider(),
                  itemCount: tabela.length)),
          Scaffold(
              body: ListView.separated(
                  itemBuilder: (BuildContext context, int summoner) {
                    return MyListTile(summoner: summoner);
                  },
                  padding: const EdgeInsets.all(25),
                  separatorBuilder: (_, __) => const Divider(),
                  itemCount: tabela.length)),
          Scaffold(
              body: ListView.separated(
                  itemBuilder: (BuildContext context, int summoner) {
                    return MyListTile(summoner: summoner);
                  },
                  padding: const EdgeInsets.all(25),
                  separatorBuilder: (_, __) => const Divider(),
                  itemCount: tabela.length)),
        ],
      ),
    );
  }
}
