// ignore_for_file: prefer_const_constructors

import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:islami_app/app_theme.dart';
import 'package:islami_app/tabs/quran/quran_tab.dart';
import 'package:islami_app/tabs/settings/settings_provider.dart';
import 'package:islami_app/widgets/loading_indicator.dart';
import 'package:provider/provider.dart';

class SuraDetailsScreen extends StatefulWidget {
  static const String routeName = '/sura_details';

  @override
  State<SuraDetailsScreen> createState() => _SuraDetailsScreenState();
}

class _SuraDetailsScreenState extends State<SuraDetailsScreen> {
  List<String> ayat = [];
  late SuraDetailsArgs args;
  @override
  Widget build(BuildContext context) {
    SettingsProvider settingsProvider = Provider.of<SettingsProvider>(context);
    args = ModalRoute.of(context)!.settings.arguments as SuraDetailsArgs;
    if (ayat.isEmpty) {
      loadSuraFile();
    }
    return Container(
      decoration: BoxDecoration(
          image: DecorationImage(
        image: AssetImage(settingsProvider.backgroundImagePath),
      )),
      child: Scaffold(
        appBar: AppBar(
          title: Text(args.suraName),
        ),
        body: Container(
          padding: EdgeInsets.all(24),
          margin: EdgeInsets.symmetric(
              vertical: MediaQuery.of(context).size.height * 0.06,
              horizontal: MediaQuery.of(context).size.width * 0.07),
          decoration: BoxDecoration(
              borderRadius: BorderRadius.circular(25),
              color: settingsProvider.isDark
                  ? AppTheme.darkPrimary
                  : AppTheme.white),
          child: ayat.isEmpty
              ? LoadingIndicator()
              : ListView.builder(
                  itemBuilder: (_, index) => Text(
                    ayat[index],
                    textAlign: TextAlign.center,
                    style: Theme.of(context).textTheme.titleLarge,
                  ),
                  itemCount: ayat.length,
                ),
        ),
      ),
    );
  }

//read data from file
  Future<void> loadSuraFile() async {
    String sura =
        await rootBundle.loadString('assets/files/${args.index + 1}.txt');
    ayat = sura.split('\r\n'); //new line
    setState(() {});
  }
}
