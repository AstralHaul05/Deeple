import 'dart:io';

import 'package:intl/intl.dart';

import 'stability.dart';
import 'tokeniser.dart';

class Deeple {
  static String name = "Deeple";
  static String file_extension = ".dpl";

  static int version_major = 0;
  static int version_minor = 0;
  static int version_patch = 0;
  static Stability stability = Stability.Stable;
  static String version_sep = ".";

  static String time = DateFormat('yyyy-MM-dd hh:mm:ss').format(DateTime.now());
  static String local_host_name = Platform.localHostname;
  static String operating_system = Platform.operatingSystem;
  static String? architecture = Platform.environment["PROCESSOR_ARCHITECTURE"];
  static int num_proccessors = Platform.numberOfProcessors;
  
  static String get version => [version_major, version_minor, version_patch].join(version_sep);

  static String get id => 
    "$name $version ($time) $local_host_name [($num_proccessors) $architecture] on $operating_system";

  String src = "";
  late Tokeniser tokeniser;

  Deeple(String source_code) {
    this.src = source_code;
    this.tokeniser = new Tokeniser(source_code);
    this.tokeniser.tokenise();
  }
}