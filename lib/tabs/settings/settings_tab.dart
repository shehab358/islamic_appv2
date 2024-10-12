import 'package:flutter/material.dart';
import 'package:islamic_appv2/tabs/settings/language.dart';
import 'package:islamic_appv2/tabs/settings/settings.dart';
import 'package:provider/provider.dart';

class SettingsTab extends StatefulWidget {
  const SettingsTab({super.key});

  @override
  State<SettingsTab> createState() => _SettingsTabState();
}

class _SettingsTabState extends State<SettingsTab> {
  List<Language> languages = [
    Language(name: "English", code: 'en'),
    Language(name: "العربية", code: 'ar')
  ];
  bool isDark = false;
  @override
  Widget build(BuildContext context) {
    SettingsProvider settingsProvider = Provider.of<SettingsProvider>(context);
    return Padding(
      padding: const EdgeInsets.symmetric(horizontal: 20),
      child: Column(
        children: [
          Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              Text(
                'Dark Mode',
                style: Theme.of(context)
                    .textTheme
                    .titleLarge
                    ?.copyWith(fontWeight: FontWeight.w500),
              ),
              Switch(
                value: settingsProvider.themeMode == ThemeMode.dark,
                onChanged: (isDark) => settingsProvider
                    .changeTheme(isDark ? ThemeMode.dark : ThemeMode.light),
              ),
            ],
          ),
          const SizedBox(
            height: 8,
          ),
          Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              Text(
                'Language',
                style: Theme.of(context)
                    .textTheme
                    .titleLarge
                    ?.copyWith(fontWeight: FontWeight.w500),
              ),
              DropdownButtonHideUnderline(
                child: DropdownButton<Language>(
                  value: languages.firstWhere(
                    (language) =>
                        language.code == settingsProvider.languageCode,
                  ),
                  items: languages
                      .map(
                        (language) => DropdownMenuItem<Language>(
                          value: language,
                          child: Text(
                            language.name,
                          ),
                        ),
                      )
                      .toList(),
                  onChanged: (selectedLanguage) {
                    if (selectedLanguage != null) {
                      settingsProvider.changeLanguage(selectedLanguage.code);
                    }
                  },
                ),
              ),
            ],
          ),
        ],
      ),
    );
  }
}
