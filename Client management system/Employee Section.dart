import 'dart:io';
import "Client managment System.dart";
import 'Client Section.dart';
import 'Login Process.dart';
import 'String error.dart';

//====================== Employee Section ===================================

employeeSection() {
  int option;
  while (true) {
    print("");
    print(" !=============== Employee Section =================!");

    option = readValidNumberInput("""
For add emplyee press 1 
For display Employee press: 2 
For remove Employee press: 3 
For update Employee press: 4 
For display Employee's Loggin Details press: 5 
For exit press: 0 
""");

    if (option == 1) {
      addEmployee();
    } else if (option == 2) {
      displayEmployee();
    } else if (option == 3) {
      removeEmployee();
    } else if (option == 4) {
      updateEmployee();
    } else if (option == 5) {
      displayEmployeeLogin();
    } else if (option == 0) {
      false;
      break;
    } else {
      print("");
      print("Invalid Input");
    }
  }
}

//=========== Add Employee ========
addEmployee() {
  print("");
  print("%============ Add Employee=======% \n");

  int? eId;
  int? ePhoneNumber;
  bool isUnique = false;
  while (!isUnique) {
    eId = readValidNumberInput(
        "Enter Employee id! Should be unique , in number: ");

    isUnique = true;

    for (var i = 0; i < employeesDetails.length; i++) {
      if (eId == employeesDetails[i]["id"]) {
        print("$eId is already exist! try another one");
        isUnique = false;
        break;
      }
    }
  }

  stdout.write("Enter Employee name: ");
  String eName = stdin.readLineSync()!;

  ePhoneNumber = readValidNumberInput("Enter Employee number: ");

  stdout.write("Enter Employee email: ");
  String eEmail = stdin.readLineSync()!;

  stdout.write("Enter employee password: ");
  String ePassword = stdin.readLineSync()!;

  Map<String, dynamic> empDetail = {
    "id": eId,
    "name": eName,
    "phone": ePhoneNumber,
    "email": eEmail
  };

  Map<String, dynamic> empLogin = {
    "id": eId,
    "email": eEmail,
    "password": ePassword
  };

  employeesDetails.add(empDetail);
  employeeLogin.add(empLogin);
  print("");
  print("Employee Added Successfully");
}

//======= display Employee =========
displayEmployee() {
  print("");
  print("   !========= Displaying Employee/s ==========!");
  int? option;
  while (true) {
    if (employeesDetails.isEmpty) {
      print("No Employee found");
      break;
    }
    print("");

    option = readValidNumberInput("""
Display only one Employee press: 1
Display all Employee press: 2
For exit press: 0
""");

    if (option == 1) {
      print("");
      int? id;

      id = readValidNumberInput("Enter client id: ");

      bool idExist = employeesDetails.any((employee) => employee["id"] == id);
      print("");
      if (idExist) {
        final employeeDetail =
            employeesDetails.firstWhere((employee) => employee["id"] == id);
        print("");
        print("Employee id: ${employeeDetail["id"]}");
        print("Employee name: ${employeeDetail["name"]}");
        print("Employee email: ${employeeDetail["email"]}");
        print("Employee number: ${employeeDetail["phone"]}");
        break;
      } else {
        print("Invalid id or this $id id does not exist ");
      }
    } else if (option == 2) {
      employeesDetails.forEach(
        (employee) {
          print("Employee id: ${employee["id"]}");
          print("Employee name: ${employee["name"]}");
          print("Employee email: ${employee["email"]}");
          print("Employee number: ${employee["phone"]}");
          print("");
        },
      );
    } else if (option == 0) {
      print("Exiting....");
      break;
    } else {
      print("Invalid input");
    }
  }
}

//=========remove Employee===========

removeEmployee() {
  int? option;
  print("");
  print("  !========== Removing Employee ==========!");
  print("");
  if (employeesDetails.isEmpty) {
    print("No Emloyee found to remove");
  } else {
    print("Remove all or only 1 ?");
    print("");

    option = readValidNumberInput("1 for Remove all or 2 for only one: ");

    if (option == 1) {
      employeesDetails.clear();
      employeeLogin.clear();
      print("All employee remove successfully");
    } else {
      int? id;

      id = readValidNumberInput("Enter employee id, Who you want to remove: ");

      bool idExist = employeesDetails.any((employee) => employee["id"] == id);

      if (idExist) {
        employeesDetails.removeWhere((value) => value["id"] == id);

        employeeLogin.removeWhere((value) => value["id"] == id);

        print("");
        print("Employee and Employee's loggin details remove successfully");
      }

      if (!idExist) {
        print("");
        print("$id: id Does not exist!");
      }
    }
  }
}

