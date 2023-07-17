import 'dart:io';
import 'dart:math';

List<Map<String, dynamic>> adminList = [];
List<Map<String, dynamic>> clients = [];
// ===========Admin Section===========
adminBlock() {
  print("For add client press 1");
  int option = int.parse(stdin.readLineSync()!);
  if (option == 1) {
    addClient();
  }
}

addClient() {
  stdout.write("Enter client name: ");
  String cName = stdin.readLineSync()!;

  stdout.write("Enter client email: ");
  String cEmail = stdin.readLineSync()!;

  stdout.write("Enter client phone number: ");
  int cNumber = int.parse(stdin.readLineSync()!);

  Map<String, dynamic> client = {
    "name": cName,
    "email": cEmail,
    "number": cNumber
  };

  clients.add(client);
  print("Client added Successfully");
}

displayClient() {
  if (clients.isEmpty) {
    print("No client found");
  } else {
    for (var i = 0; i < clients.length; i++) {
      print("Client name: ${clients[i]["name"]}");
      print("Client email: ${clients[i]["email"]}");
      print("Client number: ${clients[i]["number"]}");
    }
  }
}

void main() {
  print("1 for admin");
  print("2 for display client");
  int options = int.parse(stdin.readLineSync()!);
  if (options == 1) {
    adminBlock();
  } else if (options == 2) {
    displayClient();
  }
}
