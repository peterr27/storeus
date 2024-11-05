import 'package:flutter/material.dart';
import 'package:storeus/core/config/router/router_config.dart';
import 'package:storeus/core/config/theme/theme_configration.dart';

void main() {
  WidgetsFlutterBinding.ensureInitialized();
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp.router(
      title: 'StoreUs',
      debugShowCheckedModeBanner: false,
      routerConfig: AppRouterConfig.router,
      theme: ThemeConfigration.getTheme(),
    );
  }
}
