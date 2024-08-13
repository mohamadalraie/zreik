import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:zreiq/constants/my_colors.dart';

class Buses extends StatefulWidget {
  Buses(
      {super.key,
      required this.busChairsCount,
      required this.unavailableChairs});
  final int busChairsCount;
  final List<int> unavailableChairs;

  late int selectedChair;

  @override
  State<Buses> createState() => _BusesState();
}

class _BusesState extends State<Buses> {
  @override
  Widget build(BuildContext context) {
    return Card(
      color: MyColors.myGrey,
      child: widget.busChairsCount == 28
          ? bus28(widget.unavailableChairs)
          : bus50(widget.unavailableChairs),
    );
  }

  Widget busChair(
      {required bool isReserved,
      required int chairNumber,
      bool isSelected = false}) {
    return Padding(
      padding: const EdgeInsets.symmetric(vertical: 4.0, horizontal: 4.0),
      child: InkWell(
        child: SizedBox(
          width: 26,
          height: 34,
          child: Stack(alignment: Alignment.center, children: [
            Icon(CupertinoIcons.rectangle,
                size: 26, color: isReserved ? Colors.black : MyColors.myYellow),
            Icon(CupertinoIcons.app_fill,
                size: 30,
                color: isReserved
                    ? Colors.red
                    : isSelected
                        ? Colors.green
                        : Colors.grey),
            Positioned(
              top: 19,
              child: Icon(
                CupertinoIcons.capsule_fill,
                color: isReserved ? Colors.red : MyColors.myYellow,
                size: 16,
              ),
            ),
            Positioned(
              bottom: 12,
              child: Text(
                "$chairNumber",
                style: const TextStyle(color: Colors.white, fontSize: 12),
              ),
            ),
          ]),
        ),
        onTap: () {
          print(chairNumber);
          widget.selectedChair = chairNumber;
          isSelected = true;
          setState(() {});
        },
      ),
    );
  }

