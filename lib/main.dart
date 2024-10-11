import 'package:firebase_core/firebase_core.dart';
import 'package:firebase_storage/firebase_storage.dart';
import 'package:flutter/foundation.dart';
import 'package:flutter/material.dart';
import 'package:loader_overlay/loader_overlay.dart';
import 'package:provider/provider.dart';
import 'package:rental/Provider/ApartmentProvider.dart';
import 'package:rental/Provider/PropertyProvider.dart';
import 'package:rental/Provider/SIdeMenuProvider.dart';
import 'package:rental/Provider/UserProvider.dart';
import 'package:rental/const/constants.dart';
import 'package:rental/pages/Agent/AgentProfile.dart';
import 'package:rental/pages/Landlord/AgentListPage.dart';
import 'package:rental/pages/Landlord/LandlordDashboardPage.dart';
import 'package:rental/pages/Landlord/LandlordProfile.dart';
import 'package:rental/pages/PaymentsPage.dart';
import 'package:rental/pages/Property/PropertyDetailPage.dart';
import 'package:rental/pages/Property/PropertyListPage.dart';
import 'package:rental/pages/SettingsPage.dart';
import 'package:rental/pages/LogInPage.dart';
import 'package:rental/pages/Tenant/TenantDashboardPage.dart';
import 'package:rental/pages/Tenant/TenantPayRentPage.dart';
import 'package:rental/pages/Tenant/TenantPaymentsPage.dart';
import 'package:rental/pages/Tenant/TenantProfilePage.dart';
import 'package:rental/pages/TenantsListPage.dart';
import 'package:rental/pages/Agent/AgentDashboardPage.dart';
import 'package:rental/pages/VerifyEmailPage.dart';
import 'package:rental/theme/theme.dart';
import 'package:firebase_ui_auth/firebase_ui_auth.dart';
import 'package:rental/widgets/firebase_signin_widget.dart';
import 'package:rental/pages/TenantsListPage.dart';

Future main() async{  

  try{
    WidgetsFlutterBinding.ensureInitialized();

    if(kIsWeb){
        await Firebase.initializeApp(
          options: const FirebaseOptions(
          apiKey: "AIzaSyA7j-DFRAA6wWCB8gyUt62NdpLwGNU9VQI",
          appId: "1:1095072270738:web:c5e65e40616cae873ad94b", 
          messagingSenderId:  "1095072270738", 
          storageBucket: "rental-8ce87.appspot.com",
          projectId: "rental-8ce87"),
          
        );
    }
  
  if (defaultTargetPlatform != TargetPlatform.windows) {
      // window currently don't support storage emulator
      final emulatorHost =
          (!kIsWeb && defaultTargetPlatform == TargetPlatform.android)
              ? '10.0.2.2'
              : 'localhost';

      await FirebaseStorage.instance.useStorageEmulator(emulatorHost, 9199);
    }

  FirebaseUIAuth.configureProviders([
    EmailAuthProvider()
  ]);
  }catch(e){
    print(e);
  }

  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});
  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return 
    
    MultiProvider(providers: [
      ChangeNotifierProvider(create: (context)=> UserProvider()),
      ChangeNotifierProvider(create: (context) => SideMenuProvider()),
      ChangeNotifierProvider(create: (context)=> PropertyProvider()),
      ChangeNotifierProvider(create: (context)=> ApartmentProvider()),
    ],
    child: MaterialApp(
        routes: {
          '/':(context)=> FirebaseAuthUIExample(),
          '/verify_email':(context)=> VerifyEmailPage(),
          '/log_in':(context)=> LogInPage(),
          '/agent_dashboard':(context)=> AgentDashboard(),
          '/landlord_dashboard':(context)=> LandlordDashboard(),
          '/landlord_profile':(context)=> LandlordProfile(),
          '/tenant_dashboard':(context)=> TenantDashboard(),
          '/agent_profile':(context) => AgentProfile(),
          '/tenant_profile':(context) => TenantProfilePage(),
          '/tenant_list':(context) => TenantListPage(),
          '/agent_list':(context) => AgentListPage(),
          '/tenant_payrent':(context) => TenantPayRentPage(),
          '/property_list':(context) => PropertyListPage(),
          '/tenant_payments':(context) => TenantPaymentsPage(),
          '/property_detail':(context)=> PropertyDetailPage(),
          '/payments':(context) => PaymentsPage(),
          '/settings':(context) => SettingsPage()
        },
        debugShowCheckedModeBanner: false,
        title: 'Rental Management',
        theme: const MaterialTheme(TextTheme()).dark(),
      )
    );
  }
}
