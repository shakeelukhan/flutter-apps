import 'package:flutter/material.dart';
import 'package:quiver/time.dart';
import 'package:thepakistaniapp/widgets/calendarView/constants.dart';

class MonthView extends StatelessWidget {
  const MonthView(this.year, this.month, this.events,
      {super.key, required this.onTapHandler, required this.theme});

  final int year;
  final int month;
  final Map<int, List> events;
  final void Function(int day) onTapHandler;
  final ThemeData theme;

  Widget dayMarker(int day, bool hasEvent) => Expanded(
        child: GestureDetector(
          onTap: hasEvent ? () => onTapHandler(day) : () => onTapHandler(0),
          child: Container(
            padding: const EdgeInsets.all(8.0),
            decoration: BoxDecoration(
              color: hasEvent
                  ? theme.colorScheme.secondary
                  : theme.primaryColor,
              shape: BoxShape.circle,
            ),
            child: Center(
                child: Text(
              day.toString(),
              // hasEvent: accentTextTheme.body1 (14, black) -> bodyLarge.
              // !hasEvent: the original used the *unmodified* textTheme.body1
              // (never overridden) -- titleMedium is the one slot this
              // ThemeData genuinely leaves untouched, so it stands in for
              // "whatever the base dark theme's default text style is."
              style: hasEvent
                  ? theme.textTheme.bodyLarge
                      ?.copyWith(color: theme.colorScheme.onSecondary)
                  : theme.textTheme.titleMedium,
            )),
          ),
        ),
      );

  Widget weekRow(int startDay, int lastDay) {
    List<Widget> days = [];
    for (var i = startDay; i < startDay + DateTime.daysPerWeek; i++) {
      if (i > 0 && i <= lastDay) {
        final hasEvent = events[i] != null;
        days.add(dayMarker(i, hasEvent));
      } else {
        days.add(Expanded(
          child: Container(),
        ));
      }
    }

    return Row(children: days);
  }

  Widget weekdayItem(String text) => Expanded(
          child: Container(
        padding: const EdgeInsets.all(2.0),
        child: Center(
          child: Text(
            text,
            style: theme.textTheme.titleSmall,
          ),
        ),
      ));

  Widget weekdayRow() {
    final dayText = ShortDays.map((day) => (weekdayItem(day))).toList();

    return Row(
      children: dayText,
    );
  }

  @override
  Widget build(BuildContext context) {
    const spacing = 8.0;

    final firstDayOfMonth = DateTime(year, month, 1).weekday;
    final monthOffset = 1 - (firstDayOfMonth % DateTime.daysPerWeek);
    final lastDayOfMonth = daysInMonth(year, month);

    var weekStart = monthOffset;
    List<Widget> weeks = [
      Padding(
        padding: const EdgeInsets.only(top: 4.0),
        child: weekdayRow(),
      ),
      Divider(
        color: theme.dividerColor,
        height: 8.0,
      ),
    ];

    while (weekStart <= lastDayOfMonth) {
      weeks.add(Padding(
        padding: const EdgeInsets.only(bottom: spacing),
        child: weekRow(weekStart, lastDayOfMonth),
      ));
      weekStart += DateTime.daysPerWeek;
    }

    return Container(
      color: theme.canvasColor,
      child: Column(
        children: weeks,
      ),
    );
  }
}