  Widget bus28(
    List<int> reservedChairs,
  ) {
    return Container(
      padding: const EdgeInsets.all(4),
      decoration: BoxDecoration(
          borderRadius: BorderRadius.circular(5),
          border: Border.all(color: MyColors.myYellow)),
      child: Container(
          decoration: BoxDecoration(
            color: MyColors.myLightGrey,
            borderRadius: BorderRadius.circular(5),
          ),
          height: 450,
          width: 136,
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Row(
                children: [
                  Container(
                    color: Colors.black,
                    height: 30,
                    width: 4,
                  ),
                  const Spacer(),
                  const Column(
                    children: [
                      Padding(
                        padding: EdgeInsets.only(left: 4.0),
                        child: Icon(CupertinoIcons.smallcircle_fill_circle),
                      ),
                      Padding(
                        padding: EdgeInsets.only(left: 4.0, bottom: 6.0),
                        child: SizedBox(
                          width: 26,
                          height: 34,
                          child: Stack(alignment: Alignment.center, children: [
                            Icon(CupertinoIcons.rectangle,
                                size: 26, color: Colors.black),
                            Icon(CupertinoIcons.app_fill,
                                size: 30, color: Colors.black),
                            Positioned(
                              top: 22,
                              child: Icon(
                                CupertinoIcons.rectangle_fill,
                                color: Colors.grey,
                                size: 14,
                              ),
                            ),
                          ]),
                        ),
                      ),
                    ],
                  ),
                ],
              ),
              Row(
                children: [
                  Column(
                    children: [
                      busChair(
                        isReserved: reservedChairs.contains(1),
                        chairNumber: 1,
                      ),
                      busChair(
                          isReserved: reservedChairs.contains(2),
                          chairNumber: 2),
                      busChair(
                          isReserved: reservedChairs.contains(3),
                          chairNumber: 3),
                      busChair(
                          isReserved: reservedChairs.contains(4),
                          chairNumber: 4),
                      busChair(
                          isReserved: reservedChairs.contains(5),
                          chairNumber: 5),
                      busChair(
                          isReserved: reservedChairs.contains(6),
                          chairNumber: 6),
                      busChair(
                          isReserved: reservedChairs.contains(7),
                          chairNumber: 7),
                      busChair(
                          isReserved: reservedChairs.contains(8),
                          chairNumber: 8),
                    ],
                  ),
                  const Spacer(),
                  Column(
                    children: [
                      busChair(
                          isReserved: reservedChairs.contains(27),
                          chairNumber: 27),
                      busChair(
                          isReserved: reservedChairs.contains(25),
                          chairNumber: 25),
                      busChair(
                          isReserved: reservedChairs.contains(23),
                          chairNumber: 23),
                      busChair(
                          isReserved: reservedChairs.contains(21),
                          chairNumber: 21),
                      busChair(
                          isReserved: reservedChairs.contains(19),
                          chairNumber: 19),
                      busChair(
                          isReserved: reservedChairs.contains(17),
                          chairNumber: 17),
                      busChair(
                          isReserved: reservedChairs.contains(15),
                          chairNumber: 15),
                      busChair(
                          isReserved: reservedChairs.contains(13),
                          chairNumber: 13),
                    ],
                  ),
                  Column(
                    children: [
                      busChair(
                          isReserved: reservedChairs.contains(28),
                          chairNumber: 28),
                      busChair(
                          isReserved: reservedChairs.contains(26),
                          chairNumber: 26),
                      busChair(
                          isReserved: reservedChairs.contains(24),
                          chairNumber: 24),
                      busChair(
                          isReserved: reservedChairs.contains(22),
                          chairNumber: 22),
                      busChair(
                          isReserved: reservedChairs.contains(20),
                          chairNumber: 20),
                      busChair(
                          isReserved: reservedChairs.contains(18),
                          chairNumber: 18),
                      busChair(
                          isReserved: reservedChairs.contains(16),
                          chairNumber: 16),
                      busChair(
                          isReserved: reservedChairs.contains(14),
                          chairNumber: 14),
                    ],
                  ),
                ],
              ),
              Row(
                children: [
                  busChair(
                      isReserved: reservedChairs.contains(9), chairNumber: 9),
                  busChair(
                      isReserved: reservedChairs.contains(10), chairNumber: 10),
                  busChair(
                      isReserved: reservedChairs.contains(11), chairNumber: 11),
                  busChair(
                    isReserved: reservedChairs.contains(12),
                    chairNumber: 12,
                  ),
                ],
              ),
            ],
          )),
    );
  }

  Widget bus50(
    List<int> reservedChairs,
  ) {
    return Container(
        decoration: BoxDecoration(
            color: MyColors.myLightGrey,
            borderRadius: BorderRadius.circular(5),
            border: BorderDirectional()),
        height: 450,
        width: 136,
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Row(
              children: [
                const Column(
                  children: [
                    Padding(
                      padding: EdgeInsets.only(right: 4.0),
                      child: Icon(CupertinoIcons.smallcircle_fill_circle),
                    ),
                    Padding(
                      padding: EdgeInsets.only(right: 4.0, bottom: 6.0),
                      child: SizedBox(
                        width: 26,
                        height: 34,
                        child: Stack(alignment: Alignment.center, children: [
                          Icon(CupertinoIcons.rectangle,
                              size: 26, color: Colors.black),
                          Icon(CupertinoIcons.app_fill,
                              size: 30, color: Colors.black),
                          Positioned(
                            top: 22,
                            child: Icon(
                              CupertinoIcons.rectangle_fill,
                              color: Colors.grey,
                              size: 14,
                            ),
                          ),
                        ]),
                      ),
                    ),
                  ],
                ),
                const Spacer(),
                Container(
                  color: Colors.black,
                  height: 28,
                  width: 4,
                )
              ],
            ),
            Row(
              children: [
                Column(
                  children: [
                    busChair(
                      isReserved: reservedChairs.contains(1),
                      chairNumber: 1,
                    ),
                    busChair(
                        isReserved: reservedChairs.contains(2), chairNumber: 2),
                    busChair(
                        isReserved: reservedChairs.contains(3), chairNumber: 3),
                    busChair(
                        isReserved: reservedChairs.contains(4), chairNumber: 4),
                    busChair(
                        isReserved: reservedChairs.contains(5), chairNumber: 5),
                    busChair(
                        isReserved: reservedChairs.contains(6), chairNumber: 6),
                    busChair(
                        isReserved: reservedChairs.contains(7), chairNumber: 7),
                    busChair(
                        isReserved: reservedChairs.contains(8), chairNumber: 8),
                  ],
                ),
                const Spacer(),
                Column(
                  children: [
                    busChair(
                        isReserved: reservedChairs.contains(27),
                        chairNumber: 27),
                    busChair(
                        isReserved: reservedChairs.contains(25),
                        chairNumber: 25),
                    busChair(
                        isReserved: reservedChairs.contains(23),
                        chairNumber: 23),
                    busChair(
                        isReserved: reservedChairs.contains(21),
                        chairNumber: 21),
                    busChair(
                        isReserved: reservedChairs.contains(19),
                        chairNumber: 19),
                    busChair(
                        isReserved: reservedChairs.contains(17),
                        chairNumber: 17),
                    busChair(
                        isReserved: reservedChairs.contains(15),
                        chairNumber: 15),
                    busChair(
                        isReserved: reservedChairs.contains(13),
                        chairNumber: 13),
                  ],
                ),
                Column(
                  children: [
                    busChair(
                        isReserved: reservedChairs.contains(28),
                        chairNumber: 28),
                    busChair(
                        isReserved: reservedChairs.contains(26),
                        chairNumber: 26),
                    busChair(
                        isReserved: reservedChairs.contains(24),
                        chairNumber: 24),
                    busChair(
                        isReserved: reservedChairs.contains(22),
                        chairNumber: 22),
                    busChair(
                        isReserved: reservedChairs.contains(20),
                        chairNumber: 20),
                    busChair(
                        isReserved: reservedChairs.contains(18),
                        chairNumber: 18),
                    busChair(
                        isReserved: reservedChairs.contains(16),
                        chairNumber: 16),
                    busChair(
                        isReserved: reservedChairs.contains(14),
                        chairNumber: 14),
                  ],
                ),
              ],
            ),
            Row(
              children: [
                busChair(
                    isReserved: reservedChairs.contains(9), chairNumber: 9),
                busChair(
                    isReserved: reservedChairs.contains(10), chairNumber: 10),
                busChair(
                    isReserved: reservedChairs.contains(11), chairNumber: 11),
                busChair(
                    isReserved: reservedChairs.contains(12), chairNumber: 12),
              ],
            ),
          ],
        ));
  }
}

