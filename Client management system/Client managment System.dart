import 'dart:io';

List<Map<String, dynamic>> adminLogin = [
  {"email": "hassan12rehan@gmail.com", "password": "12345"},
  {"email": "muhammadzaeem@gmail.com", "password": "1234"}
];
List<Map<String, dynamic>> clients = [];
List<Map<String, dynamic>> clientsProjects = [];

// =========== Admin Section ===========
adminBlock() {
  int option;
  while (true) {
    print("");
    print(" !=============== Admin Block =================!");
    print("For add client press: 1");
    print("For display client press: 2");
    print("For remove client press: 3");
    print("For update Client press: 4");
    print("For display Client's project press: 5");
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
    } else if (option == 5) {
      displayClientProject();
    } else if (option == 0) {
      false;
      break;
    }
  }
  print("");
}

//========Add Client==========
addClient() {
  print("");
  print("   !========= Adding Client ==========!");
  int? cId;
  bool isUnique = false;
  while (!isUnique) {
    stdout.write("Enter client id! should be unique in numbers: ");
    cId = int.parse(stdin.readLineSync()!);

    isUnique = true;

    for (var i = 0; i < clients.length; i++) {
      if (cId == clients[i]["id"]) {
        print("$cId is already exist!");
        isUnique = false;
        break;
      }
    }
  }

  stdout.write("Enter client name: ");
  String cName = stdin.readLineSync()!;

  stdout.write("Enter client email: ");
  String cEmail = stdin.readLineSync()!;

  stdout.write("Enter client phone number: ");
  int cNumber = int.parse(stdin.readLineSync()!);

  stdout.write("Enter client's project: ");
  String cProject = stdin.readLineSync()!;

  Map<String, dynamic> client = {
    "id": cId,
    "name": cName,
    "email": cEmail,
    "number": cNumber
  };

  Map<String, dynamic> clientProjects = {
    "id": cId,
    "name": cName,
    "project": cProject
  };

  clients.add(client);
  clientsProjects.add(clientProjects);
  print("Client added Successfully");
  print("");
}

