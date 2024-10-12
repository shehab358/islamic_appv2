import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:islamic_appv2/tabs/quran/quran_tabs.dart';
import 'package:islamic_appv2/tabs/settings/settings.dart';
import 'package:islamic_appv2/widgets/loading_indicator.dart';
import 'package:provider/provider.dart';

// ignore: must_be_immutable
class SuraDetailsScreen extends StatefulWidget {
  static const String route = "Surah";

  SuraDetailsScreen({super.key});

  @override
  State<SuraDetailsScreen> createState() => _SuraDetailsScreenState();
}

class _SuraDetailsScreenState extends State<SuraDetailsScreen> {
  List<String> ayat = [];

  late SuraDetailsArgs args;


  @override
  Widget build(BuildContext context) {
          args = ModalRoute.of(context)!.settings.arguments as SuraDetailsArgs;
      loadSuraFile();
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
          title: Text(args.suraName),
        ),
        body: Container(
          padding: const EdgeInsets.all(24),
          margin: EdgeInsets.symmetric(
            vertical: MediaQuery.sizeOf(context).height * 0.1,
            horizontal: 30,
          ),
          decoration: BoxDecoration(
            color: Provider.of<SettingsProvider>(context).containerColor,
            borderRadius: BorderRadius.circular(25),
          ),
          child: ayat.isEmpty
              ? LoadingIndicator()
              : ListView.builder(
                  itemBuilder: (_, index) => Padding(
                    padding: const EdgeInsets.symmetric(vertical: 8.0),
                    child: Text(
                      ayat[index],
                      textAlign: TextAlign.center,
                      style: Theme.of(context).textTheme.titleLarge,
                    ),
                  ),
                  itemCount: ayat.length,
                ),
        ),
      ),
    );
  }

  Future<void> loadSuraFile() async {
    await Future.delayed(const Duration(seconds: 1));
    String sura =
        await rootBundle.loadString("assets/files/${args.index + 1}.txt");
    setState(() {
      ayat = sura.split('\n');
    });
  }
}
