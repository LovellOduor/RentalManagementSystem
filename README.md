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

