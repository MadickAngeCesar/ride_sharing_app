import 'package:flutter/material.dart';

class SettingPage extends StatefulWidget {
  const SettingPage({super.key});

  @override
  // ignore: library_private_types_in_public_api
  _SettingPageState createState() => _SettingPageState();
}

class _SettingPageState extends State<SettingPage> {
  int _rating = 3;
  bool _isDarkMode = false;
  String _selectedLanguage = 'English';

  final List<String> _languages = ['English', 'Spanish', 'French', 'German'];

  void _rateApp(int rating) {
    setState(() {
      _rating = rating;
    });
  }

  void _toggleTheme(bool isDarkMode) {
    setState(() {
      _isDarkMode = isDarkMode;
    });
    // Implement logic to change theme mode
  }

  void _changeLanguage(String language) {
    setState(() {
      _selectedLanguage = language;
    });
    // Implement logic to change app language
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Settings'),
        backgroundColor: Colors.blue,
      ),
      body: Padding(
        padding: const EdgeInsets.all(16.0),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            const Text(
              'Theme Mode',
              style: TextStyle(fontSize: 18, fontWeight: FontWeight.bold),
            ),
            SwitchListTile(
              title: const Text('Dark Mode'),
              value: _isDarkMode,
              onChanged: _toggleTheme,
            ),
            const SizedBox(height: 20),
            const Text(
              'Language Preference',
              style: TextStyle(fontSize: 18, fontWeight: FontWeight.bold),
            ),
            DropdownButtonFormField<String?>(
              value: _selectedLanguage,
              onChanged: (String? language) {
                if (language != null) {
                  _changeLanguage(language);
                }
              },
              items: _languages
                  .map((language) => DropdownMenuItem<String>(
                        value: language,
                        child: Text(language),
                      ))
                  .toList(),
            ),
            const SizedBox(height: 20),
            const Text(
              'Rate App',
              style: TextStyle(fontSize: 18, fontWeight: FontWeight.bold),
            ),
            Row(
              children: List.generate(5, (index) {
                int starValue = index + 1;
                return IconButton(
                  icon: Icon(
                    Icons.star,
                    color: starValue <= _rating ? Colors.yellow : Colors.grey,
                  ),
                  onPressed: () => _rateApp(starValue),
                );
              }),
            ),
            // Additional relevant settings can be added here
          ],
        ),
      ),
    );
  }
}
