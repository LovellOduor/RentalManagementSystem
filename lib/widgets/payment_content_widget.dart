import 'package:flutter/widgets.dart';
import 'package:rental/widgets/bar_graph_card.dart';
import 'package:rental/widgets/line_chart_card.dart';
import 'package:rental/widgets/page_title_widget.dart';
import 'package:rental/widgets/payments_list_widget.dart';
import 'package:rental/widgets/search_bar_widget.dart';

class PaymentContentWidget extends StatelessWidget{
  @override
  Widget build(BuildContext context) {
    
    return SingleChildScrollView(child: 
    Column(
      children: [
        const SizedBox(height: 15,),
        const Row( mainAxisAlignment: MainAxisAlignment.start,
         children:[PageTitle(title:"Payments")]),
        const SizedBox(height: 15,),
        LineChartCard(),
        const SizedBox(height: 15,),
        BarGraphCard(),
        const SizedBox(height: 15,),
        SearchBarWidget(),
        const SizedBox(height: 15,),
         SafeArea(child:PaymentsListWidget())
      ],
    )
    );
  }
}