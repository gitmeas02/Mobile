// import 'package:flutter/material.dart';

// void main() {
//   runApp(MyApp());
// }

// class MyApp extends StatelessWidget {
//   @override
//   Widget build(BuildContext context) {
//     return MaterialApp(
//       home: TimetableScreen(),
//     );
//   }
// }

// class TimetableScreen extends StatefulWidget {
//   @override
//   _TimetableScreenState createState() => _TimetableScreenState();
// }

// class _TimetableScreenState extends State<TimetableScreen> {
//   int selectedMonth = 5; // Default to May (as in the image)
//   int? selectedDay; // To track the clicked date
//   final List<Map<String, dynamic>> lessons = [
//     {'day': 14, 'month': 5, 'time': '7-13', 'subject': 'Math (Morning)'},
//     {'day': 15, 'month': 5, 'time': '7-13', 'subject': 'Science (Morning)'},
//     {'day': 16, 'month': 5, 'time': '7-13', 'subject': 'History (Morning)'},
//     {'day': 21, 'month': 5, 'time': '14-20', 'subject': 'English (Afternoon)'},
//     {'day': 28, 'month': 5, 'time': '21-27', 'subject': 'Art (Evening)'},
//     {'day': 1, 'month': 6, 'time': '7-13', 'subject': 'Geography (Morning)'},
//   ];

//   // Thai month names as in the UI
//   final List<String> thaiMonths = [
//     'Jan', 'Feb', 'Mar', 'Apr', 'May', 'Jun',
//     'Jul', 'Aug', 'Sep', 'Oct', 'Nov', 'Dec'
//   ];

//   // Calculate the number of days in the selected month (simplified)
//   int getDaysInMonth(int month, int year) {
//     return DateTime(year, month + 1, 0).day;
//   }

//   // Get the starting day of the month (0 = Sunday, 1 = Monday, etc.)
//   int getStartingDay(int month, int year) {
//     return DateTime(year, month, 1).weekday % 7;
//   }

//   @override
//   Widget build(BuildContext context) {
//     final int year = 2025;
//     final int daysInMonth = getDaysInMonth(selectedMonth, year);
//     final int startingDay = getStartingDay(selectedMonth, year);

//     // Filter lessons by selected month and day (if any)
//     final filteredLessons = lessons.where((lesson) {
//       final matchesMonth = lesson['month'] == selectedMonth;
//       final matchesDay = selectedDay == null || lesson['day'] == selectedDay;
//       return matchesMonth && matchesDay;
//     }).toList();

//     return Scaffold(
//       appBar: AppBar(
//         title: Text('Timetable 2025'),
//       ),
//       body: Column(
//         children: [
//           // Calendar Header
//           Padding(
//             padding: const EdgeInsets.all(8.0),
//             child: Row(
//               mainAxisAlignment: MainAxisAlignment.spaceBetween,
//               children: [
//                 IconButton(icon: Icon(Icons.arrow_back), onPressed: () {}),
//                 Text('Holiday', style: TextStyle(fontSize: 20)),
//                 Text('$year', style: TextStyle(fontSize: 20)),
//               ],
//             ),
//           ),
//           // Month Selection Buttons
//           Container(
//             height: 50,
//             child: ListView.builder(
//               scrollDirection: Axis.horizontal,
//               itemCount: thaiMonths.length,
//               itemBuilder: (context, index) {
//                 return Padding(
//                   padding: const EdgeInsets.symmetric(horizontal: 4.0),
//                   child: ElevatedButton(
//                     style: ElevatedButton.styleFrom(
//                       backgroundColor: selectedMonth == index + 1 ? Colors.blue : Colors.grey[300],
//                     ),
//                     onPressed: () {
//                       setState(() {
//                         selectedMonth = index + 1;
//                         selectedDay = null; // Reset selected day when changing month
//                       });
//                     },
//                     child: Text(thaiMonths[index]),
//                   ),
//                 );
//               },
//             ),
//           ),
//           // Calendar Grid
//           Container(
//             height: 200,
//             child: GridView.count(
//               crossAxisCount: 7,
//               children: [
//                 // Days of the week
//                 ...['S', 'M', 'T', 'W', 'T', 'F', 'S'].map((day) => Center(child: Text(day))),
//                 // Empty spaces before the first day
//                 ...List.generate(startingDay, (index) => Container()),
//                 // Days of the month
//                 ...List.generate(daysInMonth, (index) {
//                   final day = index + 1;
//                   final hasLesson = lessons.any((lesson) =>
//                       lesson['day'] == day && lesson['month'] == selectedMonth);
//                   return GestureDetector(
//                     onTap: () {
//                       setState(() {
//                         selectedDay = day;
//                       });
//                     },
//                     child: Center(
//                       child: Text(
//                         '$day',
//                         style: TextStyle(
//                           color: hasLesson ? Colors.red : Colors.black,
//                           fontWeight: selectedDay == day ? FontWeight.bold : FontWeight.normal,
//                         ),
//                       ),
//                     ),
//                   );
//                 }),
//               ],
//             ),
//           ),
//           // Lessons List
//           Expanded(
//             child: ListView.builder(
//               itemCount: filteredLessons.length,
//               itemBuilder: (context, index) {
//                 final lesson = filteredLessons[index];
//                 return Card(
//                   color: Colors.teal[200],
//                   margin: EdgeInsets.symmetric(vertical: 4, horizontal: 8),
//                   child: ListTile(
//                     title: Text('Day ${lesson['day']}'),
//                     subtitle: Text('${lesson['time']}'),
//                     trailing: Text(lesson['subject']),
//                   ),
//                 );
//               },
//             ),
//           ),
//         ],
//       ),
//     );
//   }
// }