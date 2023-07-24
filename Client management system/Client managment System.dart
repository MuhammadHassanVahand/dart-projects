import 'Login Process.dart';
import 'dart:io';

List<Map<String, dynamic>> clients = [];
List<Map<String, dynamic>> clientsProjects = [];
List<Map<String, dynamic>> employeesDetails = [];

void main() {
  bool again = true;
  while (again) {
    print(
        "%=================== Welcom 2 Client Management System =====================% \n");
    print("");
    print("1 for admin login");
    print("2 for employee login");
    print("0 for exit \n");
    int option = int.parse(stdin.readLineSync()!);
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
