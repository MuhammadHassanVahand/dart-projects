import 'dart:io';
import 'Client managment System.dart';
//============================ Client Section =================================

clientSection() {
  int option;
  while (true) {
    print("");
    print(" !=============== Client Section  =================! \n");
    print("For add client press: 1 \n");
    print("For display client press: 2 \n");
    print("For remove client press: 3 \n");
    print("For update Client press: 4 \n");
    print("For display Client's project press: 5 \n");
    print("For update Client's project press: 6 \n");
    print("For exit press: 0");

    String? input = stdin.readLineSync();

    if (input == null || input.isEmpty) {
      print("Invalid input");
      continue;
    }

    if (!RegExp(r'^\d+$').hasMatch(input)) {
      print("\nString input Not allowed! Use only numbers.");
      continue;
    }

    option = int.parse(input);
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
    } else if (option == 6) {
      updateClientProject();
    } else if (option == 0) {
      false;
      break;
    } else {
      print("");
      print("Invalid Input");
    }
  }
}

//========Add Client==========
addClient() {
  print("");
  print("   !========= Adding Client ==========! \n");
  int? cId;
  int cNumber;
  bool isUnique = false;
  while (!isUnique) {
    stdout.write("Enter client id! should be unique in numbers: ");

    String? input = stdin.readLineSync();

    if (input == null || input.isEmpty) {
      print("Invalid input");
      continue;
    }

    if (!RegExp(r'^\d+$').hasMatch(input)) {
      print("\nString input Not allowed! Use only numbers.\n");
      continue;
    }

    cId = int.parse(input);

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

  while (true) {
    stdout.write("Enter client phone number: ");
    String? input = stdin.readLineSync();

    if (input == null || input.isEmpty) {
      print("Invalid input");
      continue;
    }

    if (!RegExp(r'^\d+$').hasMatch(input)) {
      print("\nString input Not allowed! Use only numbers.\n");
      continue;
    } else {
      cNumber = int.parse(input);
      break;
    }
  }

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
    "project": cProject,
    "status": "Pending"
  };

  clients.add(client);
  clientsProjects.add(clientProjects);
  print("");
  print("Client added Successfully");
  print("");
}

//=======display client=========
displayClient() {
  print("");
  print("   !========= Displaying Client/s ==========! \n");
  while (true) {
    if (clients.isEmpty) {
      print("No client found");
      break;
    }

    int? option;
    while (true) {
      print("");
      print("Display only one Client press: 1");
      print("Display all Clients press: 2");
      print("For exit press: 0");
      String? input = stdin.readLineSync();

      if (input == null || input.isEmpty) {
        print("Invalid input");
        continue;
      }

      if (!RegExp(r'^\d+$').hasMatch(input)) {
        print("\nString input Not allowed! Use only numbers.\n");
        continue;
      } else {
        option = int.parse(input);
        break;
      }
    }

    if (option == 1) {
      print("");

      int? id;
      while (true) {
        stdout.write("Enter client id: ");
        String? input = stdin.readLineSync();

        if (input == null || input.isEmpty) {
          print("Invalid input");
          continue;
        }

        if (!RegExp(r'^\d+$').hasMatch(input)) {
          print("\nString input Not allowed! Use only numbers.\n");
          continue;
        } else {
          id = int.parse(input);
          break;
        }
      }

      bool idExist = clients.any((client) => client["id"] == id);

      print("");
      if (idExist) {
        final client = clients.firstWhere((client) => client["id"] == id);
        print("Client id: ${client["id"]}");
        print("Client name: ${client["name"]}");
        print("Client email: ${client["email"]}");
        print("Client number: ${client["number"]}");
      } else {
        print("Invalid id or this id does not exist ");
      }
    } else if (option == 2) {
      clients.forEach((client) {
        print("");
        print("Client id: ${client["id"]}");
        print("Client name: ${client["name"]}");
        print("Client email: ${client["email"]}");
        print("Client number: ${client["number"]}");
      });
    } else if (option == 0) {
      print("");
      print("Exiting....");
      break;
    } else {
      print("");
      print("Invalid input");
    }
  }
}

//========display client project=========

