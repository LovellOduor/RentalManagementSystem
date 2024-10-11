import 'package:flutter/widgets.dart';
import 'package:rental/widgets/bar_graph_card.dart';
import 'package:rental/widgets/line_chart_card.dart';
import 'package:rental/widgets/page_title_widget.dart';

class LandlordDashboardContentWidget extends StatelessWidget{
  @override
  Widget build(BuildContext context) {
    return SingleChildScrollView(child: 
    Container(
      margin: const EdgeInsets.all(20),
      child: 
    const Column(
      children: [
        SizedBox(height: 15,),
        Row(mainAxisAlignment: MainAxisAlignment.start, children: [PageTitle(title: "Dashboard")]),
        SizedBox(height: 15,),
        LineChartCard(),
        SizedBox(height: 15,),
        BarGraphCard(),
        SizedBox(height: 15,),
      ],
    ))
    );
  }
}