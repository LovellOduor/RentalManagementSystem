import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:rental/Provider/UserProvider.dart';
import 'package:rental/models/RentalUser.dart';
import 'package:rental/util/responsive.dart';

class ProfileSummaryWidget extends StatelessWidget{
  @override
  Widget build(BuildContext context) {
    RentalUser? currentUser = context.read<UserProvider>().user;
    return (!Responsive.isMobile(context))?
            Container(
              width: double.infinity,
              child:SingleChildScrollView(child:
            Column(
              mainAxisAlignment: MainAxisAlignment.start ,
              crossAxisAlignment: CrossAxisAlignment.center,
            children: [
              SizedBox(height: 20),
              // Profile Picture
              Container(
                margin: EdgeInsets.all(20),
                child: ClipRRect(
                borderRadius: BorderRadius.circular(50),
                      child:
                  Container(
                    width: 100,
                      height: 100,
                      decoration: const BoxDecoration(
                        color: Colors.grey,
                      ),
                      child:currentUser==null || currentUser.photoUrl == null || currentUser.photoUrl!.isEmpty ? const Icon(Icons.person,size:100): Image.network(currentUser!.photoUrl!,height: 200,width: 200,) ,
                  )),
              ),
              Container(
                  margin: const EdgeInsets.all(20),
                  child: Text(currentUser!=null?currentUser.type:""),
              ),
              // Username textfield
              Container(
                  margin: EdgeInsets.all(20),
                  child: Text(currentUser!=null?currentUser.userName:""),
              ),
              // Email textfield
              Container(
                  margin: EdgeInsets.all(20),
                  child: Text(currentUser!=null?currentUser.email:""),
              ),
            ]
            )
            )
            ):SizedBox();

  }
}