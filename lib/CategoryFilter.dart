import 'package:flutter/material.dart';

import 'main.dart';

class CategoryFilter extends StatelessWidget {
  // final List categories;
  // final List selected;
  // final Function(String, bool) callback;
  // CategoryFilter(
  //     /*{Key? key, required this.categories, required this.selected, required this.callback}*/
  //     )
      // : super(key: key);

  @override
  Widget build(BuildContext context) {
    // return Flexible(
    //   child: ListView.builder(
    //       itemCount: categories.length,
    //       itemBuilder: (BuildContext context, int index) {
    //         return CheckboxListTile(
    //           value: selected.contains(categories[index]),
    //           onChanged: (bool selected) {
    //             callback(categories[index], selected);
    //           },
    //           title: Text(categories[index]),
    //         );
    //       }),
    // );
    return Scaffold(
      appBar: AppBar(),
      body:   FloatingActionButton(onPressed: (){

        child:SizedBox(
            width: 100,
            height: 100,
            child: Text("click"));
        Navigator.push(
          context,
          MaterialPageRoute(builder: (context) => MyHomePage()),
        );}),
    );
  }
}