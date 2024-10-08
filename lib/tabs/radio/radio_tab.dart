// ignore_for_file: prefer_const_constructors, prefer_const_literals_to_create_immutables

import 'package:audioplayers/audioplayers.dart';
import 'package:flutter/material.dart';
import 'package:islami_app/api/api_services.dart';
import 'package:islami_app/tabs/radio/radio_model/radio.dart';
import 'package:islami_app/tabs/radio/radio_model/radio_model.dart';
import 'package:islami_app/widgets/loading_indicator.dart';
import 'package:islami_app/widgets/radio_widget.dart';

class RadioTab extends StatefulWidget {
  @override
  State<RadioTab> createState() => _RadioTabState();
}

class _RadioTabState extends State<RadioTab> {
  PageController? controller = PageController();
  @override
  Widget build(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.center,
      children: [
        SizedBox(
          height: 110,
        ),
        Image.asset('assets/images/radio_image.png'),
        SizedBox(
          height: 20,
        ),
        Text("إذاعة القرآن الكريم",
            style: Theme.of(context).textTheme.headlineSmall),
        SizedBox(
          height: 30,
        ),
        SizedBox(
          height: 200,
          child: FutureBuilder<RadioModel>(
            future: ApiServices.getRadios(),
            builder: (context, snapshot) {
              if (snapshot.connectionState == ConnectionState.waiting) {
                return LoadingIndicator();
              } else if (snapshot.hasError) {
                return Text('Something went wrong');
              } else {
                RadioModel? radioModel = snapshot.data;
                final player = AudioPlayer();

                List<Radios> radios = radioModel?.radios ?? [];

                return PageView.builder(
                    controller: controller,
                    scrollDirection: Axis.horizontal,
                    itemCount: radios.length,
                    itemBuilder: (context, index) {
                      return RadioWidget(
                        radioModel: radios[index],
                        player: player,
                        next: () {
                          player.pause();
                          controller?.nextPage(
                              duration: Duration(seconds: 1),
                              curve: Curves.linear);
                        },
                        previous: () {
                          player.pause();
                          controller?.previousPage(
                              duration: Duration(seconds: 1),
                              curve: Curves.linear);
                        },
                      );
                    });
              }
            },
          ),
        ),
      ],
    );
  }
}
