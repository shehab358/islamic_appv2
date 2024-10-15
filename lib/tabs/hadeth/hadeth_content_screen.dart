import 'package:flutter/material.dart';
import 'package:islamic_appv2/tabs/hadeth/hadeth.dart';
import 'package:islamic_appv2/tabs/settings/settings.dart';
import 'package:provider/provider.dart';

class HadethContentScreen extends StatefulWidget {
  static const String route = "HadethContentScreenh";

  const HadethContentScreen({super.key});

  @override
  State<HadethContentScreen> createState() => _HadethContentScreenState();
}

class _HadethContentScreenState extends State<HadethContentScreen> {



  @override
  Widget build(BuildContext context) {
     Hadeth args=ModalRoute.of(context)!.settings.arguments as Hadeth;
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
          title: Text(args.name),
        ),
        body: Container(
          padding: const EdgeInsets.all(24),
          margin: EdgeInsets.symmetric(
            vertical: MediaQuery.sizeOf(context).height * 0.1,
            horizontal: 30,
          ),
          decoration: BoxDecoration(
            color:  Provider.of<SettingsProvider>(context).containerColor,
            borderRadius: BorderRadius.circular(25),
          ),
          child: ListView.builder(
                  itemBuilder: (_, index) => Padding(
                    padding: const EdgeInsets.symmetric(vertical: 8.0),
                    child: Text(
                      args.lines[index],
                      textAlign: TextAlign.center,
                      style: Theme.of(context).textTheme.titleLarge,
                    ),
                  ),
                  itemCount: args.lines.length,
                ),
        ),
      ),
    );
  }


}
