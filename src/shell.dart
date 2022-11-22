import 'dart:io';

import 'deeple.dart';

void main(List<String> args) {
  // TODO: Commands
  // format
  // fix
  // compile
  // analyze
  // run

  // no args given: print deeple id to confirm install, prompt user to enter file
  if (args.length == 0) {
    print(Deeple.id);
    print("\nProvide a file to run deeple.");
    return;
  }

  // if the file passed as the first argument is invalid warn user
  if (!(File(args[0]).existsSync() && args[0].endsWith(Deeple.file_extension))) { 
    print("${args[0]} is not a valid or existing deeple file."); 
    return;
  }

  List<String> source_code = File(args[0]).readAsLinesSync();

  Deeple deeple = new Deeple(source_code);
}