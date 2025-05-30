// import 'package:flutter/material.dart';
// import 'package:intl/intl.dart';

// class KhmerHoliday {
//   final DateTime date;
//   final String event;

//   KhmerHoliday({required this.date, required this.event});
// }

// class KhmerCalendarPage extends StatelessWidget {
//   const KhmerCalendarPage({super.key});

//   @override
//   Widget build(BuildContext context) {
//     return Scaffold(
//       appBar: AppBar(
//         title: const Text('Khmer Calendar'),
//         backgroundColor: Colors.transparent,
//         foregroundColor: Colors.white,
//         elevation: 0,
//         flexibleSpace: Container(
//           decoration: BoxDecoration(
//             gradient: LinearGradient(
//               colors: [Colors.indigo[700]!, Colors.indigo[400]!],
//               begin: Alignment.topLeft,
//               end: Alignment.bottomRight,
//             ),
//           ),
//         ),
//       ),
//       body: Container(
//         decoration: BoxDecoration(
//           gradient: LinearGradient(
//             colors: [Colors.indigo[50]!, Colors.white],
//             begin: Alignment.topCenter,
//             end: Alignment.bottomCenter,
//           ),
//         ),
//         child: SafeArea(
//           child: SingleChildScrollView(
//             padding: const EdgeInsets.all(20),
//             child: Card(
//               elevation: 6,
//               shape: RoundedRectangleBorder(
//                 borderRadius: BorderRadius.circular(20),
//               ),
//               child: Container(
//                 decoration: BoxDecoration(
//                   color: Colors.white,
//                   borderRadius: BorderRadius.circular(20),
//                   boxShadow: [
//                     BoxShadow(
//                       color: Colors.indigo.withOpacity(0.1),
//                       blurRadius: 10,
//                       offset: const Offset(0, 4),
//                     ),
//                   ],
//                 ),
//                 child: const Padding(
//                   padding: EdgeInsets.all(20),
//                   child: KhmerCalendar(),
//                 ),
//               ),
//             ),
//           ),
//         ),
//       ),
//     );
//   }
// }

// class KhmerCalendar extends StatefulWidget {
//   const KhmerCalendar({super.key});

//   @override
//   State<KhmerCalendar> createState() => _KhmerCalendarState();
// }

// class _KhmerCalendarState extends State<KhmerCalendar> {
//   DateTime _focusedDate = DateTime.now();
//   DateTime? _selectedDate;

//   final List<KhmerHoliday> khmerHolidays = [
//     KhmerHoliday(date: DateTime(2025, 4, 14), event: 'ព្រះរាជពិធីបុណ្យចូលឆ្នាំថ្មី'),
//     KhmerHoliday(date: DateTime(2025, 4, 14), event: 'ព្រះរាជពិធីបុណ្យចូលឆ្នាំថ្មី'),
//     KhmerHoliday(date: DateTime(2025, 4, 15), event: 'បុណ្យចូលឆ្នាំថ្មី (ថ្ងៃទីពីរ)'),
//     KhmerHoliday(date: DateTime(2025, 4, 16), event: 'បុណ្យចូលឆ្នាំថ្មី (ថ្ងៃទីបី)'),
//     KhmerHoliday(date: DateTime(2025, 5, 1), event: 'ថ្ងៃពលកម្មអន្ដរជាតិ'),
//     KhmerHoliday(date: DateTime(2025, 5, 14), event: 'ពិធីបុណ្យវិសាខបូជា'),
//   ];

//   void _goToPreviousMonth() {
//     setState(() {
//       _focusedDate = DateTime(_focusedDate.year, _focusedDate.month - 1, 1);
//       _selectedDate = null;
//     });
//   }

//   void _goToNextMonth() {
//     setState(() {
//       _focusedDate = DateTime(_focusedDate.year, _focusedDate.month + 1, 1);
//       _selectedDate = null;
//     });
//   }

//   List<Widget> _buildDayHeaders() {
//     const days = ['Sun', 'Mon', 'Tue', 'Wed', 'Thu', 'Fri', 'Sat'];
//     return days
//         .map((day) => Expanded(
//               child: Center(
//                 child: Text(
//                   day,
//                   style: TextStyle(
//                     fontWeight: FontWeight.w600,
//                     color: Colors.indigo[800],
//                     fontSize: 16,
//                   ),
//                 ),
//               ),
//             ))
//         .toList();
//   }

//   List<Widget> _buildDateGrid() {
//     final firstDayOfMonth = DateTime(_focusedDate.year, _focusedDate.month, 1);
//     final daysInMonth = DateTime(_focusedDate.year, _focusedDate.month + 1, 0).day;
//     final startWeekday = firstDayOfMonth.weekday % 7;

//     List<Widget> rows = [];
//     List<Widget> weekRow = [];

//     for (int i = 0; i < startWeekday; i++) {
//       weekRow.add(const Expanded(child: SizedBox()));
//     }

//     for (int day = 1; day <= daysInMonth; day++) {
//       final date = DateTime(_focusedDate.year, _focusedDate.month, day);
//       final isToday = DateTime.now().day == day &&
//           DateTime.now().month == _focusedDate.month &&
//           DateTime.now().year == _focusedDate.year;
//       final isSelected = _selectedDate != null &&
//           _selectedDate!.day == day &&
//           _selectedDate!.month == _focusedDate.month &&
//           _selectedDate!.year == _focusedDate.year;
//       final hasEvent = khmerHolidays.any((h) =>
//           h.date.day == day &&
//           h.date.month == _focusedDate.month &&
//           h.date.year == _focusedDate.year);

