import 'dart:io';

int readValidNumberInput(String type) {
  while (true) {
    stdout.write("$type");
    String? input = stdin.readLineSync();

    if (input == null || input.isEmpty) {
      print("Invalid Input!");
      continue;
    }

    if (!RegExp(r'^\d+$').hasMatch(input)) {
      print("\nString input not allowed! Please use only numbers.\n");
      continue;
    }

    return int.parse(input);
  }
}