//
// class Bus {
//   int selectedChair = 0;
//
//   Widget busChair(
//       {required bool isReserved,
//       required int chairNumber,
//       bool isSelected = false}) {
//     return Padding(
//       padding: const EdgeInsets.symmetric(vertical: 4.0, horizontal: 4.0),
//       child: InkWell(
//         child: Container(
//           width: 26,
//           height: 34,
//           child: Stack(alignment: Alignment.center, children: [
//             Icon(CupertinoIcons.rectangle,
//                 size: 26, color: isReserved ? Colors.black : MyColors.myYellow),
//             Icon(CupertinoIcons.app_fill,
//                 size: 30,
//                 color: isReserved
//                     ? Colors.red
//                     : isSelected
//                         ? Colors.green
//                         : Colors.grey),
//             Positioned(
//               top: 19,
//               child: Icon(
//                 CupertinoIcons.capsule_fill,
//                 color: isReserved ? Colors.red : MyColors.myYellow,
//                 size: 16,
//               ),
//             ),
//             Positioned(
//               bottom: 12,
//               child: Text(
//                 "$chairNumber",
//                 style: const TextStyle(color: Colors.white, fontSize: 12),
//               ),
//             ),
//           ]),
//         ),
//         onTap: () {
//           print(chairNumber);
//           selectedChair = chairNumber;
//           isSelected = !isSelected;
//         },
//       ),
//     );
//   }
//
//   Widget bus28(
//     List<int> reservedChairs,
//   ) {
//     return Container(
//       padding: const EdgeInsets.all(4),
//       decoration: BoxDecoration(
//           borderRadius: BorderRadius.circular(5),
//           border: Border.all(color: MyColors.myYellow)),
//       child: Container(
//           decoration: BoxDecoration(
//             color: MyColors.myLightGrey,
//             borderRadius: BorderRadius.circular(5),
//           ),
//           height: 450,
//           width: 136,
//           child: Column(
//             crossAxisAlignment: CrossAxisAlignment.start,
//             children: [
//               Row(
//                 children: [
//                   Container(
//                     color: Colors.black,
//                     height: 30,
//                     width: 4,
//                   ),
//                   const Spacer(),
//                   const Column(
//                     children: [
//                       Padding(
//                         padding: EdgeInsets.only(left: 4.0),
//                         child: Icon(CupertinoIcons.smallcircle_fill_circle),
//                       ),
//                       Padding(
//                         padding: EdgeInsets.only(left: 4.0, bottom: 6.0),
//                         child: SizedBox(
//                           width: 26,
//                           height: 34,
//                           child: Stack(alignment: Alignment.center, children: [
//                             Icon(CupertinoIcons.rectangle,
//                                 size: 26, color: Colors.black),
//                             Icon(CupertinoIcons.app_fill,
//                                 size: 30, color: Colors.black),
//                             Positioned(
//                               top: 22,
//                               child: Icon(
//                                 CupertinoIcons.rectangle_fill,
//                                 color: Colors.grey,
//                                 size: 14,
//                               ),
//                             ),
//                           ]),
//                         ),
//                       ),
//                     ],
//                   ),
//                 ],
//               ),
//               Row(
//                 children: [
//                   Column(
//                     children: [
//                       busChair(
//                         isReserved: reservedChairs.contains(1),
//                         chairNumber: 1,
//                       ),
//                       busChair(
//                           isReserved: reservedChairs.contains(2),
//                           chairNumber: 2),
//                       busChair(
//                           isReserved: reservedChairs.contains(3),
//                           chairNumber: 3),
//                       busChair(
//                           isReserved: reservedChairs.contains(4),
//                           chairNumber: 4),
//                       busChair(
//                           isReserved: reservedChairs.contains(5),
//                           chairNumber: 5),
//                       busChair(isReserved: reservedChairs.contains(6), chairNumber: 6),
//                       busChair(
//                           isReserved: reservedChairs.contains(7),
//                           chairNumber: 7),
//                       busChair(
//                           isReserved: reservedChairs.contains(8),
//                           chairNumber: 8),
//                     ],
//                   ),
//                   const Spacer(),
//                   Column(
//                     children: [
//                       busChair(
//                           isReserved: reservedChairs.contains(27),
//                           chairNumber: 27),
//                       busChair(
//                           isReserved: reservedChairs.contains(25),
//                           chairNumber: 25),
//                       busChair(
//                           isReserved: reservedChairs.contains(23),
//                           chairNumber: 23),
//                       busChair(
//                           isReserved: reservedChairs.contains(21),
//                           chairNumber: 21),
//                       busChair(
//                           isReserved: reservedChairs.contains(19),
//                           chairNumber: 19),
//                       busChair(isReserved: reservedChairs.contains(17), chairNumber: 17),
//                       busChair(
//                           isReserved: reservedChairs.contains(15),
//                           chairNumber: 15),
//                       busChair(
//                           isReserved: reservedChairs.contains(13),
//                           chairNumber: 13),
//                     ],
//                   ),
//                   Column(
//                     children: [
//                       busChair(isReserved: reservedChairs.contains(28), chairNumber: 28),
//                       busChair(
//                           isReserved: reservedChairs.contains(26),
//                           chairNumber: 26),
//                       busChair(
//                           isReserved: reservedChairs.contains(24),
//                           chairNumber: 24),
//                       busChair(isReserved: reservedChairs.contains(22), chairNumber: 22),
//                       busChair(
//                           isReserved: reservedChairs.contains(20),
//                           chairNumber: 20),
//                       busChair(isReserved: reservedChairs.contains(18), chairNumber: 18),
//                       busChair(
//                           isReserved: reservedChairs.contains(16),
//                           chairNumber: 16),
//                       busChair(
//                           isReserved: reservedChairs.contains(14),
//                           chairNumber: 14),
//                     ],
//                   ),
//                 ],
//               ),
//               Row(
//                 children: [
//                   busChair(isReserved: reservedChairs.contains(9), chairNumber: 9),
//                   busChair(
//                       isReserved: reservedChairs.contains(10), chairNumber: 10),
//                   busChair(
//                       isReserved: reservedChairs.contains(11), chairNumber: 11),
//                   busChair(
//                       isReserved: reservedChairs.contains(12),
//                       chairNumber: 12,
//                       ),
//                 ],
//               ),
//             ],
//           )),
//     );
//   }
//
//   Widget bus50(
//     List<int> reservedChairs,
//   ) {
//     return Container(
//         decoration: BoxDecoration(
//             color: MyColors.myLightGrey,
//             borderRadius: BorderRadius.circular(5),
//             border: BorderDirectional()),
//         height: 450,
//         width: 136,
//         child: Column(
//           crossAxisAlignment: CrossAxisAlignment.start,
//           children: [
//             Row(
//               children: [
//                 const Column(
//                   children: [
//                     Padding(
//                       padding: EdgeInsets.only(right: 4.0),
//                       child: Icon(CupertinoIcons.smallcircle_fill_circle),
//                     ),
//                     Padding(
//                       padding: EdgeInsets.only(right: 4.0, bottom: 6.0),
//                       child: SizedBox(
//                         width: 26,
//                         height: 34,
//                         child: Stack(alignment: Alignment.center, children: [
//                           Icon(CupertinoIcons.rectangle,
//                               size: 26, color: Colors.black),
//                           Icon(CupertinoIcons.app_fill,
//                               size: 30, color: Colors.black),
//                           Positioned(
//                             top: 22,
//                             child: Icon(
//                               CupertinoIcons.rectangle_fill,
//                               color: Colors.grey,
//                               size: 14,
//                             ),
//                           ),
//                         ]),
//                       ),
//                     ),
//                   ],
//                 ),
//                 const Spacer(),
//                 Container(
//                   color: Colors.black,
//                   height: 28,
//                   width: 4,
//                 )
//               ],
//             ),
//             Row(
//               children: [
//                 Column(
//                   children: [
//                     busChair(
//                       isReserved: reservedChairs.contains(1),
//                       chairNumber: 1,
//                     ),
//                     busChair(
//                         isReserved: reservedChairs.contains(2), chairNumber: 2),
//                     busChair(
//                         isReserved: reservedChairs.contains(3), chairNumber: 3),
//                     busChair(
//                         isReserved: reservedChairs.contains(4), chairNumber: 4),
//                     busChair(
//                         isReserved: reservedChairs.contains(5), chairNumber: 5),
//                     busChair(
//                         isReserved: reservedChairs.contains(6), chairNumber: 6),
//                     busChair(
//                         isReserved: reservedChairs.contains(7), chairNumber: 7),
//                     busChair(
//                         isReserved: reservedChairs.contains(8), chairNumber: 8),
//                   ],
//                 ),
//                 const Spacer(),
//                 Column(
//                   children: [
//                     busChair(
//                         isReserved: reservedChairs.contains(27),
//                         chairNumber: 27),
//                     busChair(
//                         isReserved: reservedChairs.contains(25),
//                         chairNumber: 25),
//                     busChair(
//                         isReserved: reservedChairs.contains(23),
//                         chairNumber: 23),
//                     busChair(
//                         isReserved: reservedChairs.contains(21),
//                         chairNumber: 21),
//                     busChair(
//                         isReserved: reservedChairs.contains(19),
//                         chairNumber: 19),
//                     busChair(
//                         isReserved: reservedChairs.contains(17),
//                         chairNumber: 17),
//                     busChair(
//                         isReserved: reservedChairs.contains(15),
//                         chairNumber: 15),
//                     busChair(
//                         isReserved: reservedChairs.contains(13),
//                         chairNumber: 13),
//                   ],
//                 ),
//                 Column(
//                   children: [
//                     busChair(
//                         isReserved: reservedChairs.contains(28),
//                         chairNumber: 28),
//                     busChair(
//                         isReserved: reservedChairs.contains(26),
//                         chairNumber: 26),
//                     busChair(
//                         isReserved: reservedChairs.contains(24),
//                         chairNumber: 24),
//                     busChair(
//                         isReserved: reservedChairs.contains(22),
//                         chairNumber: 22),
//                     busChair(
//                         isReserved: reservedChairs.contains(20),
//                         chairNumber: 20),
//                     busChair(
//                         isReserved: reservedChairs.contains(18),
//                         chairNumber: 18),
//                     busChair(
//                         isReserved: reservedChairs.contains(16),
//                         chairNumber: 16),
//                     busChair(
//                         isReserved: reservedChairs.contains(14),
//                         chairNumber: 14),
//                   ],
//                 ),
//               ],
//             ),
//             Row(
//               children: [
//                 busChair(
//                     isReserved: reservedChairs.contains(9), chairNumber: 9),
//                 busChair(
//                     isReserved: reservedChairs.contains(10), chairNumber: 10),
//                 busChair(
//                     isReserved: reservedChairs.contains(11), chairNumber: 11),
//                 busChair(
//                     isReserved: reservedChairs.contains(12), chairNumber: 12),
//               ],
//             ),
//           ],
//         ));
//   }
// }
