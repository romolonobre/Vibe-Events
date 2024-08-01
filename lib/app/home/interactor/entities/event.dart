// ignore_for_file: public_member_api_docs, sort_constructors_first
import 'package:vibe/app/home/interactor/entities/venue.dart';

class Event {
  final String id;
  final String name;
  final List<String> imagesUrl;
  final String date;
  final String time;
  final String buyTicketUrl;
  final String? ticketPrice;
  final Venue venue;

  Event({
    required this.id,
    required this.name,
    required this.imagesUrl,
    required this.date,
    required this.time,
    required this.buyTicketUrl,
    required this.ticketPrice,
    required this.venue,
  });

  @override
  String toString() {
    return 'Event(id: $id, name: $name, imagesUrl: $imagesUrl, date: $date, time: $time, buyTicketUrl: $buyTicketUrl, ticketPrice: $ticketPrice, venue: $venue)';
  }
}
