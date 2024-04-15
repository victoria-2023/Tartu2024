import 'package:flutter/material.dart';

class SettingsPage extends StatefulWidget {
  final Function(Locale) onLocaleChanged; // Callback to change locale

  SettingsPage({this.onLocaleChanged = _defaultLocaleChange});

  static void _defaultLocaleChange(Locale locale) {}

  @override
  _SettingsPageState createState() => _SettingsPageState();
}

class _SettingsPageState extends State<SettingsPage> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Settings'),
      ),
      body: ListView(
        children: <Widget>[
          SwitchListTile(
            title: Text('Dark Mode'),
            value: Theme.of(context).brightness == Brightness.dark,
            onChanged: (bool value) {
              // Implement dark/light mode toggle here
            },
          ),
          ListTile(
            title: Text('English'),
            onTap: () => widget.onLocaleChanged(Locale('en', '')),
          ),
          ListTile(
            title: Text('Polski'),
            onTap: () => widget.onLocaleChanged(Locale('pl', '')),
          ),
          ListTile(
            title: Text('Français'),
            onTap: () => widget.onLocaleChanged(Locale('fr', '')),
          ),
          // Add other settings here
        ],
      ),
    );
  }
}
