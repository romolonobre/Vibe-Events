import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:go_router/go_router.dart';
import 'package:url_launcher/url_launcher.dart';
import 'package:vibe/app/_commons/app_services/injector.dart';
import 'package:vibe/app/_commons/extensions.dart';
import 'package:vibe/app/_commons/vibe_ui/palette/vui_palette.dart';
import 'package:vibe/app/_commons/vibe_ui/typography/vui_text.dart';
import 'package:vibe/app/home/interactor/state/event_state.dart';

import '../../_commons/widgets/app_logo.dart';
import '../interactor/events_cubit.dart';
import 'widgets/categorie_button.dart';
import 'widgets/info_row_widget.dart.dart';

class HomeScreen extends StatefulWidget {
  const HomeScreen({super.key});

  @override
  State<HomeScreen> createState() => _HomeScreenState();
}

class _HomeScreenState extends State<HomeScreen> {
  String selectedEvent = 'All';
  final cubit = getIt<EventsCubit>();

  @override
  void initState() {
    super.initState();
    cubit.getEvents(selectedEvent);
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        centerTitle: true,
        title: Column(
          children: [
            AppLogo(
              logoColor: VUIPalette.primaryColor,
              logoSize: 18,
              sloganColor: VUIPalette.primaryColor,
              sloganSize: 10,
            ),
          ],
        ),
      ),
      body: BlocProvider(
        create: (context) => cubit,
        child: BlocBuilder<EventsCubit, EventsState>(
          builder: (context, state) {
            return Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                const SizedBox(height: 20),

                //
                // Categories Buttons
                SizedBox(
                  height: 50,
                  child: CategorieButton(
                    ontap: (value) {
                      selectedEvent = value;
                      cubit.getEvents(selectedEvent);
                      setState(() {});
                    },
                  ),
                ),
                const SizedBox(height: 40),
                VUIText.subTitle(selectedEvent).paddingOnly(left: 25, bottom: 10),

                // Loading state
                if (state is EventsLoadingState)
                  const Center(
                    heightFactor: 14,
                    child: CircularProgressIndicator(
                      color: VUIPalette.primaryColor,
                    ),
                  ),

                // Error state
                if (state is EventsErrorState)
                  Center(
                    child: VUIText.subTitle(
                      state.errorMessage,
                      color: Colors.red,
                    ),
                  ),

                // Loaded state -  Events grid
                if (state is EventsLoadedState)
                  Expanded(
                    child: GridView.builder(
                      scrollDirection: Axis.vertical,
                      gridDelegate: const SliverGridDelegateWithFixedCrossAxisCount(
                        crossAxisCount: 2,
                        mainAxisSpacing: 15,
                        crossAxisSpacing: 15,
                        mainAxisExtent: 200,
                      ),
                      padding: const EdgeInsets.all(0),
                      itemCount: state.events.length,
                      itemBuilder: (context, index) {
                        final event = state.events[index];

                        return GestureDetector(
                          onTap: () => context.pushNamed('/event-details', extra: event),
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

                                // Image
                                Material(
                                  elevation: 10,
                                  borderRadius: BorderRadius.circular(10),
                                  child: ClipRRect(
                                    borderRadius: BorderRadius.circular(10),
                                    child: SizedBox(
                                      width: double.infinity,
                                      height: 100,
                                      child: Image.network(
                                        event.imagesUrl[1],
                                        fit: BoxFit.fill,
                                      ),
                                    ),
                                  ),
                                ),
                                const SizedBox(height: 8),

                                // Event Name
                                Flexible(
                                  child: VUIText.content(
                                    event.name,
                                    fontsize: 13,
                                    overflow: TextOverflow.ellipsis,
                                    fontWeight: FontWeight.bold,
                                  ),
                                ),
                                const SizedBox(height: 5),

                                // Event date and time
                                InfoRowWidget(
                                  firstInfo: event.date,
                                  icon1: Icons.calendar_month_rounded,
                                  secondInfo: "${event.time} PM",
                                  icon2: Icons.watch_later_outlined,
                                ),
                                const SizedBox(height: 5),

                                //
                                // Buy ticket button
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
                                  onTap: () => launchURL(event.buyTicketUrl),
                                ),
                              ],
                            ).paddingOnly(left: 10, right: 10),
                          ),
                        );
                      },
                    ).paddingOnly(left: 10, right: 10, bottom: 20),
                  )
              ],
            );
          },
        ),
      ),
    );
  }
}

void launchURL(String url) async {
  if (await canLaunchUrl(Uri.parse(url))) {
    await launchUrl(Uri.parse(url));
  } else {
    throw 'Could not launch $url';
  }
}
