// ignore_for_file: prefer_const_constructors, prefer_const_literals_to_create_immutables

import 'package:flutter/material.dart';
import 'package:job_timer/app/modules/home/widgets/header_project_menu.dart';

class HomePage extends StatelessWidget {
  const HomePage({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      drawer: Drawer(
        child: SafeArea(
          child: ListTile(
            title: Text('Sair'),
          ),
        ),
      ),
      body: SafeArea(
        child: CustomScrollView(
          slivers: [
            SliverAppBar(
              title: Text('Projetos'),
              expandedHeight: 100,
              toolbarHeight: 100,
              centerTitle: true,
              shape: RoundedRectangleBorder(
                  borderRadius: BorderRadius.vertical(
                bottom: Radius.circular(15),
              )),
            ),
            SliverPersistentHeader(
              delegate: HeaderProjectMenu(),
              pinned: true,
            ),
            SliverList(
              delegate: SliverChildListDelegate([
                Container(
                  color: Colors.blue,
                  height: 200,
                ),
                Container(
                  color: Colors.blue,
                  height: 200,
                ),
                Container(
                  color: Colors.blue,
                  height: 200,
                ),
                Container(
                  color: Colors.blue,
                  height: 200,
                ),
                Container(
                  color: Colors.blue,
                  height: 200,
                  child: Text('FIM'),
                ),
              ]),
            ),
          ],
        ),
      ),
    );
  }
}
