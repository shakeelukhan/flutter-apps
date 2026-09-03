import 'package:flutter/material.dart';
import 'package:intl/intl.dart';

class EventsView extends StatelessWidget {
  const EventsView(
      {super.key,
      required this.events,
      required this.month,
      required this.currentDay,
      required this.onEventTapped,
      required this.titleField,
      required this.detailField,
      required this.dateField,
      required this.theme});

  final Map<int, List> events;
  final int month;
  final int currentDay;
  final void Function(Map<String, String?> event) onEventTapped;
  final String titleField;
  final String detailField;
  final String dateField;
  final ThemeData theme;

  Widget dateBadge(day) => ConstrainedBox(
        constraints: const BoxConstraints(minWidth: 75.0),
        child: Container(
          margin: const EdgeInsets.all(8.0),
          padding: const EdgeInsets.all(16.0),
          decoration: BoxDecoration(
            shape: BoxShape.circle,
            color: theme.colorScheme.secondary,
          ),
          child: Column(
            children: <Widget>[
              Text(
                day.toString(),
                textAlign: TextAlign.center,
                style: theme.textTheme.titleLarge
                    ?.copyWith(color: theme.colorScheme.onSecondary),
              ),
            ],
          ),
        ),
      );

  String timeString(Map<String, String?> event) {
    final dateString = event[dateField];
    if (dateString == null) return '';
    final date = DateTime.parse(dateString).toLocal();
    return DateFormat.jm().format(date);
  }

  Widget eventRow(int day, Map<String, String?> event) => InkWell(
        onTap: () => onEventTapped(event),
        child: Padding(
          padding: const EdgeInsets.symmetric(horizontal: 16.0),
          child: Row(
            children: <Widget>[
              Expanded(
                flex: 8,
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: <Widget>[
                    Text(
                      event[titleField] ?? "",
                      style: theme.textTheme.headlineSmall,
                    ),
                    Text(
                      event[detailField] ?? "",
                      style: theme.textTheme.bodyMedium,
                    ),
                    Text(
                      timeString(event),
                      style: theme.textTheme.bodyMedium,
                    )
                  ],
                ),
              ),
              Expanded(
                child: Container(),
              ),
              dateBadge(day),
            ],
          ),
        ),
      );

  List<Widget> eventList() {
    List<Widget> list = [];
    events.forEach((int day, List dayEvents) {
      if (currentDay == 0 || currentDay == day) {
        for (var i = 0; i < dayEvents.length; i++) {
          list.add(eventRow(day, dayEvents[i] as Map<String, String?>));
          list.add(Divider(
            color: theme.dividerColor,
            height: 0.0,
          ));
        }
      }
    });
    return list;
  }

  @override
  Widget build(BuildContext context) {
    return Expanded(
      child: Container(
        color: theme.canvasColor,
        child: ListView(
          children: eventList(),
        ),
      ),
    );
  }
}
