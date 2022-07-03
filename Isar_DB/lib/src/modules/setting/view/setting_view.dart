import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';

import '../../../utils/themes/themes.dart';
import '../provider/config/app_config_db.dart';
import '../provider/theme/theme_db.dart';
import '../provider/theme/theme_provider.dart';

class SettingView extends StatelessWidget {
  const SettingView({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: const Text('Settings')),
      body: Center(
        child: Consumer(
          builder: (_, ref, __) {
            ref.watch(themeProvider);
            final theme = appConfig.themeIndex;
            return ElevatedButton(
              style: roundedButtonStyle,
              onPressed: () => changeTheme(theme == 0 ? 1 : 0),
              child: theme == 1
                  ? const Text('Change Theme to Light')
                  : const Text('Change Theme to Dark'),
            );
          },
        ),
      ),
    );
  }
}
