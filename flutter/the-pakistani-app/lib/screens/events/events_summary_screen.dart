import 'dart:async';

import 'package:flutter/material.dart';
import 'package:the_pakistani_app/widgets/calendarView/calendarView.dart';

class EventsSummaryScreen extends StatefulWidget {
  @override
  _EventsSummaryScreenState createState() => _EventsSummaryScreenState();
}

class _EventsSummaryScreenState extends State<EventsSummaryScreen> {
  StreamController<List<Map<String, String?>>> eventsController =
      StreamController();

  @override
  void dispose() {
    eventsController.close();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    const List<Map<String, String?>> eventList = [
      // null location, so location will not be displayed
      // but event will be visible in calendar
      {
        'name': 'Event (null location)',
        'location': null,
        'date': '2019-01-18 14:27:00',
        'id': '1',
      },
      // null name, so name will not be displayed
      // but event will be visible in calendar
      {
        'name': null,
        'location': 'Suite 501',
        'date': '2019-01-18 13:35:00',
        'id': '2',
      },
      // null date, so event below will not be visible in calendar
      {
        'name': 'Event null date',
        'location': '1200 Park Avenue',
        'date': null,
        'id': '3',
      },
      // null id, so event below will not be visible in calendar
      {
        'name': 'Event null id',
        'location': 'Grand Ballroom',
        'date': '2019-01-27 13:27:00',
        'id': null,
      },
      {
        'name': 'Event 4',
        'location': 'Grand Ballroom',
        'date': '2019-01-26 13:27:00',
        'id': '4',
      },
      {
        'name': 'Event 5',
        'location': 'Suite 501',
        'date': '2019-02-05 14:35:00z',
        'id': '5',
      },
      {
        'name': 'Event 6',
        'location': '1200 Park Avenue',
        'date': '2019-02-12 05:49:00',
        'id': '6',
      },
      {
        'name':
            'Handle really long names in the event list so it does not break',
        'location': '1200 Park Avenue',
        'date': '2019-02-21 05:49:00',
        'id': '7',
      },
      {
        'name': 'Event 8',
        'location':
            'Handle really long locations in the event list so it does not break',
        'date': '2019-01-24 05:49:00z',
        'id': '8',
      },
    ];

    // Was ThemeData.accentColor/accentTextTheme/backgroundColor and old
    // (pre-2018) textTheme property names (display1/subhead/headline/title,
    // body1) -- all removed from current Flutter. Reconstructed with
    // colorScheme.secondary for the accent color and 6 distinct current
    // textTheme slots (this ThemeData is only ever read directly by
    // CalendarView/MonthView/EventsView as a plain settings object, never
    // applied as the ambient Theme, so slot choice can't collide with
    // anything else) standing in for the 4 original textTheme + 2 actually-
    // used accentTextTheme overrides:
    //   display1 (21, default color)         -> displaySmall
    //   subhead  (14, blueGrey)               -> bodyMedium
    //   headline (18, blueGrey, bold)         -> headlineSmall
    //   title    (14, blueGrey, bold)         -> titleSmall
    //   accentTextTheme.body1  (14, black)    -> bodyLarge
    //   accentTextTheme.title  (21, black, bold) -> titleLarge
    final theme = ThemeData.dark().copyWith(
      primaryColor: Colors.grey,
      colorScheme: ThemeData.dark().colorScheme.copyWith(
            secondary: Colors.green,
            onSecondary: Colors.black,
            surface: Colors.green,
          ),
      canvasColor: Colors.white,
      dividerColor: Colors.blueGrey,
      textTheme: ThemeData.dark().textTheme.copyWith(
            displaySmall: const TextStyle(
              fontSize: 21.0,
            ),
            bodyMedium: const TextStyle(
              fontSize: 14.0,
              color: Colors.blueGrey,
            ),
            headlineSmall: const TextStyle(
              fontSize: 18.0,
              color: Colors.blueGrey,
              fontWeight: FontWeight.bold,
            ),
            titleSmall: const TextStyle(
              fontSize: 14.0,
              color: Colors.blueGrey,
              fontWeight: FontWeight.bold,
            ),
            bodyLarge: const TextStyle(
              fontSize: 14.0,
              color: Colors.black,
            ),
            titleLarge: const TextStyle(
              fontSize: 21.0,
              color: Colors.black,
              fontWeight: FontWeight.bold,
            ),
          ),
    );

    void onEventTapped(Map<String, String?> event) {
      debugPrint(event.toString());
    }

    eventsController.add(eventList);

    return Scaffold(
      body: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: <Widget>[
            // default String parameter values used below as example
            CalendarView(
              onEventTapped: onEventTapped,
              titleField: 'name',
              detailField: 'location',
              dateField: 'date',
              separatorTitle: 'Events',
              theme: theme,
              eventStream: eventsController.stream,
            ),
          ],
        ),
      ),
    );
  }
}
