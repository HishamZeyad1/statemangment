import 'package:flutter/material.dart';

class _CategorySelectorState extends State {
  final selectedCategories = [];

  handleChange(String name, bool selected) {
    setState(() {
      if (selected) {
        selectedCategories.add(name);
      } else {
        selectedCategories.remove(name);
      }
    });
  }

  @override
  Widget build(BuildContext context) {
    // return Column(
    //   children: [
    //     CategoryFilter(
    //       categories: widget.categories,
    //       selected: selectedCategories,
    //       callback: handleChange,
    //     ),
    //     Container(
    //       color: Colors.green,
    //       height: 2,
    //     // ),a
    //     SelectedCategories(
    //       categories: selectedCategories,
    //     )
    //   ],
    // );
    return Scaffold(
      appBar: AppBar(),
      body: Text("dddd"),
    );
  }
}


