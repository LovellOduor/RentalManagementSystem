import 'package:flutter/widgets.dart';
import 'package:rental/widgets/bar_graph_card.dart';
import 'package:rental/widgets/line_chart_card.dart';
import 'package:rental/widgets/page_title_widget.dart';

class AgentDashboardWidget extends StatelessWidget{
  @override
  Widget build(BuildContext context) {
    return SingleChildScrollView(child: 
    Column(
      children: [
        const SizedBox(height: 15,),
        Row(mainAxisAlignment: MainAxisAlignment.start, children:[PageTitle(title: "Dashboard")]),
        const SizedBox(height: 15,),
        LineChartCard(),
        const SizedBox(height: 15,),
        BarGraphCard(),
        const SizedBox(height: 15,),
      ],
    )
    );
  }
}