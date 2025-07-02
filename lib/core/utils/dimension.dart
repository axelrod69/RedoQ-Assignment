import 'package:flutter/material.dart';

class Dimension {
  final BuildContext context;

  Dimension({required this.context});

  double get height => MediaQuery.of(context).size.height;

  double get width => MediaQuery.of(context).size.width;
}