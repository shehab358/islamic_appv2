import 'package:flutter/material.dart';
import 'package:islamic_appv2/tabs/settings/settings.dart';
import 'package:provider/provider.dart';

class RadioTab extends StatelessWidget {
  const RadioTab({super.key});

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        const Spacer(
          flex: 1,
        ),
        Image.asset(
          'assets/images/radio1.png',
        ),
        const Spacer(
          flex: 1,
        ),
        Text("اذاعة القراّن الكريم",
            style: Theme.of(context).textTheme.displayMedium),
        const Spacer(
          flex: 1,
        ),
        Row(
          mainAxisAlignment: MainAxisAlignment.spaceEvenly,
          children: [
            Icon(
              Icons.skip_previous_sharp,
              size: 35,
              color: Provider.of<SettingsProvider>(context).iconColor,
            ),
            Icon(
              Icons.play_arrow,
              size: 50,
              color: Provider.of<SettingsProvider>(context).iconColor,
            ),
            Icon(
              Icons.skip_next_sharp,
              size: 35,
              color: Provider.of<SettingsProvider>(context).iconColor,
            ),
          ],
        ),
        const Spacer(
          flex: 2,
        ),
      ],
    );
  }
}
