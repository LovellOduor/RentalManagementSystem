import 'dart:convert';

import 'package:firebase_auth/firebase_auth.dart'
    hide PhoneAuthProvider, EmailAuthProvider;
import 'package:firebase_ui_auth/firebase_ui_auth.dart';
import 'package:firebase_ui_localizations/firebase_ui_localizations.dart';

import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:rental/Provider/UserProvider.dart';
import 'package:rental/const/constants.dart';
import 'package:rental/models/RentalUser.dart';


final actionCodeSettings = ActionCodeSettings(
  url: 'https://flutterfire-e2e-tests.firebaseapp.com',
  handleCodeInApp: true,
  androidMinimumVersion: '1',
  androidPackageName: 'io.flutter.plugins.firebase_ui.firebase_ui_example',
  iOSBundleId: 'io.flutter.plugins.fireabaseUiExample',
);

final emailLinkProviderConfig = EmailLinkAuthProvider(
  actionCodeSettings: actionCodeSettings,
);

class LabelOverrides extends DefaultLocalizations {
  const LabelOverrides();

  @override
  String get emailInputLabel => 'Enter your email';
}

class FirebaseAuthUIExample extends StatelessWidget {
  const FirebaseAuthUIExample({super.key});

  String get initialRoute {
    final user = FirebaseAuth.instance.currentUser;

    return switch (user) {
      null => '/',
      User(emailVerified: false, email: final String _) => '/verify_email',
      _ => '/profile',
    };
  
  }

  
  Future<void> getUser(BuildContext context) async{

      var res = await context.read<UserProvider>().userExists();
      /*
        Successful response format
        {"result":"success","data":[{"ID":"M12","type":"landlord","createdDate":"2024-07-12T10:03:40.000Z"}]}
      */
      Map response =  jsonDecode(res.body) as Map;

      if(response["result"] == "success"){
        final dataList = response["data"] as List;
        if (dataList.isNotEmpty){
            var userDetails = dataList[0] as Map;
            context.read<UserProvider>().type = userDetails["type"];
            
            var resp = await context.read<UserProvider>().getCurrentUser();
            var data =  jsonDecode(resp.body) as Map;
            print("getting user");

            if(data["result"]=="success"){
              var userList = data["data"] as List;
              if(userList.isNotEmpty){
                var userData = userList[0] as Map;
                print(userDetails);
                if (userDetails["type"]== UserType.landlord){
                    context.read<UserProvider>().user = Landlord(
                    ID:userData["ID"],
                    userName: userData["userName"],
                    email:userData["email"],
                    contact: userData["contact"], 
                    photoUrl: userData["photoUrl"]);
                    Navigator.pushNamed(context,'/landlord_dashboard');
                    return;
                }else if(userDetails["type"]== UserType.agent){
                    context.read<UserProvider>().user = Agent(
                    ID:userData["ID"],
                    IDNumber: userData["IDNumber"],
                    landlordID: userData["landlordID"],
                    userName: userData["userName"],
                    email:userData["email"],
                    earningRate: userData["earningRate"],
                    contact: userData["contact"], 
                    photoUrl: userData["photoUrl"]);
                    Navigator.pushNamed(context,'/agent_dashboard');
                }else if(userDetails["type"]== UserType.tenant){
                  context.read<UserProvider>().user = Tenant(
                    ID:userData["ID"],
                    IDNumber: userData["IDNumber"],
                    landlordID: userData["landlordID"],
                    userName: userData["userName"],
                    email:userData["email"],
                    propertyID:userData["propertyID"],
                    apartmentName:userData["apartmentName"],
                    contact: userData["contact"], 
                    photoUrl: userData["photoUrl"]);
                    Navigator.pushNamed(context,'/tenant_dashboard');
                }
              }
            }
        }else{
            Navigator.pushNamed(context,'/log_in');
        }
      }
  }

  @override
  Widget build(BuildContext context) {
   
    final mfaAction = AuthStateChangeAction<MFARequired>(
      (context, state) async {
        final nav = Navigator.of(context);

        await startMFAVerification(
          resolver: state.resolver,
          context: context,
        );

        nav.pushReplacementNamed('/profile');
      },
    );

    return SignInScreen(
            actions: [
              ForgotPasswordAction((context, email) {
                Navigator.pushNamed(
                  context,
                  '/forgot-password',
                  arguments: {'email': email},
                );
              }),
              VerifyPhoneAction((context, _) {
                Navigator.pushNamed(context, '/phone');
              }),

              AuthStateChangeAction((context, state) async{

                final user = switch (state) {
                  SignedIn(user: final user) => user,
                  CredentialLinked(user: final user) => user,
                  UserCreated(credential: final cred) => cred.user,
                  _ => null,
                };

                context.read<UserProvider>().ID = user?.uid??"";

                switch (user) {

                  case User(emailVerified: true):
                  
                    print("Signed in user is verified");

                    await getUser(context);

                  case User(emailVerified: false, email: final String _):
                    print("Verification email sent");
                    FirebaseAuth.instance.currentUser?.sendEmailVerification();
                    Navigator.pushNamed(context, '/verify_email');
                }

              }),
              mfaAction,
              EmailLinkSignInAction((context) {
                Navigator.pushReplacementNamed(context, '/email-link-sign-in');
              }),
            ],
            styles: const {
              EmailFormStyle(signInButtonVariant: ButtonVariant.filled),
            },
            subtitleBuilder: (context, action) {
              final actionText = switch (action) {
                AuthAction.signIn => 'Please sign in to continue.',
                AuthAction.signUp => 'Please create an account to continue',
                _ => throw Exception('Invalid action: $action'),
              };
              return Padding(
                padding: const EdgeInsets.only(bottom: 8),
                child: Text('Welcome to Firebase UI! $actionText.'),
              );
            },

            footerBuilder: (context, action) {
              final actionText = switch (action) {
                AuthAction.signIn => 'signing in',
                AuthAction.signUp => 'registering',
                _ => throw Exception('Invalid action: $action'),
              };

              return Center(
                child: Padding(
                  padding: const EdgeInsets.only(top: 16),
                  child: Text(
                    'By $actionText, you agree to our terms and conditions.',
                    style: const TextStyle(color: Colors.grey),
                  ),
                ),
              );
            },
          );
        }
      }