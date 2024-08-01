import 'package:flutter/material.dart';
import 'package:vibe/app/_commons/extensions.dart';
import 'package:vibe/app/home/interactor/entities/event.dart';

import '../../_commons/vibe_ui/typography/vui_text.dart';
import '../../_commons/vibe_ui/vui_buttons.dart';
import 'home_screen.dart';
import 'widgets/info_row_widget.dart.dart';

class EventDetailsScreen extends StatefulWidget {
  final Event event;
  const EventDetailsScreen({super.key, required this.event});

  @override
  _EventDetailsScreenState createState() => _EventDetailsScreenState();
}

class _EventDetailsScreenState extends State<EventDetailsScreen> with SingleTickerProviderStateMixin {
  late AnimationController _controller;
  late Animation<Offset> _animation;

  @override
  void initState() {
    super.initState();
    _controller = AnimationController(
      vsync: this,
      duration: const Duration(milliseconds: 500),
    );

    _animation = Tween<Offset>(
      begin: const Offset(0, 1),
      end: const Offset(0, 0),
    ).animate(CurvedAnimation(
      parent: _controller,
      curve: Curves.easeInOut,
    ));

    _controller.forward();
  }

  @override
  void dispose() {
    _controller.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    final venue = widget.event.venue;
    return Scaffold(
      body: Stack(
        children: [
          Image.network(
            height: MediaQuery.of(context).size.height,
            widget.event.imagesUrl.last,
            fit: BoxFit.fill,
          ),
          Positioned(
            top: 60,
            child: VUIButtons.back(context),
          ),
          SlideTransition(
            position: _animation,
            child: Column(
              children: [
                Container(
                  width: MediaQuery.sizeOf(context).width,
                  height: 200,
                  margin: const EdgeInsets.only(top: 530, left: 20, right: 20),
                  decoration: BoxDecoration(
                    color: Colors.white,
                    borderRadius: BorderRadius.circular(10),
                  ),
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.center,
                    children: [
                      VUIText.subTitle(widget.event.name),
                      const SizedBox(height: 10),
                      InfoRowWidget(
                        firstInfo: widget.event.venue.name,
                        icon1: Icons.location_on_outlined,
                        secondInfo: widget.event.date,
                        icon2: Icons.calendar_month_rounded,
                        fontsize: 14,
                        iconSize: 22,
                        mainAxisAlignment: MainAxisAlignment.center,
                        space: 15,
                      ),
                      const SizedBox(height: 10),
                      VUIText.content(venue.name),
                      VUIText.content(
                        "${venue.address}  ${venue.postalCode} ",
                        color: Colors.grey.shade500,
                      ),
                      VUIText.content(
                        venue.city,
                        color: Colors.grey.shade500,
                      ),
                    ],
                  ).paddingOnly(left: 10, right: 10, top: 10),
                ),
                const SizedBox(height: 20),
                VUIButtons.solid(
                  height: 60,
                  label: widget.event.ticketPrice!.isNotEmpty
                      ? "Buy Ticket  -  £${widget.event.ticketPrice}"
                      : "Buy Ticket",
                  onPressed: () => launchURL(widget.event.buyTicketUrl),
                ).paddingOnly(left: 20, right: 20)
              ],
            ),
          ),
        ],
      ),
    );
  }
}
