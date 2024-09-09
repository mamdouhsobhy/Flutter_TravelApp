import 'package:flutter/material.dart';
import 'package:travel_app/models/trip.dart';
import 'package:travel_app/widget/trip_item.dart';

class FavouriteScreen extends StatefulWidget {
  static const route = '/FavouriteScreen';

  final List<Trip> favTrips;

  const FavouriteScreen(this.favTrips);

  @override
  State<FavouriteScreen> createState() => _FavouriteScreenState();
}

class _FavouriteScreenState extends State<FavouriteScreen> {
  @override
  Widget build(BuildContext context) {
    return ListView.builder(
      itemBuilder: (ctx,index){
        return TripItem(widget.favTrips[index].id,widget.favTrips[index].title, widget.favTrips[index].imageUrl, widget.favTrips[index].duration, widget.favTrips[index].season, widget.favTrips[index].tripType,(id){
          //_removeTrip(id);
        });
      },
      itemCount: widget.favTrips.length,
    );
  }
}
