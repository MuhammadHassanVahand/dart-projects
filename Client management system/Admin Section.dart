import 'Client Section.dart';
import 'Employee Section.dart';
import 'String error.dart';

// ============================ Admin Section ===============================
adminBlock() {
  int option;
  while (true) {
    print("");
    print(" !=============== Admin Block =================! \n");

    option = readValidNumberInput("""
For emplyee Section press 1 
For client Section press: 2 
For exit press: 0
""");

    if (option == 1) {
      employeeSection();
    } else if (option == 2) {
      clientSection();
    } else if (option == 0) {
      break;
    } else {
      print("");
      print("Invalid Input");
      continue;
    }
  }
}
