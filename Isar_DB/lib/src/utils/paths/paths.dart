import 'dart:io' show Directory;

import 'package:flutter/material.dart' show WidgetsFlutterBinding;
import 'package:path/path.dart' show join;
import 'package:path_provider/path_provider.dart'
    show getApplicationDocumentsDirectory;

import '../../configs/configs.dart' show appName;
import '../helpers/other/other_helper.dart' show log;

late Directory appDir;
late Directory appDBDir;
late Directory appBackupDir;

Future<void> initDir() async {
  WidgetsFlutterBinding.ensureInitialized();
  final dir = await getApplicationDocumentsDirectory();
  appDir = Directory(join(dir.path, '.${appName.toLowerCase()}'));
  appDBDir = Directory(join(appDir.path, 'db'));
  appBackupDir = Directory(join(appDir.path, 'backup'));
  if (!appDir.existsSync()) appDir.createSync(recursive: true);
  if (!appDBDir.existsSync()) appDBDir.createSync(recursive: true);
  if (!appBackupDir.existsSync()) appBackupDir.createSync(recursive: true);
  log.i('App Directory: ${appDir.path}');
}
