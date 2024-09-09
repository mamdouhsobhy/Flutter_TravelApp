import 'dart:ffi';

import 'package:flutter/material.dart';
import 'package:travel_app/widget/app_drawar.dart';

class FilterScreen extends StatefulWidget {
  static const route = '/FilterScreen';

  final Function savedFilters;

  final Map<String,bool> filters;

  FilterScreen(this.savedFilters,this.filters, {super.key});

  @override
  State<FilterScreen> createState() => _FilterScreenState();
}

class _FilterScreenState extends State<FilterScreen> {
  var _Summer = false;
  var _Winter = false;
  var _Family = false;

  @override
  void initState() {
    _Summer = widget.filters['summer']!;
    _Winter = widget.filters['winter']!;
    _Family = widget.filters['family']!;
    super.initState();
  }

  Widget buildSwitchListTile(
      String title, String subTitle, var status, Function updateValue) {
    return SwitchListTile(
      title: Text(title),
      subtitle: Text(subTitle),
      value: status,
      onChanged: (bool value) {
        updateValue(value);
      },
    );
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: Colors.blue,
        title: Text("الفلترة"),
        actions: [
          IconButton(
              onPressed: (){
                final selectedFilter = {
                  'summer': _Summer,
                  'winter': _Winter,
                  'family': _Family,
                };
                widget.savedFilters(selectedFilter);
              },
              icon: Icon(Icons.save,color: Colors.white,)
          )
        ],
      ),
      drawer: AppDrawar(),
      body: Column(
        children: [
          Expanded(
              child: ListView(
            children: [
              buildSwitchListTile(
                  "الرحلات الصيفيه", "اظهار الرحلات الصيفيه فقط", _Summer,
                  (newValue) {
                setState(() {
                  _Summer = newValue;
                });
              }),
              buildSwitchListTile(
                  "الرحلات الشتويه", "اظهار الرحلات الشتويه فقط", _Winter,
                  (newValue) {
                setState(() {
                  _Winter = newValue;
                });
              }),
              buildSwitchListTile("الرحلات العائليه",
                  "اظهار الرحلات العائليه فقط", _Family, (newValue) {
                setState(() {
                  _Family = newValue;
                });
              })
            ],
          ))
        ],
      ),
    );
  }
}
