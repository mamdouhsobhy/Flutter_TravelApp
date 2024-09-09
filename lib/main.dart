import 'package:flutter/material.dart';
import 'package:travel_app/screens/category_screen.dart';
import 'package:flutter_localizations/flutter_localizations.dart';
import 'package:travel_app/screens/category_trip_screen.dart';
import 'package:travel_app/screens/favourite_screen.dart';
import 'package:travel_app/screens/filter_screen.dart';
import 'package:travel_app/screens/new_tabs_screen.dart';
import 'package:travel_app/screens/tabs_screen.dart';
import 'package:travel_app/screens/trip_details_screen.dart';
import 'package:travel_app/models/trip.dart';
import 'package:travel_app/app_data.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatefulWidget {
  const MyApp({super.key});

  @override
  State<MyApp> createState() => _MyAppState();
}

class _MyAppState extends State<MyApp> {
  Map<String,bool> _filters = {
    'summer': false,
    'winter': false,
    'family': false,
  };

  List<Trip> _availableTrips = tripsData;

  List<Trip> _favTrip = [];

  void _addTripToFav(Trip trip){
    setState(() {
      if(!_favTrip.contains(trip)) {
        _favTrip.add(trip);
      }else{
        _favTrip.remove(trip);
      }
    });
  }

  void _changeFilter(Map<String,bool> filterDate){
    setState(() {
      _filters = filterDate;
      _availableTrips = tripsData.where((trip){
        if(_filters['summer'] == true && trip.isInSummer!=true){
          return false;
        }
        if(_filters['winter'] == true && trip.isInWinter!=true){
          return false;
        }
        if(_filters['family'] == true && trip.isForFamilies!=true){
          return false;
        }
        return true;
      }).toList();
    });
  }

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Travel app',
      theme: ThemeData(
          primarySwatch: Colors.blue,
          colorScheme: ColorScheme.fromSeed(seedColor: Colors.amber),
          useMaterial3: true,
          textTheme: ThemeData.light().textTheme.copyWith(
              headline5: TextStyle(
                  color: Colors.blue,
                  fontSize: 24,
                  fontFamily: "tajawal",
                  fontWeight: FontWeight.bold),
              headline6: TextStyle(
                  color: Colors.white,
                  fontSize: 26,
                  fontFamily: "tajawal",
                  fontWeight: FontWeight.bold))),
      localizationsDelegates: [
        GlobalCupertinoLocalizations.delegate,
        GlobalMaterialLocalizations.delegate,
        GlobalWidgetsLocalizations.delegate,
      ],
      supportedLocales: [Locale("ar", "AE")],
      locale: Locale("ar", "AE"),
      initialRoute: '/',
      routes: {
        '/': (ctx) => NewTabsScreen(_favTrip),
        CategoryScreen.route: (ctx) => CategoryScreen(),
        CategoryTripsScreen.route: (ctx) => CategoryTripsScreen(_availableTrips),
        TripDetailsScreen.route: (ctx) => TripDetailsScreen(_addTripToFav),
        FilterScreen.route: (ctx) => FilterScreen(_changeFilter , _filters)
      },
    );
  }
}
