import 'package:flutter/material.dart';

enum Calendar { day, week, month, year }

class SingleChoice extends StatefulWidget {
  const SingleChoice({super.key});

  @override
  State<SingleChoice> createState() => _SingleChoiceState();
}

class _SingleChoiceState extends State<SingleChoice> {
  Calendar calendarView = Calendar.day;

  @override
  Widget build(BuildContext context) {
    return Container(
      margin: EdgeInsets.zero, // Set margin to zero
      child: SegmentedButton<Calendar>(
        style: SegmentedButton.styleFrom(
          backgroundColor: Colors.white,
          foregroundColor: Colors.black,
          selectedForegroundColor: Colors.white,
          selectedBackgroundColor: Colors.black,
          padding: EdgeInsets.all(8.0), // Set padding to zero
        ),
        segments: const <ButtonSegment<Calendar>>[
          ButtonSegment<Calendar>(
            value: Calendar.day,
            label: Text('Day'),
            icon: Icon(Icons.calendar_view_day),
          ),
          ButtonSegment<Calendar>(
            value: Calendar.week,
            label: Text('Week'),
            icon: Icon(Icons.calendar_view_week),
          ),
          ButtonSegment<Calendar>(
            value: Calendar.month,
            label: Text('Month'),
            icon: Icon(Icons.calendar_view_month),
          ),
          ButtonSegment<Calendar>(
            value: Calendar.year,
            label: Text('Year'),
            icon: Icon(Icons.calendar_today),
          ),
        ],
        selected: <Calendar>{calendarView},
        onSelectionChanged: (Set<Calendar> newSelection) {
          setState(() {
            calendarView = newSelection.first;
          });
        },
      ),
    );
  }
}
