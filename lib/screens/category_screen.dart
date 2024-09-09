import 'package:flutter/material.dart';
import 'package:travel_app/app_data.dart';
import 'package:travel_app/widget/category_item.dart';

class CategoryScreen extends StatelessWidget {
  static const route = "/CategoryScreen";
  const CategoryScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return GridView(
        padding: EdgeInsets.all(10),
        gridDelegate:SliverGridDelegateWithMaxCrossAxisExtent(
            maxCrossAxisExtent: 200,
          childAspectRatio: 7/8,
          mainAxisSpacing: 10,
          crossAxisSpacing: 10
        ),
        children: categoryData.map((e) =>
        CategoryItem(e.id,e.title, e.imageUrl
        )).toList(),
    );
  }
}
