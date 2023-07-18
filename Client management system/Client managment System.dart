import 'dart:io';

List<Map<String, dynamic>> adminLogin = [
  {"email": "hassan12rehan@gmail.com", "password": "1234"},
  {"email": "muhammadzaeem@gmail.com", "password": "1234"}
];
List<Map<String, dynamic>> clients = [];
// ===========Admin Section===========
adminBlock() {
  int option;
  while (true) {
    print("");
    print(" !=============== Admin Block =================!");
    print("For add client press: 1");
    print("For display client press: 2");
    print("For remove client press: 3");
    print("For update Client press: 4");
    print("For exit press: 0");
    option = int.parse(stdin.readLineSync()!);
    if (option == 1) {
      addClient();
    } else if (option == 2) {
      displayClient();
    } else if (option == 3) {
      removeClient();
    } else if (option == 4) {
      updateClient();
    } else if (option == 0) {
      false;
      break;
    }
  }
  print("");
}

addClient() {
  print("");
  print("   !========= Adding Client ==========!");
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
  while (true) {
    print("");
    print("   !========= Displaying Client/s ==========!");
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
    print("0 for Exit");
    int exit = int.parse(stdin.readLineSync()!);
    if (exit == 0) {
      false;
      break;
    }
  }
}

removeClient() {
  print("");
  print("  !========== Removing Client ==========!");
  if (clients.isEmpty) {
    print("No Client found to remove");
  } else {
    stdout.write("Enter client id, Who you want to remove: ");
    String id = stdin.readLineSync()!;
    for (var i = 0; i < clients.length; i++) {
      if (id == clients[i]["id"]) {
        clients.removeWhere((value) => value["id"] == id);
        print("Client remove successfully");
      } else {
        print("$id: id Does not exist!");
      }
    }
  }
}

updateClient() {
  print("");
  print("   !========= Updatinging Client ==========!");
  print("Displaying data before update!");
  displayClient();
  if (clients.isEmpty) {
    print("Can't update empty list");
  } else {
    print("Do you want to update client ? (yes/no)");
    String option = stdin.readLineSync()!;
    if (option == "yes" || option == "Yes") {
      print("Edit Email or phone");
      print("For email: 1");
      print("For number: 2");
      int options = int.parse(stdin.readLineSync()!);
      if (options == 1) {
        print("Editing Email");
        stdout.write("Enter Client id: ");
        String id = stdin.readLineSync()!;
        for (var i = 0; i < clients.length; i++) {
          if (id != clients[i]["id"]) {
            print("$id does not exist");
          } else if (id == clients[i]["id"]) {
            stdout.write("Enter New email: ");
            String email = stdin.readLineSync()!;
            clients[i]["email"] = email;
            print("Email updated Successfully!");
          }
        }
      } else if (options == 2) {
        print("Editing Number");
        stdout.write("Enter Client id: ");
        String id = stdin.readLineSync()!;
        for (var i = 0; i < clients.length; i++) {
          if (id != clients[i]["id"]) {
            print("$id does not exist");
          } else if (id == clients[i]["id"]) {
            stdout.write("Enter New number: ");
            String number = stdin.readLineSync()!;
            clients[i]["number"] = number;
            print("Number updated Successfully!");
          }
        }
      } else {
        print("Invalid input");
      }
    }
  }
}

void main() {
  int options;
  bool again = true;
  while (again) {
    print(
        "%=================== Welcom 2 Client Management System =====================%");
    print("1 for admin login");
    print("0 for exit");
    int option = int.parse(stdin.readLineSync()!);
    if (option == 1) {
      print("Login As Admin");

      print("");
      stdout.write("Enter your email: ");
      String email = stdin.readLineSync()!;
      stdout.write("Enter your password: ");
      String password = stdin.readLineSync()!;
      for (var i = 0; i < adminLogin.length; i++) {
        if (email == adminLogin[i]["email"] &&
            password == adminLogin[i]["password"]) {
          print("Login Successful!");
          print("1 for admin");
          print("0 for exit");
          options = int.parse(stdin.readLineSync()!);
          if (options == 1) {
            adminBlock();
          } else if (options == 0) {
            break;
          }
        } else {
          print("Incorrect Email or password! Try Again");
          break;
        }
      }
    } else if (option == 0) {
      again = false;
      break;
    }
  }
}