displayClientProject() {
  print("");
  print("   !========= Displaying Client's project ==========! \n");
  while (true) {
    if (clientsProjects.isEmpty) {
      print("No client found");
      break;
    }

    int? option;
    while (true) {
      print("");
      print("Display only one Client' project press: 1");
      print("Display all Client's projetcs press: 2");
      print("for exit press: 0");
      String? input = stdin.readLineSync();

      if (input == null || input.isEmpty) {
        print("Invalid input");
        continue;
      }

      if (!RegExp(r'^\d+$').hasMatch(input)) {
        print("\nString input Not allowed! Use only numbers.\n");
        continue;
      } else {
        option = int.parse(input);
        break;
      }
    }

    if (option == 1) {
      print("");

      int? id;
      while (true) {
        stdout.write("Enter client id: ");
        String? input = stdin.readLineSync();

        if (input == null || input.isEmpty) {
          print("Invalid input");
          continue;
        }

        if (!RegExp(r'^\d+$').hasMatch(input)) {
          print("\nString input Not allowed! Use only numbers.\n");
          continue;
        } else {
          id = int.parse(input);
          break;
        }
      }

      bool idExist = clients.any((client) => client["id"] == id);

      print("");
      if (idExist) {
        final clientProject = clientsProjects
            .firstWhere((clientProject) => clientProject["id"] == id);
        print("Client id: ${clientProject["id"]}");
        print("Client name: ${clientProject["name"]}");
        print("Client project: ${clientProject["project"]}");
        print("Client project status: ${clientProject["status"]}");
      } else {
        print("Invalid id or this id does not exist ");
      }
    } else if (option == 2) {
      print("");
      clientsProjects.forEach((clientProject) {
        print("");
        print("Client id: ${clientProject["id"]}");
        print("Client name: ${clientProject["name"]}");
        print("Client project: ${clientProject["project"]}");
        print("Client project status: ${clientProject["status"]}");
      });
    } else if (option == 0) {
      false;
      break;
    } else {
      print("");
      print("Invalid input");
    }
  }
}

//=========remove client===========

removeClient() {
  print("");
  print("  !========== Removing Client ==========!");
  while (true) {
    print("");
    if (clients.isEmpty) {
      print("No Client found to remove");
      break;
    } else {
      print("Remove all or only 1 ?");
      print("");
      int? option;
      while (true) {
        stdout.write("1 for Remove all or 2 for only one: ");
        String? input = stdin.readLineSync();

        if (input == null || input.isEmpty) {
          print("Invalid input");
          continue;
        }

        if (!RegExp(r'^\d+$').hasMatch(input)) {
          print("\nString input Not allowed! Use only numbers.\n");
          continue;
        } else {
          option = int.parse(input);
          break;
        }
      }

      if (option == 1) {
        clients.clear();
        clientsProjects.clear();
        print("");
        print("All clients remove successfully");
        break;
      }
      if (option == 2) {
        int? id;
        while (true) {
          stdout.write("Enter client id, who you want to remove: ");
          String? input = stdin.readLineSync();

          if (input == null || input.isEmpty) {
            print("Invalid input");
            continue;
          }

          if (!RegExp(r'^\d+$').hasMatch(input)) {
            print("\nString input Not allowed! Use only numbers.\n");
            continue;
          } else {
            id = int.parse(input);
            break;
          }
        }

        bool idExist = clients.any((client) => client["id"] == id);

        if (idExist) {
          clients.removeWhere((client) => client["id"] == id);

          clientsProjects
              .removeWhere((clientProject) => clientProject["id"] == id);

          print("");
          print("Client and client's project remove successfully");
        } else {
          print("");
          print("$id: id Does not exist!");
        }
      } else {
        print("Invalid Input");
        continue;
      }
    }
  }
}

//========update client=========

