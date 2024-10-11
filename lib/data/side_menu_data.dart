
import 'package:flutter/material.dart';
import 'package:rental/const/constants.dart';
import 'package:rental/models/menu_model.dart';

class SideMenuData{
  String userType;

  SideMenuData({required this.userType});
  get menu{
    if (userType == UserType.tenant){
      return tenantMenu;
    }else if(userType == UserType.landlord){
      return landlordMenu;
    }
    return agentMenu;
  }

  final agentMenu = const <MenuModel>[
    MenuModel(icon: Icons.home, title: "Dashboard",path:"/agent_dashboard"),
    MenuModel(icon: Icons.person , title: "Profile",path:"/agent_profile"),
    MenuModel(icon: Icons.money, title: "Payments",path:"/payments"),
    MenuModel(icon: Icons.people, title: "Tenants",path:"/tenant_list"),
    MenuModel(icon: Icons.store , title: "Properties",path:"/property_list"),
    MenuModel(icon: Icons.settings , title: "Settings",path:"/settings"),
    MenuModel(icon: Icons.exit_to_app, title: "Log Out",path:"/"),
  ];

  final landlordMenu = const <MenuModel>[
    MenuModel(icon: Icons.home, title: "Dashboard",path:"/landlord_dashboard"),
    MenuModel(icon: Icons.person , title: "Profile",path:"/landlord_profile"),
    MenuModel(icon: Icons.money, title: "Payments",path:"/payments"),
    MenuModel(icon: Icons.people, title: "Agents",path:"/agent_list"),
    MenuModel(icon: Icons.people, title: "Tenants",path:"/tenant_list"),
    MenuModel(icon: Icons.store , title: "Properties",path:"/property_list"),
    MenuModel(icon: Icons.settings , title: "Settings",path:"/settings"),
    MenuModel(icon: Icons.exit_to_app, title: "Log Out",path:"/"),
  ];

  final tenantMenu = const <MenuModel>[
    MenuModel(icon: Icons.home, title: "Dashboard",path:"/tenant_dashboard"),
    MenuModel(icon: Icons.person , title: "Profile",path:"/tenant_profile"),
    MenuModel(icon: Icons.paid , title: "Pay",path:"/tenant_payrent"),
    MenuModel(icon: Icons.payments, title: "Payments",path:"/tenant_payments"),
    MenuModel(icon: Icons.exit_to_app, title: "Log Out",path:"/"),
  ];

}