// import 'package:flutter/material.dart';
// import 'package:zreiq/data/models/travel_model.dart';
// import 'package:zreiq/presentation/widgets/bus.dart';
// import 'package:zreiq/presentation/widgets/travel.dart';
//
// import '../../../constants/my_colors.dart';
// import '../../../constants/strings.dart';
//
// class BookingScreen extends StatelessWidget {
//   BookingScreen({super.key});
//
//   @override
//   Widget build(BuildContext context) {
//     return Directionality(
//       textDirection: TextDirection.rtl,
//       child: Scaffold(
//         body: SafeArea(
//           child: Column(
//             children: [
//               Row(
//                 children: [
//                   Text(
//                     "تاريخ الرحلة: ",
//                     style: const TextStyle(
//                       fontWeight: FontWeight.w200,
//                       fontSize: 16,
//                       fontFamily: "cairo",
//                       color: Colors.white,
//                     ),
//                   ),
//                   Text(
//                     travel.date,
//                     style: const TextStyle(
//                       fontWeight: FontWeight.w200,
//                       fontSize: 16,
//                       fontFamily: "cairo",
//                       color: Colors.white,
//                     ),
//                   ),
//                 ],
//               ),
//               Row(
//                 children: [
//                   const Text(
//                     "الانطلاق",
//                     style: TextStyle(
//                       fontWeight: FontWeight.w200,
//                       fontSize: 14,
//                       fontFamily: "cairo",
//                       color: Colors.black,
//                     ),
//                   ),
//                   Text(
//                     travel.startDate,
//                     style: const TextStyle(
//                       fontWeight: FontWeight.w200,
//                       fontSize: 16,
//                       fontFamily: "cairo",
//                       color: Colors.white,
//                     ),
//                   ),
//                   const Text(
//                     "الوصول",
//                     style: TextStyle(
//                       fontWeight: FontWeight.w200,
//                       fontSize: 14,
//                       fontFamily: "cairo",
//                       color: Colors.black,
//                     ),
//                   ),
//                   Text(
//                     travel.endDate,
//                     style: const TextStyle(
//                       fontWeight: FontWeight.w200,
//                       fontSize: 16,
//                       fontFamily: "cairo",
//                       color: Colors.white,
//                     ),
//                   ),
//                 ],
//               ),
//               Row(
//                 children: [
//                   const Text(
//                     "من مدينة",
//                     style: TextStyle(
//                       fontWeight: FontWeight.w200,
//                       fontSize: 14,
//                       fontFamily: "cairo",
//                       color: MyColors.myYellow,
//                     ),
//                   ),
//                   Text(
//                     travel.from,
//                     style: const TextStyle(
//                       fontWeight: FontWeight.w200,
//                       fontSize: 16,
//                       fontFamily: "cairo",
//                       color: Colors.white,
//                     ),
//                   ),
//                   const Text(
//                     "إلى مدينة",
//                     style: TextStyle(
//                       fontWeight: FontWeight.w200,
//                       fontSize: 14,
//                       fontFamily: "cairo",
//                       color: MyColors.myYellow,
//                     ),
//                   ),
//                   Text(
//                     travel.to,
//                     style: const TextStyle(
//                       fontWeight: FontWeight.w200,
//                       fontSize: 16,
//                       fontFamily: "cairo",
//                       color: Colors.white,
//                     ),
//                   ),
//                 ],
//               ),
//               Row(
//                 children: [
//                   const Text(
//                     "سعر الرحلة",
//                     style: TextStyle(
//                       fontWeight: FontWeight.w200,
//                       fontSize: 14,
//                       fontFamily: "cairo",
//                       color: Colors.black,
//                     ),
//                   ),
//                   Text(
//                     "${travel.price} ل.س",
//                     style: const TextStyle(
//                       fontWeight: FontWeight.w200,
//                       fontSize: 16,
//                       fontFamily: "cairo",
//                       color: Colors.white,
//                     ),
//                   ),
//                 ],
//               ),
//               Row(
//                 children: [
//                   Text(
//                     "نوع الرحلة",
//                     style: const TextStyle(
//                       fontWeight: FontWeight.w200,
//                       fontSize: 14,
//                       fontFamily: "cairo",
//                       color: MyColors.myYellow,
//                     ),
//                   ),
//                   Text(
//                     travel.type,
//                     style: const TextStyle(
//                       fontWeight: FontWeight.w200,
//                       fontSize: 14,
//                       fontFamily: "cairo",
//                       color: MyColors.myYellow,
//                     ),
//                   ),
//                 ],
//               ),
//               Column(
//                 children: [
//                   Row(
//                     children: [
//                       Expanded(
//                           child: Column(
//                         children: [
//                           const Icon(
//                             Icons.directions_bus_rounded,
//                             color: MyColors.myGrey,
//                           ),
//                           SizedBox(height: 4),
//                         ],
//                       )),
//                       Expanded(
//                           child: Column(
//                         children: [
//                           SizedBox(height: 4),
//                           const Text(
//                             "المقاعد المتاحة",
//                             style: TextStyle(
//                               fontWeight: FontWeight.w200,
//                               fontSize: 14,
//                               fontFamily: "cairo",
//                               color: Colors.black,
//                             ),
//                           ),
//                           Text(
//                             travel.availableSeats,
//                             style: const TextStyle(
//                               fontWeight: FontWeight.w200,
//                               fontSize: 14,
//                               fontFamily: "cairo",
//                               color: Colors.white,
//                             ),
//                           ),
//                         ],
//                       )),
//                       Expanded(
//                           child: Column(
//                         children: [
//                           const Icon(
//                             Icons.directions_bus_rounded,
//                             color: MyColors.myGrey,
//                           ),
//                           SizedBox(height: 4),
//                         ],
//                       )),
//                     ],
//                   ),
//                 ],
//               ),
//               Center(child: bus1([1, 22, 3])),
//             ],
//           ),
//         ),
//       ),
//     );
//   }
// }
