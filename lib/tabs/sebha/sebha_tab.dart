// ignore_for_file: prefer_const_constructors

import 'package:flutter/material.dart';

class SebhaTab extends StatefulWidget {
  @override
  State<SebhaTab> createState() => _SebhaTabState();
}

class _SebhaTabState extends State<SebhaTab> {
  int counter = 0;
  List<String> doaa = ['سبحان الله', 'الحمد لله', 'الله اكبر'];
  double angle = 0;
  int index = 0;
  @override
  Widget build(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.center,
      children: [
        Stack(
          children: [
            Padding(
              padding: EdgeInsets.only(
                left: 30,
              ),
              child: Align(
                alignment: Alignment.center,
                child: Image.asset(
                  'assets/images/head_sebha_logo.png',
                  height: 100,
                ),
              ),
            ),
            GestureDetector(
              onTap: counterMethod,
              child: Padding(
                padding: EdgeInsets.only(
                  top: 75.0,
                ),
                child: Align(
                  alignment: Alignment.center,
                 child : Transform.rotate(angle:angle ,child:  Image.asset(
                    'assets/images/body_sebha_logo.png',
                  ),
                ),
              ),
            ),),
          ],
        ),
        const SizedBox(
          height: 30,
        ),
        const Text(
          "counter",
          style: TextStyle(fontSize: 25, fontWeight: FontWeight.w600),
        ),
        Container(
          margin: EdgeInsets.symmetric(vertical: 10),
          padding: EdgeInsets.symmetric(vertical: 10, horizontal: 13),
          decoration: BoxDecoration(
            borderRadius: BorderRadius.circular(30),
            color: Color.fromRGBO(183, 147, 95, 1).withOpacity(.57),
          ),
          child: Text(
            counter.toString(),
            style: TextStyle(fontSize: 25, fontWeight: FontWeight.w400),
          ),
        ),
        Container(
          margin: EdgeInsets.symmetric(vertical: 10),
          padding: EdgeInsets.symmetric(vertical: 10, horizontal: 13),
          decoration: BoxDecoration(
            borderRadius: BorderRadius.circular(30),
            color: Color.fromRGBO(183, 147, 95, 1),
          ),
          child: Text(
            doaa[index],
            style: TextStyle(fontSize: 25, fontWeight: FontWeight.w400),
          ),
        ),
      ],
    );
  }

  counterMethod() {
    angle += 10 ;
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
    setState(() {
      
    });
  }
}
