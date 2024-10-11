import 'package:fl_chart/fl_chart.dart';
import 'package:flutter/material.dart';
import 'package:rental/data/bar_graph_data.dart';
import 'package:rental/models/graph_model.dart';

class BarGraphCard extends StatelessWidget{
  const BarGraphCard({super.key});
  List<BarChartGroupData> _chartGroups(List<GraphModel> points, Color color){
    return points.map((point)=>BarChartGroupData(x: point.x.toInt(), barRods: [
      BarChartRodData(toY: point.y, width: 12, color: color.withOpacity(point.y.toInt()>4?1:0.4),
      borderRadius: const BorderRadius.only(topLeft: Radius.circular(3.0),topRight: Radius.circular(3.0)))
    ])).toList();
  }
  @override
  Widget build(BuildContext context) {
    BarGraphData barGraphData = BarGraphData();
    return  SafeArea(child:Card(
      child:  Column(
        children: [
          const Text("Total Payments and Balances",style: TextStyle(fontSize: 14,fontWeight: FontWeight.w500),),
          const SizedBox(height: 20),
          AspectRatio(aspectRatio: 16/6,
          child: BarChart(
            BarChartData(
              barGroups: _chartGroups(barGraphData.data[0].graph,barGraphData.data[0].color,),
              borderData: FlBorderData(border: const Border()),
              gridData: const FlGridData(show: false),
              titlesData: FlTitlesData(
                 bottomTitles: AxisTitles(sideTitles: SideTitles(showTitles: true, 
                 getTitlesWidget: (value,meta) => Padding(padding: const EdgeInsets.only(top: 5),
                 child: Text(barGraphData.label[value.toInt()],
                 style:  const TextStyle(fontSize: 11, color: Colors.grey, fontWeight: FontWeight.w400),),
                 ) )) ,
                 rightTitles: const AxisTitles(sideTitles: SideTitles(showTitles: false)),
                 topTitles: const AxisTitles(sideTitles: SideTitles(showTitles: false)),
                )
              )
          ,)
          )
      ],
      ),
    ));
  }
}