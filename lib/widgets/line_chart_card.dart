import 'package:fl_chart/fl_chart.dart';
import 'package:flutter/material.dart';
import 'package:rental/const/constants.dart';
import 'package:rental/data/monthly_payment_data.dart';

class LineChartCard extends StatelessWidget{
  const LineChartCard({super.key});
  @override
  Widget build(BuildContext context) {
    final data = LineData();
    return 
     SafeArea(child:
    Card(
      child:  Column(
        children: [
          const Text("Monthly Payments",style: TextStyle(fontSize: 14,fontWeight: FontWeight.w500),),
          const SizedBox(height: 20),
          AspectRatio(aspectRatio: 16/6,
          child: LineChart(
              LineChartData(
                lineTouchData:const LineTouchData(handleBuiltInTouches: true),
                gridData: const FlGridData(show: false),
                titlesData: FlTitlesData(
                  leftTitles: AxisTitles(sideTitles: 
                  SideTitles(showTitles: true,
                  getTitlesWidget: (double value, TitleMeta meta) =>
                   data.leftTitle[value.toInt()] != null?
                  Text(data.leftTitle[value.toInt()].toString(), style: TextStyle(fontSize: 12, color: Colors.grey),)
                  :SizedBox(),
                  )),
                  bottomTitles: AxisTitles(sideTitles: 
                  SideTitles(showTitles: true,
                  getTitlesWidget: (double value, TitleMeta meta) =>
                   data.bottomTitle[value.toInt()] != null?
                  SideTitleWidget(
                    axisSide: meta.axisSide,
                    child: Text(
                      data.bottomTitle[value.toInt()].toString(),
                      style: TextStyle(fontSize: 12, color: Colors.grey),
                    )
                  ):SizedBox(),
                  )),
                  topTitles: const AxisTitles(sideTitles: SideTitles(showTitles: false)),
                  rightTitles: const AxisTitles(sideTitles: SideTitles(showTitles: false)),
                ),
                borderData: FlBorderData(show: false),
                lineBarsData: [LineChartBarData(
                  color: selectionColor,
                  barWidth: 2.5,
                  belowBarData: BarAreaData(gradient: LinearGradient(
                    begin: Alignment.topCenter,
                    end: Alignment.bottomCenter,
                    colors: [selectionColor.withOpacity(0.5),Colors.transparent]),
                    show: true,
                    ),
                     dotData: const FlDotData(show: false),
                    spots: data.spots
                ),
                ],
                minX: 0,
                maxX: 120,
                minY: -5,
                maxY: 105
              )
          ),
          )
      ],
      ),
    ));
  }
}