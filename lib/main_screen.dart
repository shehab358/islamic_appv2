import 'package:flutter/material.dart';
import 'package:islamic_appv2/tabs/radio/radio_tab.dart';
import 'package:islamic_appv2/tabs/sebha/sebha_tab.dart';
import 'package:islamic_appv2/tabs/quran/quran_tabs.dart';
import 'package:islamic_appv2/tabs/hadeth/hadeth_tab.dart';
import 'package:islamic_appv2/tabs/settings/settings.dart';
import 'package:islamic_appv2/tabs/settings/settings_tab.dart';
import 'package:provider/provider.dart';
import 'package:flutter_gen/gen_l10n/app_localizations.dart';



class MainScreen extends StatefulWidget {
  static String route = "/";
  const MainScreen({super.key});

  @override
  State<MainScreen> createState() => _MainScreenState();
}

class _MainScreenState extends State<MainScreen> {
  int currentIndex = 0;
  List<Widget> tabs = [
    QuranTabs(),
    HadethTab(),
    const RadioTab(),
    const SebhaTab(),
    const SettingsTab(),
  ];
  @override
  Widget build(BuildContext context) {
    return Container(
      decoration:  BoxDecoration(
        image: DecorationImage(
          fit: BoxFit.fill,
          image: AssetImage(
            'assets/images/${Provider.of<SettingsProvider>(context).backGroundImageName}.png',
          ),
        ),
      ),
      child: Scaffold(
        backgroundColor: Colors.transparent,
        appBar: AppBar(
          title:  Text(AppLocalizations.of(context)!.islami),
        ),
        body: tabs[currentIndex],
        bottomNavigationBar: BottomNavigationBar(
          currentIndex: currentIndex,
          onTap: (index) {
            currentIndex = index;
            setState(() {});
          },
          items:  [
            BottomNavigationBarItem(
              icon: const ImageIcon(
                AssetImage(
                  "assets/images/quran.png",
                ),
              ),
              label: AppLocalizations.of(context)!.quran,
            ),
            BottomNavigationBarItem(
              icon: const ImageIcon(
                AssetImage(
                  "assets/images/quran-quran-svgrepo-com.png",
                ),
              ),
              label: AppLocalizations.of(context)!.hadeth,
            ),
            BottomNavigationBarItem(
              icon: const ImageIcon(
                AssetImage(
                  "assets/images/radio.png",
                ),
              ),
              label: AppLocalizations.of(context)!.radio,
            ),
            BottomNavigationBarItem(
              icon: const ImageIcon(
                AssetImage(
                  "assets/images/sebha.png",
                ),
              ),
              label: AppLocalizations.of(context)!.sebha,
            ),
            BottomNavigationBarItem(
              icon: const Icon(
                Icons.settings,
              ),
              label: AppLocalizations.of(context)!.settings,
            ),
          ],
        ),
      ),
    );
  }
}
