import 'package:flutter/material.dart';

class AgentCard extends StatelessWidget{
  String userName;
  String? photoUrl; 
  AgentCard({required this.userName, this.photoUrl});
  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: () {
        Navigator.of(context).pushNamed("/agent_profile");
      },
      child: 
         Card(
            child: 
            Column(
                children: [
                  if(photoUrl!=null)
                        Container(
                          height: 200,
                          width: double.infinity,
                          decoration: BoxDecoration(
                            borderRadius: const BorderRadius.only(topLeft:Radius.circular(10),topRight:Radius.circular(10)),
                            image:DecorationImage(
                                image: NetworkImage(photoUrl!),
                                fit: BoxFit.cover
                            ),
                          ),
                        ),
                  Column(
                    children: [
                    Container(
                      margin: const EdgeInsets.all(5),
                      alignment: Alignment.centerLeft, 
                      child:  Text(userName,style: TextStyle(fontSize: 18,fontWeight: FontWeight.bold))
                    ),
                  ],
                  )
                ],
            )
          ));
  }
}