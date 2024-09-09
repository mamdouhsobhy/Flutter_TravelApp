import 'package:flutter/material.dart';

class ProgramItem extends StatelessWidget {
  final int index;
  final String program;

  ProgramItem(this.index, this.program, {super.key});

  @override
  Widget build(BuildContext context) {
    return  ListTile(
      leading: CircleAvatar(
        backgroundColor: Colors.amber,
        child: Text("يوم ${index+1}",style: TextStyle(color: Colors.black,fontSize: 12),),

      ),
      title: Text(program,style: TextStyle(color: Colors.black,fontSize: 12),),
    );
  }
}
