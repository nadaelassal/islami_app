import 'package:flutter/material.dart';

class SuraDetailsScreen extends StatelessWidget {
  static const String routeName = '/sura_details';

  @override
  Widget build(BuildContext context) {
    return Container(
      decoration: BoxDecoration(
          image: DecorationImage(
        image: AssetImage('assets/images/default_bg.png'),
      )),
      child: Scaffold(
        appBar: AppBar(
          title: Text(''),
        ),
      ),
    );
  }
}
