import 'package:flutter/material.dart';
import 'package:islamic_appv2/tabs/radio/radio_tab.dart';
import 'package:islamic_appv2/tabs/sebha/sebha_tab.dart';
import 'package:islamic_appv2/tabs/quran/quran_tabs.dart';
import 'package:islamic_appv2/tabs/hadeth/hadeth_tab.dart';
import 'package:islamic_appv2/tabs/settings/settings_tab.dart';

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
    SebhaTab(),
    RadioTab(),
    SettingsTab(),
  ];
  @override
  Widget build(BuildContext context) {
    return Container(
      decoration: const BoxDecoration(
        image: DecorationImage(
          fit: BoxFit.fill,
          image: AssetImage(
            "assets/images/bg3.png",
          ),
        ),
      ),
      child: Scaffold(
        backgroundColor: Colors.transparent,
        appBar: AppBar(
          title: const Text("اسلامي"),
        ),
        body: tabs[currentIndex],
        bottomNavigationBar: BottomNavigationBar(
          currentIndex: currentIndex,
          onTap: (index) {
            currentIndex = index;
            setState(() {});
          },
          items: const [
            BottomNavigationBarItem(
              icon: ImageIcon(
                AssetImage(
                  "assets/images/quran.png",
                ),
              ),
              label: 'Quran',
            ),
            BottomNavigationBarItem(
              icon: ImageIcon(
                AssetImage(
                  "assets/images/quran-quran-svgrepo-com.png",
                ),
              ),
              label: "Hadeth",
            ),
            BottomNavigationBarItem(
              icon: ImageIcon(
                AssetImage(
                  "assets/images/radio.png",
                ),
              ),
              label: 'Radio',
            ),
            BottomNavigationBarItem(
              icon: ImageIcon(
                AssetImage(
                  "assets/images/sebha.png",
                ),
              ),
              label: 'Sebha',
            ),
            BottomNavigationBarItem(
              icon: Icon(
                Icons.settings,
              ),
              label: 'Settings',
            ),
          ],
        ),
      ),
    );
  }
}
