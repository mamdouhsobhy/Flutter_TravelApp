import 'package:flutter/material.dart';
import 'package:travel_app/screens/category_screen.dart';
import 'package:travel_app/screens/favourite_screen.dart';

class TabsScreen extends StatelessWidget {
  const TabsScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return DefaultTabController(
      length: 2,
      child: Scaffold(
        appBar: AppBar(
          backgroundColor: Colors.blue,
          title: Text('دليلك السياحي',style: TextStyle(color: Colors.white,fontSize: 16),),
          centerTitle: true,
          bottom: TabBar(
              tabs: [
                Tab(
                  icon: Icon(Icons.dashboard),
                  text: "التصنيفات",
                ),
                Tab(
                  icon: Icon(Icons.star),
                  text: "المفضله",
                )
              ]
          ),
        ),
        body: TabBarView(
            children: [
              CategoryScreen(),
              //FavouriteScreen()
            ]
        ),
      ),
    );
  }
}
