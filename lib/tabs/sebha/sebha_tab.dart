import 'package:flutter/material.dart';
import 'package:islamic_appv2/tabs/settings/settings.dart';
import 'package:provider/provider.dart';

class SebhaTab extends StatefulWidget {
  const SebhaTab({super.key});

  @override
  State<SebhaTab> createState() => _SebhaTabState();
}

class _SebhaTabState extends State<SebhaTab> {
  int sebha = 0;
  @override
  Widget build(BuildContext context) {
    return Center(
      child: Column(
        children: [
          SizedBox(
            height: MediaQuery.sizeOf(context).height * 0.05,
          ),
          Image.asset(
            "assets/images/body of seb7a.png",
            height: 350,
            width: 350,
          ),
          Text(
            "عدد التسبيحات",
            style: Theme.of(context).textTheme.displayMedium,
          ),
          SizedBox(
            height: MediaQuery.sizeOf(context).height * 0.03,
          ),
          Container(
            height: 81,
            width: 69,
            decoration: BoxDecoration(
                color: Provider.of<SettingsProvider>(context).containerColor,
                borderRadius: BorderRadius.circular(50)),
            child: Center(
              child: Text(
                "$sebha",
                style: Theme.of(context).textTheme.headlineSmall,
              ),
            ),
          ),
          SizedBox(
            height: MediaQuery.sizeOf(context).height * 0.05,
          ),
          ElevatedButton(
            onPressed: () {
              sebha++;
              setState(() {});
            },
            child: Text(
              "سبحان الله",
              style: Theme.of(context).textTheme.headlineMedium,
            ),
          )
        ],
      ),
    );
  }
}
