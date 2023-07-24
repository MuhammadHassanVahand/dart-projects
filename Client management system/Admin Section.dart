import 'dart:io';
import 'Client Section.dart';
import 'Employee Section.dart';

// ============================ Admin Section ===============================
adminBlock() {
  int option;
  while (true) {
    print("");
    print(" !=============== Admin Block =================! \n");
    while (true) {
      print("For emplyee Section press 1 \n");
      print("For client Section press: 2 \n");
      print("For exit press: 0");
      String? input = stdin.readLineSync();

      if (input == null || input.isEmpty) {
        print("Invalid Input!");
        continue;
      }
      if (!RegExp(r'^\d+$').hasMatch(input)) {
        print("\nString input Not allowed! Use only numbers.");
        continue;
      } else {
        option = int.parse(input);
        break;
      }
    }

    if (option == 1) {
      employeeSection();
    } else if (option == 2) {
      clientSection();
    } else if (option == 0) {
      false;
      break;
    } else {
      print("");
      print("Invalid Input");
    }
  }
}
