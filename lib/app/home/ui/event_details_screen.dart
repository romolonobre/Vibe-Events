import 'package:flutter/material.dart';
import 'package:vibe/app/_commons/extensions.dart';
import 'package:vibe/app/_commons/vibe_ui/palette/vui_palette.dart';
import 'package:vibe/app/_commons/vibe_ui/typography/vui_text.dart';

import '../../_commons/vibe_ui/vui_buttons.dart';
import 'widgets/info_row_widget.dart.dart';

class EventDetailsScreen extends StatelessWidget {
  const EventDetailsScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        body: Stack(
      children: [
        //
        // Image header
        Image.network(
          "https://images.pexels.com/photos/1387174/pexels-photo-1387174.jpeg?auto=compress&cs=tinysrgb&w=800",
          height: 400,
          fit: BoxFit.fill,
        ),
        Align(
          alignment: Alignment.bottomCenter,
          child: Container(
            height: 500,
            width: double.infinity,
            decoration: const BoxDecoration(
              color: Colors.white,
              borderRadius: BorderRadius.only(
                topLeft: Radius.circular(25),
                topRight: Radius.circular(25),
              ),
            ),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                VUIText.subTitle('Tomorrowland'),
                const SizedBox(height: 10),
                const InfoRowWidget(
                  firstInfo: "Boom, Belgium",
                  icon1: Icons.location_on_outlined,
                  secondInfo: "Nov 12 2024",
                  icon2: Icons.calendar_month_rounded,
                  fontsize: 14,
                  iconSize: 22,
                  mainAxisAlignment: MainAxisAlignment.start,
                  space: 10,
                ),
                const SizedBox(height: 20),
                VUIText.subTitle("About Event"),
                const SizedBox(height: 5),
                VUIText.content(
                  " For my mod5 project at Flatiron School, I wanted to create a concert finding app that would allow users to see when their favorite artistr my mod5 project at Flatiron School, I wanted to create a concert finding app that would allow users to see when their favorite artists were playing in their area. For searching and favoriting artist I ws were playing in their area. For searching and favoriting artist I w",
                  color: VUIPalette.primaryColor,
                  fontsize: 14,
                  fontWeight: FontWeight.bold,
                ),
                const Spacer(),
                const SizedBox(height: 20),
                VUIButtons.solid(
                  label: "Buy Ticket  -  £61",
                  onPressed: () {},
                ).paddingOnly(bottom: 30)
              ],
            ).paddingOnly(left: 20, right: 20, top: 20),
          ),
        ),
        Positioned(
          top: 60,
          child: VUIButtons.back(context),
        ),
      ],
    ));
  }
}
