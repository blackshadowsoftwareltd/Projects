import 'package:flutter_riverpod/flutter_riverpod.dart'
    show Provider, StreamProvider;

import '../../model/setting_model.dart'
    show AppConfigExtension, GetAppConfigCollection;
import '../config/app_config_db.dart' show appConfig, appConfigDB;

final appConfigStream =
    StreamProvider((ref) => appConfigDB.appConfigs.watchObjectLazy(0));

final themeProvider = Provider((ref) {
  ref.watch(appConfigStream);
  return appConfig.theme;
});
