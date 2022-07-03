import 'package:flutter/material.dart'
    show BuildContext, Key, MaterialApp, Widget;
import 'package:flutter_riverpod/flutter_riverpod.dart'
    show ConsumerWidget, WidgetRef;

import 'localization/loalization.dart'
    show localizationsDelegates, onGenerateTitle, supportedLocales;
import 'modules/router/view/router.dart' show AppRouter;
import 'modules/setting/provider/theme/theme_provider.dart' show themeProvider;

class MyApp extends ConsumerWidget {
  const MyApp({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    return MaterialApp(
      restorationScopeId: 'app',
      onGenerateTitle: onGenerateTitle,
      debugShowCheckedModeBanner: false,
      supportedLocales: supportedLocales,
      localizationsDelegates: localizationsDelegates,
      theme: ref.watch(themeProvider),
      home: const AppRouter(),
    );
  }
}
