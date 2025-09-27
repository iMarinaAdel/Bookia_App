import 'package:bookia/core/services/api/dio_provider.dart';
import 'package:bookia/core/services/local/local_helper.dart';
import 'package:bookia/core/utils/app_theme.dart';
import 'package:bookia/routes/routes.dart';
import 'package:device_preview/device_preview.dart';
import 'package:flutter/foundation.dart';
import 'package:flutter/material.dart';

Future<void> main() async {
  WidgetsFlutterBinding.ensureInitialized();
 

  await Future.value([DioProvider.init(), LocalHelper.init()]);

  runApp(
    DevicePreview(enabled: kDebugMode, builder: (context) => const BookiaApp()),
  );
}

class BookiaApp extends StatelessWidget {
  const BookiaApp({super.key});

  @override
  Widget build(BuildContext context) {
     LocalHelper.setUserData(null);
    return MaterialApp.router(
      debugShowCheckedModeBanner: false,
      routerConfig: Routes.router,
      theme: AppTheme.lightTheme,
    );
  }
}
