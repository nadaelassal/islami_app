// ignore_for_file: prefer_const_constructors

import 'package:flutter/material.dart';
import 'package:islami_app/app_theme.dart';
import 'package:islami_app/tabs/hadeth/hadeth.dart';
import 'package:islami_app/tabs/settings/settings_provider.dart';
import 'package:islami_app/widgets/loading_indicator.dart';
import 'package:provider/provider.dart';

class HadethDetailsScreen extends StatelessWidget {
  static const String routeName = '/hadeth-details';

  @override
  Widget build(BuildContext context) {
    Hadeth hadeth = ModalRoute.of(context)!.settings.arguments as Hadeth;
      SettingsProvider settingsProvider = Provider.of<SettingsProvider>(context);
     return Container(
      decoration: BoxDecoration(
          image: DecorationImage(
        image: AssetImage(settingsProvider.backgroundImagePath),
      )),
      child: Scaffold(
        appBar: AppBar(
          title: Text(hadeth.title),
        ),
        body: Container(
          padding: EdgeInsets.all(24),
          margin: EdgeInsets.symmetric(
              vertical: MediaQuery.of(context).size.height * 0.06,
              horizontal: MediaQuery.of(context).size.width * 0.07),
          decoration: BoxDecoration(
              borderRadius: BorderRadius.circular(25), color:settingsProvider.isDark ? AppTheme.darkPrimary : AppTheme.white),
          child: hadeth.content.isEmpty
              ? 
                 LoadingIndicator()
                
              : ListView.builder(
                  itemBuilder: (_, index) => Text(
                    hadeth.content[index],
                    textAlign: TextAlign.center,
                    style: Theme.of(context).textTheme.titleLarge,
                  ),
                  itemCount: hadeth.content.length,
                ),
        ),
      ),
    );
  }
}
