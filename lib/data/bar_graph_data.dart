import 'package:flutter/material.dart';
import 'package:rental/models/bar_graph_model.dart';
import 'package:rental/models/graph_model.dart';

class BarGraphData {
  final data = [
    const BarGraphModel(
        label: "Total Payments and Balances",
        color: Color(0xFFFEB95A),
        graph: [
          GraphModel(x: 0, y: 8),
          GraphModel(x: 1, y: 10),
          GraphModel(x: 2, y: 7),
          GraphModel(x: 3, y: 4),
          GraphModel(x: 4, y: 4),
          GraphModel(x: 5, y: 6),
        ])
  ];

  final label = ['M', 'T', 'W', 'T', 'F', 'S'];
}