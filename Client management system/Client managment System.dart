import 'Login Process.dart';
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

    print("");

    option = readValidNumberInput("""

      1 for admin login
      2 for employee login
      0 for exit \n
      """);

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
