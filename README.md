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
**Pending**
- Fetching payment data from the backend and displaying it in the graphs, currently only placeholder data is displayed. 

## Landlord Profile Page
![Landlord Profile Page](/gitfiles/images/Landlord%20Profle.png)
- Captures and displays basic details of the landlord profile.

## Payments Page Up
![Payments Page](/gitfiles/images/Payments%20Page%201.png)
- This page should be common to all user types but only display payments relevant to that particular user.
For example: Landlord and Agent may be interested in payments made by all the users, where as Tenant may only be interested in the payments they made. 
**Pending**
- Fetch transaction data and implement filtering of said data.

## Payments Page Down
![Payments Page](/gitfiles/images/Payments%20Page%202.png)
- This is just a scroll down on the payments page.
- Transactions should be listed here and paginated.

## Agent List Page
![Agent List Page](/gitfiles/images/Agent%20List%20Page.png)
- Fetches and displays all agents registered under a paricular landlord.
**Pending**
- Filter based on search and paginate those agents.

## Property List Page
![Property List Page](/gitfiles/images/Property%20List%20Page.png)
- Displays a list of all propertiess of a particular landlord.
**Pending**
- Filter based on search and paginate the properties.

## Property Detail Page
![Property Detail Page](/gitfiles/images/Property%20Detail%20Page.png)
- Enables editting and display of property details. 
- Currently uploads property data but not apartment details. 

## Tenant List Page
![Tenant List Page](/gitfiles/images/Tenant%20List%20Page.png)
- Fetches and displays a list of tenants.
**Pending**
- Currently has only placeholder data. 
- Fetch tenants.
- Filter tenants based on place holder data. 

## Agent Profile Creation
![Agent Profile Creation](/gitfiles/images/Agent%20Profile%20Creation%201.png)
- Creation and editing of agent profile info. It is accessible from the profile tab when logged in as an agent.
- The agent is linked to the landlord via a landlord ID text field input. This shoulld probbly be replaced with a landlord tag (Something easily comprehendable by humans and not expose the actual database landlord ID).

# Tenant Pages
- The Tenant pages recycle widgets from both agent and landlord user types.
**Pending**
- CRUD Tenant information.
