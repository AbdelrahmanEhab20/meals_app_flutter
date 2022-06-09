import 'package:flutter/material.dart';

class Category {
  final String id;
  final String tittle;
  final Color color;

  const Category({
    @required this.id,
    @required this.tittle,
    this.color = Colors.orange,
  });
}