//=======display client=========
displayClient() {
  while (true) {
    print("");
    print("   !========= Displaying Client/s ==========!");
    if (clients.isEmpty) {
      print("No client found");
    }
    print("Display only one Client press: 1");
    print("Display all Clients press: 2");
    int option = int.parse(stdin.readLineSync()!);
    if (option == 1) {
      print("");
      bool idExist = false;
      stdout.write("Enter client id: ");
      int id = int.parse(stdin.readLineSync()!);
      for (var i = 0; i < clientsProjects.length; i++) {
        print("");
        if (id == clients[i]["id"]) {
          idExist = true;
          print("Client id: ${clients[i]["id"]}");
          print("Client name: ${clients[i]["name"]}");
          print("Client email: ${clients[i]["email"]}");
          print("Client number: ${clients[i]["number"]}");
          break;
        }
      }
      if (!idExist) {
        print("Invalid id or this id does not exist ");
      }
    }
    if (option == 2) {
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

//========display client project=========

displayClientProject() {
  while (true) {
    print("");
    print("   !========= Displaying Client's project ==========!");
    if (clientsProjects.isEmpty) {
      print("No client found");
    }
    print("Display only one Client' project press: 1");
    print("Display all Client's projetcs press: 2");
    int option = int.parse(stdin.readLineSync()!);
    if (option == 1) {
      bool idExist = false;
      print("");
      stdout.write("Enter client id: ");
      int id = int.parse(stdin.readLineSync()!);
      for (var i = 0; i < clientsProjects.length; i++) {
        print("");
        if (id == clientsProjects[i]["id"]) {
          idExist = true;
          print("Client id: ${clientsProjects[i]["id"]}");
          print("Client name: ${clientsProjects[i]["name"]}");
          print("Client project: ${clientsProjects[i]["project"]}");
          break;
        }
      }
      if (!idExist) {
        print("Invalid id or this id does not exist ");
      }
    }
    if (option == 2) {
      for (var i = 0; i < clientsProjects.length; i++) {
        print("Client id: ${clientsProjects[i]["id"]}");
        print("Client name: ${clientsProjects[i]["name"]}");
        print("Client project: ${clientsProjects[i]["project"]}");
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

//=========remove client===========

removeClient() {
  print("");
  print("  !========== Removing Client ==========!");
  print("");
  if (clients.isEmpty) {
    print("No Client found to remove");
  } else {
    print("Remove all or only 1 ?");
    print("");
    stdout.write("1 for Remove all or 2 for only one: ");
    int option = int.parse(stdin.readLineSync()!);
    if (option == 1) {
      clients.clear();
      clientsProjects.clear();
      print("All clients remove successfully");
    } else {
      stdout.write("Enter client id, Who you want to remove: ");
      int id = int.parse(stdin.readLineSync()!);

      bool idExist = false;

      for (var i = 0; i < clients.length; i++) {
        if (id == clients[i]["id"]) {
          idExist = true;
          clients.removeWhere((value) => value["id"] == id);
          for (var i = 0; i < clientsProjects.length; i++) {
            clientsProjects.removeWhere((value) => value["id"] == id);
          }
          print("");
          print("Client and client's project remove successfully");
        }
      }
      if (!idExist) {
        print("");
        print("$id: id Does not exist!");
      }
    }
  }
}

//========update client=========

updateClient() {
  print("");
  print("   !========= Updatinging Client ==========!");
  print("Displaying data before update!");
  displayClient();
  while (true) {
    if (clients.isEmpty) {
      print("Can't update empty list");
      break;
    } else {
      print("Do you want to update client ? (yes/no)");
      String option = stdin.readLineSync()!;
      if (option == "yes" || option == "Yes") {
        print("Edit Email or phone");
        print("For email: 1");
        print("For number: 2");
        int options = int.parse(stdin.readLineSync()!);
        if (options == 1) {
          print("/Editing Email/");
          stdout.write("Enter Client id: ");
          int id = int.parse(stdin.readLineSync()!);
          for (var i = 0; i < clients.length; i++) {
            if (id == clients[i]["id"]) {
              stdout.write("Enter New email: ");
              String email = stdin.readLineSync()!;
              clients[i]["email"] = email;
              print("Email updated Successfully!");
            }
            if (id != clients[i]["id"]) {
              print("$id does not exist");
            }
          }
        } else if (options == 2) {
          print("/Editing Number/");
          stdout.write("Enter Client id: ");
          int id = int.parse(stdin.readLineSync()!);
          for (var i = 0; i < clients.length; i++) {
            if (id == clients[i]["id"]) {
              stdout.write("Enter New number: ");
              int number = int.parse(stdin.readLineSync()!);
              clients[i]["number"] = number;
              print("Number updated Successfully!");
            }
            if (id != clients[i]["id"]) {
              print("$id does not exist");
            }
          }
        } else {
          print("Invalid input");
        }
      } else {
        false;
        break;
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
    print("");
    print("1 for admin login");
    print("0 for exit");
    int option = int.parse(stdin.readLineSync()!);
    if (option == 1) {
      print("");
      print("Login As Admin");

      print("");
      stdout.write("Enter your email: ");
      String email = stdin.readLineSync()!;
      stdout.write("Enter your password: ");
      String password = stdin.readLineSync()!;

      bool logginSuccessful = false;

      for (var i = 0; i < adminLogin.length; i++) {
        if (email == adminLogin[i]["email"] &&
            password == adminLogin[i]["password"]) {
          logginSuccessful = true;
          print("");
          print("Login Successful!");
          print("");
          print("1 for admin");
          print("0 for exit");
          options = int.parse(stdin.readLineSync()!);
          if (options == 1) {
            adminBlock();
          } else if (options == 0) {
            break;
          }
        }
      }
      if (!logginSuccessful) {
        print("Incorrect Email or password! Try Again");
      }
    } else if (option == 0) {
      again = false;
      break;
    }
  }
}
