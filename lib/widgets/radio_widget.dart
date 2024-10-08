// ignore_for_file: prefer_const_constructors

import 'package:audioplayers/audioplayers.dart';
import 'package:flutter/material.dart';
import 'package:islami_app/app_theme.dart';
import 'package:islami_app/tabs/radio/radio_model/radio.dart';
import 'package:islami_app/tabs/settings/settings_provider.dart';
import 'package:provider/provider.dart';

class RadioWidget extends StatelessWidget {
  RadioWidget(
      {super.key,
      required this.radioModel,
      required this.player,
      required this.next,
      required this.previous});
  final Radios radioModel;
  final AudioPlayer player;
  final Function next, previous;

  @override
  Widget build(BuildContext context) {
    SettingsProvider settingsProvider = Provider.of<SettingsProvider>(context);

    return Container(
      width: MediaQuery.of(context).size.width,
      padding: const EdgeInsets.all(8.0),
      child: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          Row(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              IconButton(
                onPressed: () {
                  next();
                },
                icon: Icon(
                  Icons.skip_next,
                  color: settingsProvider.isDark
                      ? AppTheme.gold
                      : AppTheme.lightPrimary,
                  size: 50,
                ),
              ),
              SizedBox(
                width: 30,
              ),
              IconButton(
                onPressed: () {
                  player.pause();
                },
                icon: Icon(
                  Icons.pause,
                  size: 50,
                  color: settingsProvider.isDark
                      ? AppTheme.gold
                      : AppTheme.lightPrimary,
                ),
              ),
              SizedBox(
                width: 5,
              ),
              IconButton(
                onPressed: () {
                  if (radioModel.url != null) {
                    player.play(UrlSource(radioModel.url!));
                  }
                },
                icon: Icon(
                  Icons.play_arrow_rounded,
                  size: 60,
                  color: settingsProvider.isDark
                      ? AppTheme.gold
                      : AppTheme.lightPrimary,
                ),
              ),
              SizedBox(
                width: 30,
              ),
              IconButton(
                onPressed: () {
                  previous();
                },
                icon: Icon(
                  Icons.skip_previous,
                  color: settingsProvider.isDark
                      ? AppTheme.gold
                      : AppTheme.lightPrimary,
                  size: 50,
                ),
              ),
            ],
          ),
          Text(radioModel.name ?? '')
        ],
      ),
    );
  }
}
