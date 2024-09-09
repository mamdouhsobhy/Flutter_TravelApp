import 'package:flutter/material.dart';

class ActivityItem extends StatelessWidget {

  final String title;
   ActivityItem(this.title, {super.key});

  @override
  Widget build(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Container(
          margin: EdgeInsets.all(7),
            child: Text(title,style: TextStyle(color: Colors.black,fontSize: 14),)
        ),
        Divider(
          color: Colors.grey,
          height: 2,
        )
      ],
    );
  }
}
