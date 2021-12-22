import 'package:flutter/material.dart';

class Categories {
  final String id;
  final String title;
  final Color color;

  const Categories({
    required this.id,
    required this.title,
    this.color = Colors.amberAccent,
  });
}
