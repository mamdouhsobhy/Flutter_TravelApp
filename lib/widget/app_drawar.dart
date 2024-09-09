import 'package:flutter/material.dart';
import 'package:travel_app/screens/filter_screen.dart';

class AppDrawar extends StatelessWidget {
  const AppDrawar({super.key});

  Widget buildClickableItem(String title, IconData icon, Function fun) {
    return InkWell(
        child: Container(
          margin: EdgeInsets.symmetric(horizontal: 20),
          child: Row(
            children: [
              Icon(
                icon,
                color: Colors.blue,
              ),
              SizedBox(
                width: 15,
              ),
              Text(title,
                  style: TextStyle(
                      color: Colors.black,
                      fontSize: 16,
                      fontWeight: FontWeight.bold))
            ],
          ),
        ),
        onTap: () {
          fun();
        });
  }

  @override
  Widget build(BuildContext context) {
    return Drawer(
      child: Column(
        children: [
          Container(
            child: Text(
              "دليلك السياحي",
              style: Theme.of(context).textTheme.headline6,
            ),
            height: 100,
            width: double.infinity,
            color: Colors.amber,
            alignment: Alignment.center,
            padding: EdgeInsets.only(top: 40),
          ),
          SizedBox(
            height: 20,
          ),
          buildClickableItem("الرحلات", Icons.card_travel, () {
            Navigator.of(context).pushReplacementNamed('/');
          }),
          SizedBox(
            height: 15,
          ),
          buildClickableItem("الفلترة", Icons.filter_list, () {
            Navigator.of(context).pushReplacementNamed(FilterScreen.route);
          })
        ],
      ),
    );
  }
}
