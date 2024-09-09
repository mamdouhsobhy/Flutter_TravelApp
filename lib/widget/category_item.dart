import 'package:flutter/material.dart';
import 'package:travel_app/screens/category_trip_screen.dart';

class CategoryItem extends StatelessWidget {
  final String id;
  final String title;
  final String imageUrl;

  CategoryItem(this.id,this.title, this.imageUrl);

  void selectCategory(BuildContext context) {
    Navigator.of(context).pushNamed(
        CategoryTripsScreen.route,
      arguments: {
          'id': id,
          'title': title
      }
    );
  }

  @override
  Widget build(BuildContext context) {
    return InkWell(
      onTap: () {
        selectCategory(context);
      },
      splashColor: Theme
          .of(context)
          .primaryColor,
      borderRadius: BorderRadius.circular(12),
      child: ClipRRect(
        borderRadius: BorderRadius.circular(12),
        child: Stack(
          alignment: Alignment.center,
          children: [
            Image.network(
              imageUrl,
              height: 250,
              fit: BoxFit.cover,
            ),
            Container(
              color: Colors.black.withOpacity(0.4),
            ),
            Text(
              title,
              style: Theme
                  .of(context)
                  .textTheme
                  .headline6,
            ),
          ],
        ),
      ),
    );
  }
}
