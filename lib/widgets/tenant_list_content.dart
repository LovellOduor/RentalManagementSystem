import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';
import 'package:rental/widgets/search_bar_widget.dart';
import 'package:rental/widgets/search_filters_widget.dart';
import 'package:rental/widgets/tenant_card_widget.dart';
import 'package:rental/widgets/page_title_widget.dart';

class TenantListContent extends StatefulWidget{
  const TenantListContent({super.key});
  @override
  State<StatefulWidget> createState() {
    return _TenantListContentState();
  }
}

class _TenantListContentState extends State<TenantListContent>{
  Widget build(BuildContext context){
    return SafeArea(child: Container(
      margin: const EdgeInsets.all(40),
      child: Column(children: [
          Row(
          mainAxisAlignment: MainAxisAlignment.start,
          children: [ PageTitle(title:"Tenants")]
          ),
          SearchBarWidget(),
          SizedBox(height: 10),
          SearchFiltersWidget(),
          SizedBox(height: 10,),
        Container(
              height: 500,
              width: 1000,
              child: GridView.count(
            crossAxisCount: 4,
            childAspectRatio: 0.85,
            children:[ 
                TenantCard(),
                TenantCard(),
                TenantCard(), 
                TenantCard(),
                TenantCard(),
                TenantCard(),
              ]
      ))]
      )
    ));
  }
}