import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:flutter_localizations/flutter_localizations.dart';
import 'package:flutter_smartlook/flutter_smartlook.dart';
import 'package:get/get.dart';
import 'package:upgrader/upgrader.dart';
import 'package:ziggle/app/core/theme/app.dart';
import 'package:ziggle/app/core/values/colors.dart';
import 'package:ziggle/app/data/services/analytics/service.dart';
import 'package:ziggle/binding.dart';
import 'package:ziggle/gen/strings.g.dart';

import 'app/routes/pages.dart';

class App extends StatefulWidget {
  const App({super.key});

  @override
  State<App> createState() => _AppState();
}

class _AppState extends State<App> {
  final smartlook = Smartlook.instance;

  @override
  void initState() {
    super.initState();
    smartlook.start();
    smartlook.preferences
        .setProjectKey('559177df225fb6be8f57ab026bcd071f18c172cc');
  }

  @override
  Widget build(BuildContext context) {
    return SmartlookRecordingWidget(
      child: AnnotatedRegion(
        value: const SystemUiOverlayStyle(
          systemNavigationBarColor: Palette.white,
        ),
        child: GestureDetector(
          onTap: () => FocusManager.instance.primaryFocus?.unfocus(),
          child: GetMaterialApp(
            locale: TranslationProvider.of(context).flutterLocale,
            supportedLocales: AppLocaleUtils.supportedLocales,
            localizationsDelegates: GlobalMaterialLocalizations.delegates,
            debugShowCheckedModeBanner: false,
            initialRoute: AppPages.INITIAL,
            initialBinding: initialBinding,
            getPages: AppPages.routes,
            theme: appTheme,
            navigatorObservers: AnalyticsService.observers,
            builder: (context, child) => UpgradeAlert(
              upgrader: Upgrader(
                dialogStyle: UpgradeDialogStyle.cupertino,
                showIgnore: false,
                showLater: false,
              ),
              navigatorKey: Get.key,
              child: child,
            ),
          ),
        ),
      ),
    );
  }
}
