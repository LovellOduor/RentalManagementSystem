import 'package:flutter/material.dart';

class TenantCard extends StatelessWidget{
  @override
  Widget build(BuildContext context) {
    return 
    GestureDetector(
      onTap: () {
        Navigator.of(context).pushNamed("/tenant_payments");
      },
      child: 
         Card(
            child: 
            Column(
                children: [
                  Container(
                    height: 200,
                    width: double.infinity,
                    decoration: const BoxDecoration(
                      borderRadius: BorderRadius.only(topLeft:Radius.circular(10),topRight:Radius.circular(10)),
                      image:DecorationImage(
                          image: AssetImage("assets/passportphoto.jpg"),
                          fit: BoxFit.cover
                      ),
                    ),
                  ),
                  Column(
                    children: [
                    Container(
                      margin: const EdgeInsets.all(5),
                      alignment: Alignment.centerLeft, 
                      child: const Text("Tenant Name",style: TextStyle(fontSize: 18,fontWeight: FontWeight.bold))
                    ),
                    Container(
                      margin: const EdgeInsets.all(5),
                      alignment: Alignment.centerLeft, 
                      child: const Text("Property Location")
                    ),
                  ],
                  )
                ],
            )
          ));
  }
}