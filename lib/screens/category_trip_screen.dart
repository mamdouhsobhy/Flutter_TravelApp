import 'package:flutter/material.dart';
import 'package:rflutter_alert/rflutter_alert.dart';
import 'package:travel_app/app_data.dart';
import 'package:travel_app/models/trip.dart';
import 'package:travel_app/widget/category_item.dart';
import 'package:travel_app/widget/trip_item.dart';

class CategoryTripsScreen extends StatefulWidget {
  static const route = '/CategoryTripsScreen';

  final List<Trip> availableTrips;

  const CategoryTripsScreen(this.availableTrips,{super.key});

  @override
  State<CategoryTripsScreen> createState() => _CategoryTripsScreenState();
}

class _CategoryTripsScreenState extends State<CategoryTripsScreen> {

  late String categoryTitle;
  late String categoryId;
  List<Trip> displayTrip = [];
  String tripId = "";

  @override
  void didChangeDependencies() {
    if(tripId=="") {
      final args = ModalRoute
          .of(context)
          ?.settings
          .arguments as Map<String, String>;

      categoryId = args['id']!;
      categoryTitle = args['title']!;
      displayTrip = widget.availableTrips.where((element) {
        return element.categories.contains(categoryId);
      }).toList();
    }
    super.didChangeDependencies();
  }

  void _removeTrip(String tripId) {
    setState(() {
      this.tripId = tripId;
      print("iam here did remove");
      print("Trying to remove trip with id: $tripId");
      displayTrip.removeWhere((element) => element.id == tripId);
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: Colors.cyan[700],
        title: Text(categoryTitle, style: Theme
            .of(context)
            .textTheme
            .headline6),
        centerTitle: true,
        iconTheme: IconThemeData(color: Colors.white),
      ),
      body: ListView.builder(
        itemBuilder: (ctx,index){
          return TripItem(displayTrip[index].id,displayTrip[index].title, displayTrip[index].imageUrl, displayTrip[index].duration, displayTrip[index].season, displayTrip[index].tripType,(id){
            _removeTrip(id);
          });
        },
        itemCount: displayTrip.length,
      ),
    );
  }
}

