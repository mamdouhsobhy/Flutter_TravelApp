import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:travel_app/app_data.dart';
import 'package:travel_app/widget/activity_item.dart';
import 'package:travel_app/widget/program_item.dart';

class TripDetailsScreen extends StatefulWidget {
  static const route = "/trip_details_screen";

  Function _addItemToFav;

  TripDetailsScreen(this._addItemToFav,{super.key});

  @override
  State<TripDetailsScreen> createState() => _TripDetailsScreenState();
}

class _TripDetailsScreenState extends State<TripDetailsScreen> {
  Widget addTitle(String title, BuildContext ctx) {
    return Container(
      alignment: Alignment.topRight,
      margin: EdgeInsets.symmetric(horizontal: 10, vertical: 7),
      width: double.infinity,
      child: Text(
        title,
        style: Theme.of(ctx).textTheme.headline5,
      ),
    );
  }

  @override
  Widget build(BuildContext context) {
    final args =
        ModalRoute.of(context)?.settings.arguments as Map<String, String>;

    final String tripId = args['id']!;
    final String triptitle = args['title']!;
    final List<ProgramItem> programs = [];
    final List<ActivityItem> activities = [];
    final selectedTrip =
        tripsData.firstWhere((element) => tripId == element.id);

    for (int i = 0; i < selectedTrip.program.length; i++) {
      programs.add(ProgramItem(i, selectedTrip.program[i]));
    }

    for (int i = 0; i < selectedTrip.activities.length; i++) {
      activities.add(ActivityItem(selectedTrip.activities[i]));
    }

    var heartColor = Colors.white;
    // if(selectedTrip.isFav){
    //   heartColor = Colors.red;
    // }else{
    //   heartColor = Colors.white;
    // }

    return Scaffold(
        appBar: AppBar(
          actions: [
            IconButton(onPressed: (){
              widget._addItemToFav(selectedTrip);
            }, icon: Icon(Icons.favorite,color: heartColor,))
          ],
          title: Text(
            triptitle,
            style: Theme.of(context).textTheme.headline6,
          ),
          centerTitle: false,
          backgroundColor: Colors.blue,
          iconTheme: IconThemeData(color: Colors.white),
        ),
        body: SingleChildScrollView(
            child: Column(
          children: [
            Container(
              height: 250,
              width: double.infinity,
              child: Image.network(fit: BoxFit.cover, selectedTrip.imageUrl),
            ),
            SizedBox(
              height: 10,
            ),
            addTitle("الانشطه", context),
            Card(
              margin: EdgeInsets.symmetric(horizontal: 15),
              elevation: 5.0,
              shape: RoundedRectangleBorder(
                borderRadius: BorderRadius.circular(
                    15), // Match the border radius of ClipRRect
              ),
              child: ClipRRect(
                borderRadius: BorderRadius.circular(15),
                child: Container(
                  color: Colors.white,
                  child: Column(
                    children: activities,
                  ),
                ),
              ),
            ),
            SizedBox(
              height: 10,
            ),
            addTitle("البرنامج اليومي", context),
            Card(
              margin: EdgeInsets.symmetric(horizontal: 15),
              elevation: 5.0,
              shape: RoundedRectangleBorder(
                borderRadius: BorderRadius.circular(
                    15), // Match the border radius of ClipRRect
              ),
              child: ClipRRect(
                borderRadius: BorderRadius.circular(15),
                child: Container(
                  color: Colors.white,
                  child: Column(
                    children: programs,
                  ),
                ),
              ),
            ),
            SizedBox(
              height: 100,
            )
          ],
        )
        ),
      floatingActionButton: FloatingActionButton(onPressed: (){
        Navigator.of(context).pop(tripId);
      }, child: Icon(Icons.delete,color: Colors.amber,),
        backgroundColor: Colors.white,
      ),
    );
  }
}
