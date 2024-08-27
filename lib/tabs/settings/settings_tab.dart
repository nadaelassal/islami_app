// ignore_for_file: prefer_const_constructors, prefer_const_literals_to_create_immutables

import 'package:flutter/material.dart';
import 'package:islami_app/app_theme.dart';
import 'package:islami_app/tabs/settings/settings_provider.dart';
import 'package:provider/provider.dart';

class SettingsTab extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    SettingsProvider settingsProvider = Provider.of<SettingsProvider>(context);
    return Padding(
      padding: const EdgeInsets.symmetric(horizontal: 20),
      child: Column(
        children: [
          Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              Text(
                "Dark Mode",
                style: Theme.of(context).textTheme.headlineSmall,
              ),
              Switch(
                value: settingsProvider.isDark,
                onChanged: (isDark) => settingsProvider
                    .changeThemeMode(isDark ? ThemeMode.dark : ThemeMode.light),
                activeTrackColor: AppTheme.gold,
                inactiveTrackColor: Colors.grey,
              ),
            ],
          ),
          SizedBox(
            height: 8,
          ),
          Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              Text(
                "Language",
                style: Theme.of(context).textTheme.headlineSmall,
              ),
              DropdownButtonHideUnderline(
                child: DropdownButton(
                  value: settingsProvider.language,
                  items: [
                    DropdownMenuItem(
                      value: 'en',
                      child: Text(
                        'English',
                        style: TextStyle(
                            color: settingsProvider.isDark
                                ? Colors.white
                                : Colors.black),
                      ),
                    ),
                    DropdownMenuItem(
                      value: 'ar',
                      child: Text(
                        'العربية',
                        style: TextStyle(
                            color: settingsProvider.isDark
                                ? Colors.white
                                : Colors.black),
                      ),
                    )
                  ],
                  onChanged: (selectedLanguage) {
                    if (selectedLanguage == null) return;
                    settingsProvider.changeLanguage(selectedLanguage);
                  },
                  dropdownColor: AppTheme.white,
                  borderRadius: BorderRadius.circular(16),
                ),
              )
            ],
          ),
        ],
      ),
    );
  }
}
