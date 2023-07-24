import 'dart:io';

int readValidNumberInput(String type) {
  while (true) {
    print("");
    stdout.write("$type");
    String? input = stdin.readLineSync();

    if (input == null || input.isEmpty) {
      print("Invalid Input!");
      continue;
    }

    if (!RegExp(r'^\d+$').hasMatch(input)) {
      print("String input not allowed! Please use only numbers.");
      continue;
    }

    return int.parse(input);
  }
}