//========update Employee=========

updateEmployee() {
  int? id;
  int? number;
  print("");
  print("   !========= Updatinging Employee ==========!");
  print("Displaying data before update!");
  displayEmployee();
  while (true) {
    if (employeesDetails.isEmpty) {
      print("Can't update empty list");
      break;
    } else {
      print("");
      print("Do you want to update Employee ? (yes/no)");
      String option = stdin.readLineSync()!;
      if (option == "yes" || option == "Yes") {
        int? options;

        print("Edit Email , phone or Password");

        options = readValidNumberInput("""
For email: 1
For number: 2
For password: 3 
""");

        if (options == 1) {
          print("/Editing Email/");

          id = readValidNumberInput("Enter Employee id: ");

          bool idExist =
              employeesDetails.any((employee) => employee['id'] == id);
          if (idExist) {
            stdout.write("Enter New email: ");
            String email = stdin.readLineSync()!;
            final employee =
                employeesDetails.firstWhere((employee) => employee['id'] == id);
            employee["email"] = email;
            print("Email updated Successfully!");
            break;
          } else {
            print("$id does not exist");
            break;
          }
        } else if (options == 2) {
          print("/Editing Number/");
          print("");

          id = readValidNumberInput("Enter Employee id: ");

          bool idExist =
              employeesDetails.any((employee) => employee['id'] == id);

          if (idExist) {
            number = readValidNumberInput("Enter New number: ");

            final employee =
                employeesDetails.firstWhere((employee) => employee["id"] == id);
            employee["phone"] = number;
            print("Number updated Successfully!");
            break;
          } else {
            print("$id does not exist");
            break;
          }
        } else if (options == 3) {
          print("/Changing password/");
          print("");

          id = readValidNumberInput("Enter Employee id: ");

          bool idExist = employeeLogin.any((employee) => employee['id'] == id);

          if (idExist) {
            stdout.write("Enter New password: ");
            String password = stdin.readLineSync()!;
            final employeelogin =
                employeeLogin.firstWhere((employee) => employee["id"] == id);
            employeelogin["password"] = password;
            print("password updated Successfully!");
            break;
          } else {
            print("$id does not exist");
            break;
          }
        } else {
          print("Invalid input");
        }
      } else if (option == "No" || option == "no") {
        break;
      } else {
        print("\nInvalid Input\n");
      }
    }
  }
}

//========display Employee Login=========

displayEmployeeLogin() {
  print("");
  int? option;
  int? id;
  print("   !========= Displaying Employee Login ==========!");
  while (true) {
    if (employeeLogin.isEmpty) {
      print("No Employee found");
      break;
    }
    print("");

    option = readValidNumberInput("""
Display only one Employee Login Details press: 1
Display all Employee Login Details press: 2
for exit press: 0
""");

    if (option == 1) {
      print("");
      id = readValidNumberInput("Enter Employee id: ");

      bool idExist = employeeLogin.any((employee) => employee["id"] == id);
      print("");
      if (idExist) {
        final employee =
            employeeLogin.firstWhere((employee) => employee["id"] == id);
        print("Enmployee id: ${employee["id"]}");
        print("Enmployee email: ${employee["email"]}");
        print("Enmployee password: ${employee["password"]}");
        break;
      } else {
        print("Invalid id or this id does not exist ");
      }
    } else if (option == 2) {
      print("");
      employeeLogin.forEach((employee) {
        print("Enmployee id: ${employee["id"]}");
        print("Enmployee email: ${employee["email"]}");
        print("Enmployee password: ${employee["password"]}");
        print("");
      });
      break;
    } else if (option == 0) {
      false;
      break;
    } else {
      print("Invalid input");
    }
  }
}

//===================== For Employee ========================

employeeAccess() {
  int? option;
  print("============== Employee Access ============= \n");
  while (true) {
    option = readValidNumberInput("""
1 for client data"
2 for client's project"
0 for Exit"
""");

    if (option == 1) {
      displayClient();
    } else if (option == 2) {
      displayClientProject();
    } else if (option == 0) {
      print("Exiting....");
      break;
    } else {
      print("Invalid option");
    }
  }
}
