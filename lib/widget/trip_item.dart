import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:travel_app/models/trip.dart';
import 'package:travel_app/screens/trip_details_screen.dart';

class TripItem extends StatelessWidget {
  final String tripId;
  final String tripTitle;
  final String tripImage;
  final int duration;
  final Season season;
  final TripType tripType;
  final Function removeItem;

  TripItem(this.tripId,this.tripTitle, this.tripImage, this.duration, this.season, this.tripType, this.removeItem);

  void selectTrip(BuildContext context){
    Navigator.of(context).pushNamed(
        TripDetailsScreen.route,
        arguments: {
          'id': tripId,
          'title': tripTitle,
        }
    ).then((value) => {
      if(value!=null){
        removeItem(value)
      }
    });
  }

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.symmetric(horizontal: 8.0,vertical: 8.0),
      child: InkWell(
        borderRadius: BorderRadius.circular(22),
        onTap: (){
          selectTrip(context);
        },
        splashColor: Theme
            .of(context)
            .primaryColor,
        child: Card(
          elevation: 5.0,
            shape: RoundedRectangleBorder(
              borderRadius: BorderRadius.circular(22), // Match the border radius of ClipRRect
            ),
          child: ClipRRect(
            borderRadius: BorderRadius.circular(22),
            child: Column(
              children: [
                Stack(
                  alignment: Alignment.center,
                  children: [
                    Image.network(fit: BoxFit.cover,height: 250,width: double.infinity,tripImage),
                    Container(
                      decoration: BoxDecoration(
                        gradient: LinearGradient(
                        begin: Alignment.topCenter,
                        end: Alignment.bottomCenter,
                        stops: [
                          0.5,1
                        ]
                        ,
                            colors: [
                              Colors.black.withOpacity(0),
                              Colors.black.withOpacity(0.8),
                            ]
                        )
                      ),
                      height: 250
                    ),
                    Positioned(
                      bottom: 0.0,
                        right: 0.0,
                        child: Padding(
                          padding: const EdgeInsets.all(8.0),
                          child: Text(tripTitle,style: Theme.of(context).textTheme.headline6,),
                        )
                    )
                  ],
                ),
                Padding(
                  padding: const EdgeInsets.all(15.0),
                  child: Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    crossAxisAlignment: CrossAxisAlignment.center,
                    children: [
                      Row(
                        children: [
                          Icon(Icons.calendar_today,color: Colors.amber,),
                          SizedBox(width: 5,),
                          Text("$duration",style: TextStyle(color: Colors.black),)
                        ],
                      ),
                      Row(
                        children: [
                          Icon(Icons.sunny,color: Colors.amber,),
                          SizedBox(width: 5,),
                          Text(season.name,style: TextStyle(color: Colors.black),)
                        ],
                      ),
                      Row(
                        children: [
                          Icon(Icons.local_activity,color: Colors.amber,),
                          SizedBox(width: 5,),
                          Text(tripType.name,style: TextStyle(color: Colors.black),)
                        ],
                      )
                    ],
                  ),
                )

              ],
            ),
          ),
        ),
      ),
    );
  }
}
