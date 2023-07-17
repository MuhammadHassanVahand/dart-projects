import 'dart:io';

List<Map<String, dynamic>> adminList = [];
List<Map<String, dynamic>> clients = [];
// ===========Admin Section===========
adminBlock() {
  print("");
  int option;
  while (true) {
    print("For add client press 1");
    print("For display client press 2");
    print("For remove client press 3");
    print("For exit press 0");
    option = int.parse(stdin.readLineSync()!);
    if (option == 1) {
      addClient();
    } else if (option == 2) {
      displayClient();
    } else if (option == 3) {
      removeClient();
    } else if (option == 0) {
      false;
      break;
    }
  }
  print("");
}

addClient() {
  stdout.write("Enter client id! should be unique in numbers: ");
  String cId = stdin.readLineSync()!;

  stdout.write("Enter client name: ");
  String cName = stdin.readLineSync()!;

  stdout.write("Enter client email: ");
  String cEmail = stdin.readLineSync()!;

  stdout.write("Enter client phone number: ");
  int cNumber = int.parse(stdin.readLineSync()!);

  Map<String, dynamic> client = {
    "id": cId,
    "name": cName,
    "email": cEmail,
    "number": cNumber
  };

  clients.add(client);
  print("Client added Successfully");
  print("");
}

displayClient() {
  print("");
  if (clients.isEmpty) {
    print("No client found");
  } else {
    for (var i = 0; i < clients.length; i++) {
      print("Client id: ${clients[i]["id"]}");
      print("Client name: ${clients[i]["name"]}");
      print("Client email: ${clients[i]["email"]}");
      print("Client number: ${clients[i]["number"]}");
      print("");
    }
  }
}

removeClient() {
  stdout.write("Enter client id, Who you want to remove: ");
  String id = stdin.readLineSync()!;
  for (var i = 0; i < clients.length; i++) {
    if (id == clients[i]["id"]) {
      clients.removeWhere((value) => value["id"] == id);
    }
  }

  print("Client remove successfully");
  print("");
}

void main() {
  int options;
  bool again = true;
  while (again) {
    print("1 for admin");
    print("2 for client");
    print("0 for exit");
    options = int.parse(stdin.readLineSync()!);
    if (options == 1) {
      adminBlock();
    } else if (options == 0) {
      again = false;
      break;
    }
  }
}
