import 'package:flutter/material.dart';
import 'package:travel_app/models/trip.dart';
import 'package:travel_app/screens/category_screen.dart';
import 'package:travel_app/screens/favourite_screen.dart';
import 'package:travel_app/widget/app_drawar.dart';

class NewTabsScreen extends StatefulWidget {

  final List<Trip> favTrips;

  NewTabsScreen(this.favTrips,{super.key});

  @override
  State<NewTabsScreen> createState() => _NewTabsScreenState();
}

class _NewTabsScreenState extends State<NewTabsScreen> {
  int _selectedScreenIndex = 0;

  void _selectScreen(int index){
    setState(() {
      _selectedScreenIndex = index;
    });
  }

  List<Trip> mfavTrips = [];

  late Object favScreen;

  @override
  void initState() {
    mfavTrips = widget.favTrips;
    favScreen = FavouriteScreen(mfavTrips);
    super.initState();
  }

  List<Map<String, Object>> get _screens => [
    {
      'Screen': CategoryScreen(),
      'Title': "التصنيفات",
    },
    {
      'Screen': favScreen,
      'Title': "المفضلات",
    },
  ];

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        appBar: AppBar(
          backgroundColor: Colors.blue,
          title: Text(_screens[_selectedScreenIndex]['Title'] as String,style: TextStyle(color: Colors.white,fontSize: 16),),
          centerTitle: true,
        ),
      drawer: AppDrawar(),
      body: _screens[_selectedScreenIndex]['Screen'] as Widget,
      bottomNavigationBar: BottomNavigationBar(
        onTap: (index){
          _selectScreen(index);
        },
        currentIndex: _selectedScreenIndex,
        backgroundColor: Colors.blue,
          selectedItemColor: Colors.amber,
          unselectedItemColor: Colors.white,
          items: [
            BottomNavigationBarItem(icon: Icon(Icons.dashboard),label: "التصنيفات"),
            BottomNavigationBarItem(icon: Icon(Icons.star),label: "المفضلة")
          ]
      ),
    );
  }
}
