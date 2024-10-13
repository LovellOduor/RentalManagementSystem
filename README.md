# RENTAL MANAGEMENT SYSTEM DOCUMENTATION

## SYSTEM ARCHITECTURE

The System is designed with a three-tier architecture 
**Client -> Server -> Database**

### Programming Languages
Frontend - Flutter (Dart) - Code is in the root of this repoository.
Backend - JavaScript (NodeJS) - Code is located in the rental_backend folder of this repository.
Database - MySQL - The exported SQL file (rental.sql) is located in the database folder inside of the rental_backend folder **/rental_backend/database/rental.sql**

## FRONTEND

The frontend utilizes the **MVVM design pattern**
**Models** - Data models are located in the root of the lib folder in the **lib/models** folder.
**Views** (Form the UI components / pages) - These are located in the pages folder **lib/pages**.
The views are organized based on the type of users (Landlord/Agent/Tenant) who needs access to that particular view.
**ViewModels** - State Management is facilitated by the Flutter [Provider package](https://pub.dev/packages/provider). 
The View Models/Providers are located in the Provider folder **lib/Provider/** folder.
They are named and organized according to the functionality or user type they interact with. 

### Other files
**UI Components** - UI components/widgets are located in the widgets folder **lib/widgets/**.
Widgets specific to a particular user type are located in a folder named by that particular user type for example:
**Agent** - <em>lib/widgets/Agent</em>.
Other widgets shared across pages and users are simply located in the root of the widgets folder. **lib/widgets/**.

## IMPLEMENTED PAGES AND TASKS REMAINING

### Sign In Page
![Sign In Page](/gitfiles/images/Sign%20In%20Page.png)
location: **lib/widgets/firebase_sigin_widget.dart**
**Signin is managed by firebase. The dashboard access will be provided**

## Registration Page
![Registration Page](/gitfiles/images/Registration%20Page.png)
location: **lib/widgets/firebase_sigin_widget.dart**
- The registration page is also generated and managed by the firebase UI. 

## Email Confirmation Page
![Email Confirmation Page](/gitfiles/images/Email%20Verification%20Page.png)
- Once the user clicks the confirmation link in their email, then click on the
confirm email verificationn button, they are redirected to the Acccount type selection page.

## Account Type Selection Page
![Account Type Selection Page](/gitfiles/images/Account%20Type%20Selection%20Page.png)
- This shows only upon first time registration and also before the user completes registration as  particular user type. It says log in as but should probably be renamed to register as.

## Landlord Dashboard Page
![Landlord Dashboard Page](/gitfiles/images/Landlord%20Dashboard.png)
- This page is divided into 3 components which ideally are currently responsive.
The Side Menu, Dashboard and Detail View on the far right wihc just displays details of the current signed in user. This page is simmilar for all other user types. 
- It's primary purpose is to dispaly a summary of stats relevant to the current user such as payment trends.


