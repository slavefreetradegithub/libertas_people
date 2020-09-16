import 'package:flutter/material.dart';
import 'package:libertaspeople/home/home_page.dart';
import 'package:libertaspeople/todo_practice_work/data/todo_repository.dart';
import 'package:libertaspeople/todo_practice_work/features/peters_todo_list/peters_page.dart';
import 'package:libertaspeople/todo_practice_work/features/vipuls_todo_list/vipuls_page.dart';
import 'package:libertaspeople/todo_practice_work/ui/pages/emmanuels_page.dart';
import 'package:libertaspeople/todo_practice_work/ui/pages/michaels_page.dart';
import 'package:libertaspeople/todo_practice_work/ui/pages/souviks_page.dart';
import 'package:libertaspeople/todo_practice_work/ui/pages/ayushs_page.dart';


class OurDrawer extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Drawer(
      child: ListView(
        // Important: Remove any padding from the ListView.
        padding: EdgeInsets.zero,
        children: <Widget>[
          DrawerHeader(
            child: Image.asset("assets/slavefreetrade.png"),
          ),
          ListTile(
            title: Text("Home Page"),
            onTap: () {
              Navigator.of(context).push(
                MaterialPageRoute(
                  builder: (context) => HomePage(),
                ),
              );
            },
          ),
          ListTile(
            title: Text("Peter's Page"),
            onTap: () {
              Navigator.of(context).push(
                MaterialPageRoute(
                  builder: (context) => PetersPage(repo: TodoRepository()),
                ),
              );
            },
          ),
          ListTile(
            title: Text("Souvik's Page"),
            onTap: () {
              Navigator.of(context).push(
                MaterialPageRoute(
                  builder: (context) => SouviksPage(),
                ),
              );
            },
          ),
          ListTile(
            title: Text("Emmanuel's Page"),
            onTap: () {
              Navigator.of(context).push(
                MaterialPageRoute(
                  builder: (context) => EmmanuelsPage(),
                ),
              );
            },
          ),
          ListTile(
            title: Text("Michael's Page"),
            onTap: () {
              Navigator.of(context).push(
                MaterialPageRoute(
                  builder: (context) => MichaelsPage(repo: TodoRepository()),
                ),
              );
            },
          ),
          ListTile(
            title: Text("Ayush's Page"),
            onTap: () {
              Navigator.of(context).push(
                MaterialPageRoute(
                  builder: (context) => AyushsPage(),
                ),
              );
            },
          ),
          ListTile(
            title: Text("Vipul's Page"),
            onTap: () {
              Navigator.of(context).push(
                MaterialPageRoute(
                  builder: (context) => VipulsPage(
                    repo: TodoRepository(),
                  ),
                ),
              );
            },
          ),
        ],
      ),
    );
  }
}
