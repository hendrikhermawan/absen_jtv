// import 'package:flutter/material.dart';
// import 'package:provider/provider.dart';
// import 'auth_service.dart';
// import 'attendance/attendance_service.dart';
// import 'attendance/attendance_model.dart';

// class HomeScreen extends StatelessWidget {
//   const HomeScreen({super.key});

//   @override
//   Widget build(BuildContext context) {
//     final authService = Provider.of<AuthService>(context);
//     final attendanceService = Provider.of<AttendanceService>(context);

//     return Scaffold(
//       appBar: AppBar(
//         title: const Text('Attendance App'),
//         actions: [
//           IconButton(
//             icon: const Icon(Icons.logout),
//             onPressed: () {
//               authService.signOut();
//             },
//           ),
//         ],
//       ),
//       body: Column(
//         children: [
//           Expanded(
//             child: StreamBuilder<List<Attendance>>(
//               stream: attendanceService.attendances,
//               builder: (context, snapshot) {
//                 if (snapshot.connectionState == ConnectionState.waiting) {
//                   return const Center(child: CircularProgressIndicator());
//                 }
//                 final attendances = snapshot.data ?? [];
//                 return ListView.builder(
//                   itemCount: attendances.length,
//                   itemBuilder: (context, index) {
//                     final attendance = attendances[index];
//                     return ListTile(
//                       title: Text('Time In: ${attendance.timeIn.toDate()}'),
//                       subtitle: attendance.timeOut != null
//                           ? Text('Time Out: ${attendance.timeOut!.toDate()}')
//                           : ElevatedButton(
//                               onPressed: () {
//                                 attendanceService.updateTimeOut(attendance.id);
//                               },
//                               child: const Text('Update Time Out'),
//                             ),
//                       trailing: IconButton(
//                         icon: const Icon(Icons.delete),
//                         onPressed: () {
//                           attendanceService.deleteAttendance(attendance.id);
//                         },
//                       ),
//                     );
//                   },
//                 );
//               },
//             ),
//           ),
//           Padding(
//             padding: const EdgeInsets.all(16.0),
//             child: ElevatedButton(
//               onPressed: () {
//                 attendanceService.addAttendance();
//               },
//               child: const Text('Record Attendance'),
//             ),
//           ),
//         ],
//       ),
//     );
//   }
// }
