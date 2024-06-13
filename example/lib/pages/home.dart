import 'package:bot_toast/bot_toast.dart';
import 'package:flutter/material.dart';
import 'package:preference_list/preference_list.dart';

class HomePage extends StatefulWidget {
  const HomePage({super.key});

  @override
  State<HomePage> createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
  bool _isDarkAppearance = false;
  Widget _buildBody(BuildContext context) {
    return PreferenceList(
      children: <Widget>[
        PreferenceListSection(
          title: const Text('APPEARANCE'),
          children: [
            PreferenceListSwitchItem(
              title: const Text('Dark Appearance'),
              value: _isDarkAppearance,
              onChanged: (newValue) {
                setState(() {
                  _isDarkAppearance = !_isDarkAppearance;
                });
              },
            ),
          ],
        ),
        PreferenceListSection(
          title: const Text('DISPLAY ZOOM'),
          description: const Text(
            'Choose a view for iphone Zoomed shows larger controls. Standard shows more content',
          ),
          children: [
            PreferenceListItem(
              title: const Text('View'),
              detailText: const Text('Standard'),
              onTap: () {
                BotToast.showText(text: 'Tapped!');
              },
            ),
          ],
        ),
        PreferenceListSection(
          title: const Text('PAIRED DEVICES'),
          description: const Text(
            'Removing trusted computers will delete all of the records of computers that you have paired with previously',
          ),
          children: [
            PreferenceListItem(
              title: Text(
                'Clear Trusted Computers',
                style: TextStyle(color: Theme.of(context).primaryColor),
              ),
              accessoryView: Container(),
              onTap: () {
                BotToast.showText(text: 'Tapped!');
              },
            ),
          ],
        ),
      ],
    );
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Plugin example app'),
      ),
      body: _buildBody(context),
    );
  }
}
