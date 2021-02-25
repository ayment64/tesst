import 'package:flutter/material.dart';

class Item {
  const Item(this.name, this.icon);
  final String name;
  final Icon icon;
}

List<Item> languages = <Item>[
  const Item(
      'English',
      Icon(
        Icons.language,
        color: Colors.blue,
      )),
  const Item(
      'French',
      Icon(
        Icons.language,
        color: Colors.blue,
      )),
];