updateClient() {
  print("");
  print("   !========= Updatinging Client ==========! \n");
  print("Displaying data before update! \n");
  displayClient();
  while (true) {
    if (clients.isEmpty) {
      print("Can't update empty list");
      break;
    } else {
      print("");
      print("Do you want to update client ? (yes/no) \n");
      String option = stdin.readLineSync()!;
      if (option == "yes" || option == "Yes") {
        int? options;
        while (true) {
          print("Edit Email or phone");
          print("For email: 1");
          print("For number: 2");

          String? input = stdin.readLineSync();

          if (input == null || input.isEmpty) {
            print("Invalid input");
            continue;
          }

          if (!RegExp(r'^\d+$').hasMatch(input)) {
            print("\nString input Not allowed! Use only numbers.\n");
            continue;
          } else {
            options = int.parse(input);
            break;
          }
        }

        if (options == 1) {
          print("/Editing Email/ \n");
          int? id;
          while (true) {
            stdout.write("Enter Client id: ");
            String? input = stdin.readLineSync();

            if (input == null || input.isEmpty) {
              print("Invalid input");
              continue;
            }

            if (!RegExp(r'^\d+$').hasMatch(input)) {
              print("\nString input Not allowed! Use only numbers.\n");
              continue;
            } else {
              id = int.parse(input);
              break;
            }
          }

          bool idExist = clients.any((client) => client["id"] == id);

          if (idExist) {
            stdout.write("Enter New email: ");
            String email = stdin.readLineSync()!;
            final client = clients.firstWhere((client) => client["id"] == id);
            client["email"] = email;
            print("");
            print("Email updated Successfully!");
            break;
          } else {
            print("");
            print("$id does not exist");
            break;
          }
        } else if (options == 2) {
          print("/Editing Number/ \n");
          print("");
          int? id;
          while (true) {
            stdout.write("Enter Client id: ");
            String? input = stdin.readLineSync();

            if (input == null || input.isEmpty) {
              print("Invalid input");
              continue;
            }

            if (!RegExp(r'^\d+$').hasMatch(input)) {
              print("\nString input Not allowed! Use only numbers.\n");
              continue;
            } else {
              id = int.parse(input);
              break;
            }
          }

          bool idExist = clients.any((client) => client["id"] == id);

          if (idExist) {
            int? number;
            while (true) {
              stdout.write("Enter New number: ");
              String? input = stdin.readLineSync();

              if (input == null || input.isEmpty) {
                print("Invalid input");
                continue;
              }

              if (!RegExp(r'^\d+$').hasMatch(input)) {
                print("\nString input Not allowed! Use only numbers.\n");
                continue;
              } else {
                number = int.parse(input);
                break;
              }
            }

            final client = clients.firstWhere((client) => client["id"] == id);
            client["number"] = number;

            print("");
            print("Number updated Successfully!");
            break;
          } else {
            print("");
            print("$id does not exist");
            break;
          }
        } else {
          print("Invalid input");
        }
      } else if (option == "no" || option == "No") {
        false;
        break;
      } else {
        print("Invalid Input");
      }
    }
  }
}

//========update client's project=========

updateClientProject() {
  print("");
  print("   !========= Updatinging Client's prject ==========!");
  print("Displaying data before update!");
  displayClientProject();
  while (true) {
    if (clientsProjects.isEmpty) {
      print("Can't update empty list");
      break;
    } else {
      print("");
      print("Do you want to update client project ? (yes/no)");
      String option = stdin.readLineSync()!;
      if (option == "yes" || option == "Yes") {
        int? options;
        while (true) {
          print("Edit project or status");
          print("For project: 1");
          print("For status: 2");

          String? input = stdin.readLineSync();

          if (input == null || input.isEmpty) {
            print("Invalid input");
            continue;
          }

          if (!RegExp(r'^\d+$').hasMatch(input)) {
            print("\nString input Not allowed! Use only numbers.\n");
            continue;
          } else {
            options = int.parse(input);
            break;
          }
        }

        if (options == 1) {
          print("/Editing project/");

          int? id;
          while (true) {
            stdout.write("Enter Client id: ");

            String? input = stdin.readLineSync();

            if (input == null || input.isEmpty) {
              print("Invalid input");
              continue;
            }

            if (!RegExp(r'^\d+$').hasMatch(input)) {
              print("\nString input Not allowed! Use only numbers.\n");
              continue;
            } else {
              id = int.parse(input);
              break;
            }
          }
          bool idExist =
              clientsProjects.any((clientProject) => clientProject["id"] == id);
          if (idExist) {
            stdout.write("Enter update project: ");
            String project = stdin.readLineSync()!;
            final clientProject = clientsProjects
                .firstWhere((clientProject) => clientProject["id"] == id);
            clientProject["project"] = project;
            print("project updated Successfully!");
            break;
          } else {
            print("$id does not exist");
            break;
          }
        } else if (options == 2) {
          print("/Editing status/");
          print("");
          int? id;
          while (true) {
            stdout.write("Enter Client id: ");
            String? input = stdin.readLineSync();

            if (input == null || input.isEmpty) {
              print("Invalid Input");
              continue;
            }
            if (!RegExp(r'^\d+$').hasMatch(input)) {
              print("\nString input Not allowed! Use only numbers.\n");
              continue;
            } else {
              id = int.parse(stdin.readLineSync()!);
              break;
            }
          }
          bool idExist =
              clientsProjects.any((clientProject) => clientProject["id"] == id);
          if (idExist) {
            stdout.write("Update status: ");
            String status = stdin.readLineSync()!;
            final clientProject = clientsProjects
                .firstWhere((clientProject) => clientProject["id"] == id);
            clientProject["status"] = status;
            print("status updated Successfully!");
            break;
          } else {
            print("$id does not exist");
            break;
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
