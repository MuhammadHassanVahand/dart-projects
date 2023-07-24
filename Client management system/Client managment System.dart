import 'Login Process.dart';
import 'dart:io';
import 'String error.dart';

List<Map<String, dynamic>> clients = [];
List<Map<String, dynamic>> clientsProjects = [];
List<Map<String, dynamic>> employeesDetails = [];

void main() {
  bool again = true;
  int? option;
  while (again) {
    print(
        "%=================== Welcom 2 Client Management System =====================% \n");
    while (true) {
      print("");
      print("1 for admin login");
      print("2 for employee login");
      print("0 for exit \n");

      String? input = stdin.readLineSync();
      if (input == null || input.isEmpty) {
        print("Invalid Input");
        continue;
      }
      if (!RegExp(r'^\d+$').hasMatch(input)) {
        print("\nString not allowed! Enter number only");
        continue;
      } else {
        option = int.parse(input);
        break;
      }
    }

    if (option == 1) {
      print("");
      adminLoginProcess();
    } else if (option == 2) {
      employeeLoginProcess();
    } else if (option == 0) {
      again = false;
      break;
    } else {
      print("Invalid Input");
    }
  }
}
