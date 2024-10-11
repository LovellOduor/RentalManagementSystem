import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:rental/Provider/UserProvider.dart';
import 'package:rental/const/constants.dart';

class LogInPage extends StatefulWidget{
  @override
  State<StatefulWidget> createState() {
    return LogInPageState();
  }
}

class LogInPageState extends State<LogInPage>{

  @override
  void initState (){
    super.initState();
  }

  @override
  Widget build(BuildContext context){
/*
    if(context.read<UserProvider>().user != null){
          switch (context.read<UserProvider>().user!.type){
            case  UserType.landlord:
                Navigator.of(context).pushNamed("/landlord_dashboard");
            case UserType.agent:
                Navigator.of(context).pushNamed("/agent_dashboard");
            case UserType.tenant:
                Navigator.of(context).pushNamed("/tenant_dashboard");
        }
    }
    */
    
    return Scaffold(
      body: SafeArea(
        child:
         Container(
          alignment: Alignment.center,
          width: double.infinity,
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
            const SizedBox(height: 10,),
            SizedBox(
              width: 200,
              child: TextButton(
                      onPressed: (){
                        Navigator.of(context).popAndPushNamed("/landlord_dashboard");
                      },
                      style: const  ButtonStyle(backgroundColor: MaterialStatePropertyAll<Color>(Colors.blueAccent),),
                      child: const Text("Log in as Landlord",style:
                    TextStyle(
                          fontSize: 15,
                          color: Colors.white
                      ),
                      )
                  )
            ),
            const SizedBox(height: 10,),
            SizedBox(
              width: 200,
              child: TextButton(
                      onPressed: (){
                        Navigator.of(context).popAndPushNamed("/agent_dashboard");
                      },
                      style: const ButtonStyle(backgroundColor: MaterialStatePropertyAll<Color>(Colors.blueAccent)),
                      child: const Text("Log in as Agent",style: TextStyle( fontSize: 15, color: Colors.white))
                  )
            ),
            const SizedBox(height: 10,),
            SizedBox(
              width: 200,
              child: TextButton(
                      onPressed: (){
                        Navigator.of(context).popAndPushNamed("/tenant_dashboard");
                      },
                      style: const  ButtonStyle(backgroundColor: MaterialStatePropertyAll<Color>(Colors.blueAccent),),
                      child: const Text("Log in as Tenant",style: TextStyle( fontSize: 15, color: Colors.white ))
                  )
            )
          ],)
        )
       )
      );
  }                  
}