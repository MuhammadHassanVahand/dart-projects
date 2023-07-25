import 'dart:io';
import 'Admin Section.dart';
import 'Employee Section.dart';
import 'String error.dart';

List<Map<String, dynamic>> adminLogin = [
  {"email": "hassan12rehan@gmail.com", "password": "12345"},
  {"email": "muhammadzaeem@gmail.com", "password": "1234"}
];

List<Map<String, dynamic>> employeeLogin = [];
//======================= Login Process ================================

// ======== Admin Login Process=======
adminLoginProcess() {
  int? options;
  print("Login As Admin");

  print("");
  stdout.write("Enter your email: ");
  String email = stdin.readLineSync()!;
  stdout.write("Enter your password: ");
  String password = stdin.readLineSync()!;

  bool logginSuccessful = false;

  for (var i = 0; i < adminLogin.length; i++) {
    if (email == adminLogin[i]["email"] &&
        password == adminLogin[i]["password"]) {
      logginSuccessful = true;
      print("");
      print("Login Successful!");
      print("");

      options = readValidNumberInput("""

      1 for admin;
      0 for exit;
      """);

      if (options == 1) {
        adminBlock();
      } else if (options == 0) {
        break;
      } else {
        print("Invalid Input!");
      }
    }
  }
  if (!logginSuccessful) {
    print("Incorrect Email or password! Try Again");
  }
}

//========== Employee Login Process =======

employeeLoginProcess() {
  int? options;
  if (employeeLogin.isEmpty) {
    print("\nNo employee found!\n");
  } else {
    print("");
    print("Login As Employee");

    print("");
    stdout.write("Enter your email: ");
    String email = stdin.readLineSync()!;
    stdout.write("Enter your password: ");
    String password = stdin.readLineSync()!;

    bool logginSuccessful = false;

    for (var i = 0; i < employeeLogin.length; i++) {
      if (email == employeeLogin[i]["email"] &&
          password == employeeLogin[i]["password"]) {
        logginSuccessful = true;
        print("");
        print("Login Successful!");
        print("");

        options = readValidNumberInput("""
        1 for Employee Section
        0 for exit
        """);

        if (options == 1) {
          employeeAccess();
        } else if (options == 0) {
          break;
        } else {
          print("Invalid Input!");
        }
      }
    }
    if (!logginSuccessful) {
      print("Incorrect Email or password! Try Again");
    }
  }
}
