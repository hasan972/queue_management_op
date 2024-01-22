import 'dart:async';

import 'package:flutter/material.dart';
import 'package:queue_management_op/services/repositories.dart';
import 'package:queue_management_op/theme/color/my_colors.dart';

class HomePage extends StatefulWidget {
  const HomePage({Key? key}) : super(key: key);

  @override
  State<HomePage> createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
  // final MysqlService _mysqlService = MysqlService();
  Map chkNumList = {};
  Map servedNumList = {};
  @override
  void initState() {
    super.initState();
    getChk();
  }

  getChk() {
    Timer.periodic(const Duration(milliseconds: 500), (timer) async {
      chkNumList = await Repositories().getChk('F');
      servedNumList = await Repositories().getChk('SERVING');
      setState(() {});
    });
    // await Future.(Duration(seconds: 5), () async {

    // });
  }

  //List<String> inProcessNumbers = [];
  List nowServingNumbers = [];
  //List<String> servedNumbers = [];

  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: Scaffold(
        body: Column(
          children: [
            // In Process Section
            Expanded(
              child: Container(
                // height: 350,
                width: double.infinity,
                decoration: BoxDecoration(
                  color: MyColors().mainColor,
                  border: Border.all(color: Colors.black, width: 2.0),
                ),
                child: chkNumList.isEmpty
                    ? const Center(
                        child: CircularProgressIndicator(),
                      )
                    : Column(
                        children: [
                          Padding(
                            padding:
                                const EdgeInsets.symmetric(horizontal: 100),
                            child: Row(
                              mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                              children: [
                                Container(
                                  height: 15,
                                  width: 15,
                                  color: MyColors().white,
                                ),
                                const SizedBox(height: 5),
                                Container(
                                  height: 15,
                                  width: 15,
                                  color: MyColors().white,
                                ),
                                const SizedBox(height: 5),
                                Container(
                                  height: 15,
                                  width: 15,
                                  color: MyColors().white,
                                ),
                              ],
                            ),
                          ),
                          Padding(
                            padding: const EdgeInsets.only(
                                top: 5, bottom: 5, left: 5),
                            child: Row(
                              // mainAxisAlignment: MainAxisAlignment.start,
                              children: [
                                Text(
                                  'IN PROCESS',
                                  style: TextStyle(
                                      color: MyColors().white,
                                      fontSize: 25,
                                      fontWeight: FontWeight.bold),
                                ),
                              ],
                            ),
                          ),
                          Expanded(
                            child: ListView.builder(
                              itemCount: chkNumList['chk_data'].length,
                              itemBuilder: (itemBuilder, index) {
                                return Draggable(
                                  data: chkNumList['chk_data'][index],
                                  feedback: Material(
                                    child: Container(
                                      padding: const EdgeInsets.all(8),
                                      child: Text(
                                        chkNumList['chk_data'][index]['chk_num']
                                            .toString(),
                                        style: TextStyle(
                                          fontSize: 30,
                                          fontWeight: FontWeight.bold,
                                          backgroundColor:
                                              MyColors().white,
                                          color: MyColors().mainColor,
                                        ),
                                      ),
                                    ),
                                  ),
                                  onDragCompleted: () {
                                    Repositories().updateChk(
                                        chkNumList['chk_data'][index]['id'],
                                        'SERVING');
                                    // setState(() {
                                    //   inProcessNumbers.removeAt(index);
                                    // });
                                  },
                                  child: Padding(
                                    padding: const EdgeInsets.symmetric(
                                        horizontal: 120, vertical: 0),
                                    child: Card(
                                      color: MyColors()
                                          .white, // Set the card background color
                                      child: Text(
                                        chkNumList['chk_data'][index]['chk_num']
                                            .toString(),
                                        style: TextStyle(
                                          fontSize: 30,
                                          fontWeight: FontWeight.bold,
                                          color: MyColors().mainColor,
                                        ),
                                        textAlign: TextAlign.center,
                                      ),
                                    ),
                                  ),
                                );
                              },
                            ),
                          ),
                        ],
                      ),
              ),
            ),
            // Now Serving Section
            Expanded(
              child: Container(
                height: 280,
                width: double.infinity,
                decoration: BoxDecoration(
                  border: Border.all(color: Colors.black, width: 2.0),
                ),
                child: Column(
                  children: [
                    Padding(
                      padding: const EdgeInsets.symmetric(horizontal: 100),
                      child: Row(
                        mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                        children: [
                          Container(
                            height: 15,
                            width: 15,
                            color: MyColors().mainColor,
                          ),
                          const SizedBox(height: 5),
                          Container(
                            height: 15,
                            width: 15,
                            color: MyColors().mainColor,
                          ),
                          const SizedBox(height: 5),
                          Container(
                            height: 15,
                            width: 15,
                            color: MyColors().mainColor,
                          ),
                        ],
                      ),
                    ),
                    Padding(
                      padding:
                          const EdgeInsets.only(top: 5, bottom: 5, left: 5),
                      child: Row(
                        mainAxisAlignment: MainAxisAlignment.start,
                        children: [
                          Text(
                            'NOW SERVING',
                            style: TextStyle(
                                color: MyColors().mainColor,
                                fontSize: 25,
                                fontWeight: FontWeight.bold),
                          ),
                        ],
                      ),
                    ),
                    Expanded(
                      child: DragTarget(
                        onAccept: (data) {
                          setState(() {
                            nowServingNumbers.add(data);
                            // print(nowServingNumbers);
                          });
                        },
                        builder: (context, candidateData, rejectedData) {
                          return chkNumList.isEmpty
                    ? const Center(
                        child: CircularProgressIndicator(),
                      )
                    :ListView.builder(
                            // itemCount: nowServingNumbers.length
                            itemCount: servedNumList['chk_data'].length,
                            itemBuilder: (itemBuilder, index) {
                              return InkWell(
                                onDoubleTap: () {
                                  Repositories().updateChk(
                                      servedNumList['chk_data'][index]['id'], 'SERVED');
                                  // nowServingNumbers.removeAt(index);
                                  nowServingNumbers.clear();
                                  setState(() {});
                                },
                                child: Padding(
                                  padding: const EdgeInsets.symmetric(
                                      horizontal: 120, vertical: 0),
                                  child: Card(
                                    color: MyColors()
                                        .mainColor, // Set the card background color
                                    child: Text(
                                      // nowServingNumbers[index]['chk_num']
                                      servedNumList['chk_data'][index]['chk_num']
                                          .toString(),
                                      style: TextStyle(
                                        fontSize: 30,
                                        fontWeight: FontWeight.bold,
                                        color: MyColors().white,
                                      ),
                                      textAlign: TextAlign.center,
                                    ),
                                  ),
                                ),
                              );
                            },
                          );
                        },
                      ),
                    ),
                  ],
                ),
              ),
            ),
            // Served Section
            // Container(
            //   height: 75,
            //   width: double.infinity,
            //   decoration: BoxDecoration(
            //     color: MyColors().mainColor,
            //     border: Border.all(color: Colors.black, width: 2.0),
            //   ),
            //   child: Row(
            //     children: [
            //       Text(
            //         '  SERVED',
            //         style: TextStyle(
            //             color: MyColors().mainColor2,
            //             fontSize: 30,
            //             fontWeight: FontWeight.bold),
            //       ),
            //       Expanded(
            //         child: DragTarget(
            //           onAccept: (data) {
            //             setState(() {
            //               servedNumbers.remove(data.toString());
            //             });

            //             ScaffoldMessenger.of(context).showSnackBar(
            //               SnackBar(
            //                 content: Text(
            //                   'Order complete for "chk-$data"',
            //                   style: TextStyle(
            //                       color: MyColors().mainColor,
            //                       fontSize: 18,
            //                       fontWeight: FontWeight.bold),
            //                   textAlign: TextAlign.center,
            //                 ),
            //                 duration: const Duration(seconds: 1),
            //                 backgroundColor: MyColors().mainColor2,
            //               ),
            //             );
            //           },
            //           builder: (context, candidateData, rejectedData) {
            //             // return Container();
            //             return ListView.builder(
            //               itemCount: servedNumbers.length,
            //               itemBuilder: (itemBuilder, index) {
            //                 return Draggable(
            //                   data: servedNumbers[index],
            //                   feedback: Material(
            //                     child: Container(
            //                       padding: const EdgeInsets.all(8),
            //                       child: Text(
            //                         servedNumbers[index],
            //                         style: const TextStyle(
            //                           fontSize: 30,
            //                           fontWeight: FontWeight.bold,
            //                         ),
            //                       ),
            //                     ),
            //                   ),
            //                   childWhenDragging: Container(),
            //                   onDragCompleted: () {
            //                     setState(() {
            //                       servedNumbers.removeAt(index);
            //                     });
            //                   },
            //                   child: Padding(
            //                     padding: const EdgeInsets.symmetric(
            //                         horizontal: 100, vertical: 0),
            //                     child: Text(
            //                       servedNumbers[index],
            //                       style: const TextStyle(
            //                         fontSize: 30,
            //                         fontWeight: FontWeight.bold,
            //                       ),
            //                     ),
            //                   ),
            //                 );
            //               },
            //             );
            //           },
            //         ),
            //       ),
            //     ],
            //   ),
            // ),
          ],
        ),
      ),
    );
  }
}
