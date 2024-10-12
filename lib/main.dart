import 'package:flutter/material.dart';
import 'package:islamic_appv2/app_theme.dart';
import 'package:islamic_appv2/main_screen.dart';
import 'package:islamic_appv2/tabs/hadeth/hadeth_content_screen.dart';
import 'package:islamic_appv2/tabs/quran/sura_details_screen.dart';
import 'package:islamic_appv2/tabs/settings/settings.dart';
import 'package:provider/provider.dart';
import 'package:flutter_gen/gen_l10n/app_localizations.dart';

void main() {
  runApp(
    ChangeNotifierProvider(
      create: (_) => SettingsProvider(),
      child: const IslamiApp(),
    ),
  );
}

class IslamiApp extends StatelessWidget {
  const IslamiApp({super.key});

  @override
  Widget build(BuildContext context) {
    SettingsProvider settingsProvider = Provider.of<SettingsProvider>(context);
    return MaterialApp(
      routes: {
        MainScreen.route: (context) => MainScreen(),
        SuraDetailsScreen.route: (context) => SuraDetailsScreen(),
        HadethContentScreen.route: (context) => HadethContentScreen(),
      },
      initialRoute: MainScreen.route,
      theme: AppTheme.lightTheme,
      darkTheme: AppTheme.darkTheme,
      themeMode: settingsProvider.themeMode,
      localizationsDelegates: AppLocalizations.localizationsDelegates,
      supportedLocales: AppLocalizations.supportedLocales,
      locale: Locale(settingsProvider.languageCode),
    );
  }
}
