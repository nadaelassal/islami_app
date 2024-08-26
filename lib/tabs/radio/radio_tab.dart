// ignore_for_file: prefer_const_constructors, prefer_const_literals_to_create_immutables

import 'package:flutter/material.dart';
import 'package:islami_app/app_theme.dart';
import 'package:islami_app/tabs/settings/settings_provider.dart';
import 'package:provider/provider.dart';

class RadioTab extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
        SettingsProvider settingsProvider = Provider.of<SettingsProvider>(context);
    return Column(
      crossAxisAlignment: CrossAxisAlignment.center,
      children: [
        SizedBox(height: 110,),
         Image.asset('assets/images/radio_image.png'),

         SizedBox(height: 20,),
         Text("إذاعة القرآن الكريم" , style: Theme.of(context).textTheme.headlineSmall),
         SizedBox(height: 25,),
         Row(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Icon(Icons.skip_previous , color:settingsProvider.isDark? AppTheme.gold : AppTheme.lightPrimary , size: 30,),
            SizedBox(width: 20,),
            Icon(Icons.play_arrow_rounded, color:settingsProvider.isDark? AppTheme.gold : AppTheme.lightPrimary, size: 50,),
            SizedBox(width: 20,),
            Icon(Icons.skip_next, color:settingsProvider.isDark? AppTheme.gold : AppTheme.lightPrimary, size: 30,),
          ],
         )
         
        
      ],
    );
  }
}
