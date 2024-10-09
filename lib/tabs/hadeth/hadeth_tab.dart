import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:islamic_appv2/tabs/hadeth/hadeth.dart';
import 'package:islamic_appv2/tabs/hadeth/hadeth_content_screen.dart';
import 'package:islamic_appv2/widgets/loading_indicator.dart';

class HadethTab extends StatefulWidget {
  @override
  State<HadethTab> createState() => _HadethTabState();
}

class _HadethTabState extends State<HadethTab> {
  List<Hadeth> ahadeth = [];

  @override
  void initState() {
    super.initState();
    loadHadethFile();
  }

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        Image.asset(
          "assets/images/hadith_header.png",
          height: MediaQuery.sizeOf(context).height * 0.25,
        ),
        Expanded(
          child: ahadeth.isEmpty
              ? LoadingIndicator()
              : ListView.separated(
                  padding: const EdgeInsets.only(top: 12),
                  itemBuilder: (_, index) => InkWell(
                    onTap: () {
                      Navigator.of(context).pushNamed(HadethContentScreen.route,
                          arguments: ahadeth[index]);
                    },
                    child: Text(
                      ahadeth[index].name,
                      textAlign: TextAlign.center,
                      style: Theme.of(context).textTheme.headlineSmall,
                    ),
                  ),
                  itemCount: ahadeth.length,
                  separatorBuilder: (_, __) => const SizedBox(
                    height: 12,
                  ),
                ),
        ),
      ],
    );
  }

  Future<void> loadHadethFile() async {
    String ahadethFileContent =
        await rootBundle.loadString("assets/files/ahadeth.txt");

    List<String> ahadethStrings = ahadethFileContent.split("#");

    ahadeth = ahadethStrings.map((hadethString) {
      List<String> hadethLines = hadethString.trim().split('\n');
      String title = hadethLines.first;
      hadethLines.removeAt(0);
      List<String> content = hadethLines;
      return Hadeth(title, content);
    }).toList();

    setState(() {});
  }
}
