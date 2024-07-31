import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';
import 'package:vibe/app/_commons/extensions.dart';
import 'package:vibe/app/_commons/vibe_ui/palette/vui_palette.dart';
import 'package:vibe/app/_commons/vibe_ui/typography/vui_text.dart';

import 'widgets/categorie_button.dart';
import 'widgets/info_row_widget.dart.dart';

class HomeScreen extends StatefulWidget {
  const HomeScreen({super.key});

  @override
  State<HomeScreen> createState() => _HomeScreenState();
}

class _HomeScreenState extends State<HomeScreen> {
  String selectedEvent = 'All';

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Column(
          children: [
            VUIText.subTitle(
              "Vibe",
              color: VUIPalette.primaryColor,
            ),
            VUIText.content(
              "Connect, Discover, Enjoy",
              color: VUIPalette.black,
              fontsize: 12,
            ),
          ],
        ),
      ),
      body: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          const SizedBox(height: 20),
          SizedBox(
            height: 50,
            child: CategorieButton(
              ontap: (value) {
                selectedEvent = value;
                setState(() {});
              },
            ),
          ),
          const SizedBox(height: 40),
          VUIText.subTitle(selectedEvent).paddingOnly(left: 25, bottom: 10),
          Expanded(
            child: GridView.builder(
              scrollDirection: Axis.vertical,
              gridDelegate: const SliverGridDelegateWithFixedCrossAxisCount(
                crossAxisCount: 2,
                mainAxisSpacing: 10,
                crossAxisSpacing: 10,
                mainAxisExtent: 210,
              ),
              padding: const EdgeInsets.all(0),
              itemCount: 12,
              itemBuilder: (context, index) {
                return GestureDetector(
                  onTap: () => context.pushNamed('/event-details'),
                  child: Container(
                    decoration: BoxDecoration(
                      border: Border.all(
                        width: 0.6,
                        color: Colors.grey.shade300,
                      ),
                      borderRadius: BorderRadius.circular(15),
                    ),
                    child: Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        const SizedBox(height: 10),
                        Material(
                          elevation: 10,
                          borderRadius: BorderRadius.circular(10),
                          child: ClipRRect(
                            borderRadius: BorderRadius.circular(10),
                            child: Image.network(
                              "https://images.pexels.com/photos/1387174/pexels-photo-1387174.jpeg?auto=compress&cs=tinysrgb&w=800",
                            ),
                          ),
                        ),
                        const SizedBox(height: 8),
                        VUIText.content(
                          "Tomorrowland",
                          fontsize: 13,
                          fontWeight: FontWeight.bold,
                        ),
                        const SizedBox(height: 5),
                        const InfoRowWidget(
                          firstInfo: "Nov 12 2024",
                          icon1: Icons.calendar_month_rounded,
                          secondInfo: "08:00 PM",
                          icon2: Icons.watch_later_outlined,
                        ),
                        const SizedBox(height: 5),
                        GestureDetector(
                            child: Row(
                              mainAxisAlignment: MainAxisAlignment.end,
                              children: [
                                VUIText.content(
                                  "Buy ticket",
                                  fontsize: 14,
                                  color: VUIPalette.primaryColor,
                                  fontWeight: FontWeight.w700,
                                ),
                                const SizedBox(width: 5),
                                const Icon(
                                  Icons.arrow_forward_ios_rounded,
                                  size: 14,
                                  color: VUIPalette.primaryColor,
                                ).paddingOnly(top: 2)
                              ],
                            ),
                            onTap: () => {}),
                      ],
                    ).paddingOnly(left: 10, right: 10),
                  ),
                );
              },
            ).paddingOnly(left: 10, right: 10),
          )
        ],
      ),
    );
  }
}