//       weekRow.add(
//         Expanded(
//           child: GestureDetector(
//             onTap: () {
//               setState(() {
//                 _selectedDate = date;
//               });

//               final holiday = khmerHolidays.firstWhere(
//                 (h) =>
//                     h.date.day == date.day &&
//                     h.date.month == date.month &&
//                     h.date.year == date.year,
//                 orElse: () => KhmerHoliday(date: date, event: ''),
//               );

//               if (holiday.event.isNotEmpty) {
//                 ScaffoldMessenger.of(context).showSnackBar(
//                   SnackBar(
//                     content: Text(
//                       'Holiday: ${holiday.event}',
//                       style: const TextStyle(color: Colors.white),
//                     ),
//                     backgroundColor: Colors.indigo[700],
//                     behavior: SnackBarBehavior.floating,
//                     shape: RoundedRectangleBorder(
//                       borderRadius: BorderRadius.circular(10),
//                     ),
//                   ),
//                 );
//               }
//             },
//             child: Container(
//               margin: const EdgeInsets.all(4),
//               height: 48,
//               decoration: BoxDecoration(
//                 color: isSelected
//                     ? Colors.indigo[400]
//                     : isToday
//                         ? Colors.indigo[100]
//                         : Colors.transparent,
//                 borderRadius: BorderRadius.circular(12),
//                 border: hasEvent
//                     ? Border.all(color: Colors.redAccent[400]!, width: 2)
//                     : Border.all(color: Colors.grey[300]!, width: 0.5),
//                 boxShadow: isSelected
//                     ? [
//                         BoxShadow(
//                           color: Colors.indigo.withOpacity(0.3),
//                           blurRadius: 4,
//                           offset: const Offset(0, 2),
//                         ),
//                       ]
//                     : [],
//               ),
//               alignment: Alignment.center,
//               child: Text(
//                 '$day',
//                 style: TextStyle(
//                   color: isSelected ? Colors.white : Colors.indigo[800],
//                   fontWeight: isSelected ? FontWeight.bold : FontWeight.w500,
//                   fontSize: 16,
//                 ),
//               ),
//             ),
//           ),
//         ),
//       );

//       if ((startWeekday + day) % 7 == 0 || day == daysInMonth) {
//         while (weekRow.length < 7) {
//           weekRow.add(const Expanded(child: SizedBox()));
//         }
//         rows.add(Row(children: weekRow));
//         weekRow = [];
//       }
//     }

//     return rows;
//   }

//   List<KhmerHoliday> get holidaysForSelectedDate {
//     if (_selectedDate == null) return [];
//     return khmerHolidays
//         .where((h) =>
//             h.date.day == _selectedDate!.day &&
//             h.date.month == _selectedDate!.month &&
//             h.date.year == _selectedDate!.year)
//         .toList();
//   }

//   @override
//   Widget build(BuildContext context) {
//     final monthYear = DateFormat.yMMMM().format(_focusedDate);

//     return Column(
//       mainAxisSize: MainAxisSize.min,
//       children: [
//         Container(
//           decoration: BoxDecoration(
//             color: Colors.indigo[50],
//             borderRadius: BorderRadius.circular(12),
//           ),
//           padding: const EdgeInsets.symmetric(vertical: 12, horizontal: 16),
//           child: Row(
//             children: [
//               IconButton(
//                 icon: Icon(Icons.chevron_left, color: Colors.indigo[700]),
//                 onPressed: _goToPreviousMonth,
//               ),
//               Expanded(
//                 child: Center(
//                   child: Text(
//                     monthYear,
//                     style: TextStyle(
//                       fontSize: 22,
//                       fontWeight: FontWeight.bold,
//                       color: Colors.indigo[800],
//                     ),
//                   ),
//                 ),
//               ),
//               IconButton(
//                 icon: Icon(Icons.chevron_right, color: Colors.indigo[700]),
//                 onPressed: _goToNextMonth,
//               ),
//             ],
//           ),
//         ),
//         const SizedBox(height: 12),
//         Row(children: _buildDayHeaders()),
//         const SizedBox(height: 12),
//         ..._buildDateGrid(),
//         const Divider(color: Colors.grey, height: 32),
//         if (_selectedDate != null) ...[
//           Padding(
//             padding: const EdgeInsets.symmetric(vertical: 12),
//             child: Text(
//               'Holidays on ${DateFormat.yMMMMd().format(_selectedDate!)}',
//               style: TextStyle(
//                 fontWeight: FontWeight.bold,
//                 fontSize: 18,
//                 color: Colors.indigo[800],
//               ),
//             ),
//           ),
//           SizedBox(
//             height: 120,
//             child: holidaysForSelectedDate.isEmpty
//                 ? Center(
//                     child: Text(
//                       "No holiday on this date.",
//                       style: TextStyle(color: Colors.grey[600], fontSize: 16),
//                     ),
//                   )
//                 : ListView.builder(
//                     itemCount: holidaysForSelectedDate.length,
//                     itemBuilder: (context, index) {
//                       final holiday = holidaysForSelectedDate[index];
//                       return ListTile(
//                         leading: Icon(Icons.event, color: Colors.redAccent[400]),
//                         title: Text(
//                           holiday.event,
//                           style: TextStyle(
//                             color: Colors.indigo[800],
//                             fontWeight: FontWeight.w500,
//                           ),
//                         ),
//                         subtitle: Text(
//                           DateFormat.yMMMMd().format(holiday.date),
//                           style: TextStyle(color: Colors.grey[600]),
//                         ),
//                       );
//                     },
//                   ),
//           ),
//         ],
//       ],
//     );
//   }
// }