// ignore_for_file: prefer_const_constructors

import 'dart:math';

import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';
import 'package:islami_app/app_theme.dart';
import 'package:islami_app/tabs/settings/settings_provider.dart';
import 'package:provider/provider.dart';

class SebhaTab extends StatefulWidget {
  @override
  State<SebhaTab> createState() => _SebhaTabState();
}

class _SebhaTabState extends State<SebhaTab> {
  int counter = 0;
  int index = 0;
  double angle = 0;
  List<String> doaa = ['الله اكبر', 'سبحان الله', 'الحمد لله'];
  @override
  Widget build(BuildContext context) {
    SettingsProvider settingsProvider = Provider.of<SettingsProvider>(context);
    return Center(
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.center,
        children: [
          Stack(
            children: [
              Padding(
                padding: const EdgeInsets.only(left: 30.0),
                child: Align(
                  alignment: Alignment.center,
                  child: Image.asset(settingsProvider.isDark
                      ? 'assets/images/head_sebha_dark.png'
                      : 'assets/images/head_sebha_logo.png'),
                ),
              ),
              GestureDetector(
                onTap: counterMethod,
                child: Padding(
                  padding: const EdgeInsets.only(top: 75.0),
                  child: Align(
                    alignment: Alignment.center,
                    child: Transform.rotate(
                      angle: angle,
                      child: Image.asset(settingsProvider.isDark
                          ? 'assets/images/body_sebha_dark.png'
                          : 'assets/images/body_sebha_logo.png'),
                    ),
                  ),
                ),
              ),
            ],
          ),
          const SizedBox(
            height: 30,
          ),
          Text(
            'Counter',
            style: TextStyle(
                fontSize: 25,
                fontWeight: FontWeight.w600,
                color:
                    settingsProvider.isDark ? AppTheme.white : AppTheme.black),
          ),
          Container(
            margin: EdgeInsets.symmetric(vertical: 5),
            padding: const EdgeInsets.symmetric(vertical: 10, horizontal: 15),
            decoration: BoxDecoration(
              borderRadius: BorderRadius.circular(30),
              color: settingsProvider.isDark
                  ? AppTheme.gold
                  : Color.fromRGBO(183, 147, 95, 1).withOpacity(.57),
            ),
            child: Text(
              counter.toString(),
              style: TextStyle(
                  fontSize: 20,
                  fontWeight: FontWeight.w400,
                  color: settingsProvider.isDark
                      ? AppTheme.white
                      : AppTheme.black),
            ),
          ),
          Container(
            margin: EdgeInsets.symmetric(vertical: 10),
            padding: const EdgeInsets.symmetric(vertical: 10, horizontal: 20),
            decoration: BoxDecoration(
                borderRadius: BorderRadius.circular(30),
                color: settingsProvider.isDark
                    ? AppTheme.gold
                    : Theme.of(context).primaryColor),
            child: Text(
              doaa[index].toString(),
              style: TextStyle(
                  fontSize: 25,
                  fontWeight: FontWeight.w400,
                  color: settingsProvider.isDark
                      ? AppTheme.white
                      : AppTheme.black),
            ),
          ),
        ],
      ),
    );
  }

  counterMethod() {
    angle += 10;
    if (counter == 33) {
      counter = 0;
      if (index < doaa.length - 1) {
        index++;
      } else {
        index = 0;
      }
    } else {
      counter++;
    }
    setState(() {});
  }
}
