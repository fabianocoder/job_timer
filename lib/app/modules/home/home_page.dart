import 'package:flutter/material.dart';
import 'package:job_timer/app/modules/home/widgets/headers_project_menu.dart';

class HomePage extends StatelessWidget {
  const HomePage({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      drawer: const Drawer(
        child: SafeArea(
          child: ListTile(
            title: Text("Sair"),
          ),
        ),
      ),
      body: SafeArea(
        child: CustomScrollView(
          slivers: [
            const SliverAppBar(
              title: Text("projetos"),
              expandedHeight: 100,
              toolbarHeight: 100,
              centerTitle: true,
              shape: RoundedRectangleBorder(
                borderRadius:
                    BorderRadius.vertical(bottom: Radius.circular(15)),
              ),
            ),
            SliverPersistentHeader(
              delegate: HeaderProjectsMenus(),
              pinned: true,
            ),
            SliverList(
                delegate: SliverChildListDelegate([
              Container(
                color: Colors.blue,
                height: 150,
              ),
              Container(
                color: Colors.blue,
                height: 150,
              ),
              Container(
                color: Colors.blue,
                height: 150,
              ),
              Container(
                color: Colors.blue,
                height: 150,
              ),
              Container(
                color: Colors.blue,
                height: 150,
              ),
            ]))
          ],
        ),
      ),
    );
  }
}
