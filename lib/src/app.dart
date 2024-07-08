import 'package:flutter/material.dart';
import 'package:flutter_contacts/src/routes.dart';
import 'package:flutter_contacts/src/screens/contact_edit_page.dart';
import 'package:flutter_contacts/src/screens/contact_page.dart';
import 'package:flutter_contacts/src/screens/settings_page.dart';
import 'package:flutter_gen/gen_l10n/app_localizations.dart';
import 'package:flutter_localizations/flutter_localizations.dart';
import 'package:get/get.dart';

import 'controllers/settings.dart';

class MyApp extends StatelessWidget {
  const MyApp({
    super.key,
    required this.settingsController,
  });

  final SettingsController settingsController;

  @override
  Widget build(BuildContext context) {
    return ListenableBuilder(
      listenable: settingsController,
      builder: (BuildContext context, Widget? child) {
        return GetMaterialApp(
          localizationsDelegates: const [
            AppLocalizations.delegate,
            GlobalMaterialLocalizations.delegate,
            GlobalWidgetsLocalizations.delegate,
            GlobalCupertinoLocalizations.delegate,
          ],
          supportedLocales: const [
            Locale('en', ''),
          ],
          onGenerateTitle: (BuildContext context) =>
              AppLocalizations.of(context)!.appTitle,
          theme: ThemeData(),
          darkTheme: ThemeData.dark(),
          themeMode: settingsController.themeMode,
          debugShowCheckedModeBanner: false,
          initialRoute: Routes.contacts,
          getPages: [
            GetPage(name: Routes.contacts, page: () => ContactsPage()),
            GetPage(name: Routes.editContact, page: () => EditContactPage()),
            GetPage(name: Routes.settings, page: () => SettingsView(controller: settingsController)),
          ],
        );
      },
    );
  }
}
