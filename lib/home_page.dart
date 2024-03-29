import 'dart:async';

import 'package:flutter/material.dart';
import 'package:kfc_queue_management_op/services/repositories.dart';
import 'package:kfc_queue_management_op/theme/color/my_colors.dart';

class HomePage extends StatefulWidget {
  const HomePage({Key? key}) : super(key: key);

  @override
  State<HomePage> createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
  // final MysqlService _mysqlService = MysqlService();
  bool isCrossVisible = false;
  Map chkNumList = {};
  Map servedNumList = {};
  List servedNumListCopy = [];
  Map<int, bool> revarseList = {};
  List nowServingNumbers = [];

  @override
  void initState() {
    super.initState();
    getChk();
  }

  getChk() {
    Timer.periodic(
      const Duration(milliseconds: 500),
      (timer) async {
        chkNumList = await Repositories().getChk('F');
        servedNumList = await Repositories().getChk('SERVING');
        servedNumListCopy = List.from(servedNumList['chk_data']);
        revarseList.forEach(
          (key, value) {
            servedNumListCopy.removeWhere((element) => element['id'] == key);
          },
        );
        servedNumListCopy.forEach(
          (element) {
            revarseList[element['id']] = false;
          },
        );
        if (!mounted) return;
        setState(() {});
      },
    );
  }

  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: Scaffold(
        body: Column(
          children: [
            //================================== In Process Section ==================================//
            Expanded(
              child: Container(
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
                                top: 5, bottom: 0, left: 5),
                            child: Row(
                              children: [
                                Text(
                                  'In Process',
                                  style: TextStyle(
                                      color: MyColors().white,
                                      fontSize: 25,
                                      fontWeight: FontWeight.bold),
                                ),
                              ],
                            ),
                          ),
                          Expanded(
                            child: GridView.builder(
                              shrinkWrap: true,
                              padding: const EdgeInsets.all(8.0),
                              scrollDirection: Axis.vertical,
                              gridDelegate:
                                  const SliverGridDelegateWithMaxCrossAxisExtent(
                                      maxCrossAxisExtent: 150,
                                      childAspectRatio: 4 / 2,
                                      crossAxisSpacing: 10,
                                      mainAxisSpacing: 2),
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
                                          backgroundColor: MyColors().white,
                                          color: MyColors().mainColor,
                                        ),
                                      ),
                                    ),
                                  ),
                                  childWhenDragging: Text(
                                    chkNumList['chk_data'][index]['chk_num']
                                        .toString(),
                                    style: TextStyle(
                                      fontSize: 30,
                                      fontWeight: FontWeight.bold,
                                      backgroundColor: MyColors().mainColor,
                                      color: MyColors().mainColor,
                                    ),
                                  ),
                                  onDragCompleted: () {
                                    Repositories().updateChk(
                                        chkNumList['chk_data'][index]['id'],
                                        'SERVING');
                                  },
                                  child: SizedBox(
                                    height: 80,
                                    width: 160,
                                    child: Padding(
                                      padding: const EdgeInsets.all(7.0),
                                      child: Container(
                                        decoration: BoxDecoration(
                                          borderRadius:
                                              BorderRadius.circular(10),
                                          color: MyColors().white,
                                        ),
                                        child: Center(
                                          child: Text(
                                            chkNumList['chk_data'][index]
                                                    ['chk_num']
                                                .toString(),
                                            style: TextStyle(
                                              fontSize: 30,
                                              fontWeight: FontWeight.bold,
                                              color: MyColors().mainColor,
                                            ),
                                          ),
                                        ),
                                      ),
                                    ),
                                  ),
                                );
                              },
                            ),
                            //     ListView.builder(
                            //   itemCount: chkNumList['chk_data'].length,
                            //   itemBuilder: (itemBuilder, index) {
                            //     return Draggable(
                            //       data: chkNumList['chk_data'][index],
                            //       feedback: Material(
                            //         child: Container(
                            //           padding: const EdgeInsets.all(8),
                            //           child: Text(
                            //             chkNumList['chk_data'][index]['chk_num']
                            //                 .toString(),
                            //             style: TextStyle(
                            //               fontSize: 30,
                            //               fontWeight: FontWeight.bold,
                            //               backgroundColor: MyColors().white,
                            //               color: MyColors().mainColor,
                            //             ),
                            //           ),
                            //         ),
                            //       ),
                            //       onDragCompleted: () {
                            //         Repositories().updateChk(
                            //             chkNumList['chk_data'][index]['id'],
                            //             'SERVING');
                            //         // setState(() {
                            //         //   inProcessNumbers.removeAt(index);
                            //         // });
                            //       },
                            //       child: Padding(
                            //         padding: const EdgeInsets.symmetric(
                            //             horizontal: 120, vertical: 0),
                            //         child: Card(
                            //           color: MyColors()
                            //               .white, // Set the card background color
                            //           child: Text(
                            //             chkNumList['chk_data'][index]['chk_num']
                            //                 .toString(),
                            //             style: TextStyle(
                            //               fontSize: 30,
                            //               fontWeight: FontWeight.bold,
                            //               color: MyColors().mainColor,
                            //             ),
                            //             textAlign: TextAlign.center,
                            //           ),
                            //         ),
                            //       ),
                            //     );
                            //   },
                            // ),
                          ),
                        ],
                      ),
              ),
            ),
            //============================================ Now Serving Section==================================//
            Expanded(
              child: GestureDetector(
                onTap: () {
                  revarseList.forEach((key, value) {
                    revarseList[key] = false;
                  });
                  setState(() {});
                },
                child: Container(
                  width: double.infinity,
                  decoration: BoxDecoration(
                    color: MyColors().white,
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
                              'Now Serving',
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
                            setState(
                              () {
                                nowServingNumbers.add(data);
                                //revarseList.add(data);
                              },
                            );
                          },
                          builder: (context, candidateData, rejectedData) {
                            return chkNumList.isEmpty
                                ? const Center(
                                    child: CircularProgressIndicator(),
                                  )
                                : Padding(
                                    padding: const EdgeInsets.only(
                                        left: 8, right: 8),
                                    child: GridView.builder(
                                      shrinkWrap: true,
                                      scrollDirection: Axis.vertical,
                                      gridDelegate:
                                          const SliverGridDelegateWithMaxCrossAxisExtent(
                                              maxCrossAxisExtent: 150,
                                              childAspectRatio: 4 / 2,
                                              crossAxisSpacing: 10,
                                              mainAxisSpacing: 2),
                                      itemCount:
                                          servedNumList['chk_data'].length,
                                      itemBuilder: (itemBuilder, index) {
                                        return GestureDetector(
                                          onDoubleTap: () {
                                            Repositories().updateChk(
                                              servedNumList['chk_data'][index]
                                                  ['id'],
                                              'SERVED',
                                            );

                                            nowServingNumbers.clear();
                                            revarseList.remove(
                                                servedNumList['chk_data'][index]
                                                    ['id']);
                                            setState(() {});
                                          },
                                          onLongPress: () {
                                            setState(
                                              () {
                                                // isCrossVisible = true;
                                                // revarseList[
                                                //     servedNumList['chk_data']
                                                //         [index]['id']] = true ? revarseList[
                                                //     servedNumList['chk_data']
                                                //         [index]['id']] = false ;
                                                revarseList[
                                                    servedNumList['chk_data']
                                                            [index]
                                                        ['id']] = revarseList[
                                                                servedNumList['chk_data']
                                                                        [index]
                                                                    ['id']] !=
                                                            null &&
                                                        revarseList[servedNumList[
                                                                    'chk_data']
                                                                [index]['id']] ==
                                                            true
                                                    ? false
                                                    : true;
                                              },
                                            );
                                          },
                                          child: Stack(
                                            children: [
                                              Container(
                                                height: 80,
                                                width: 160,
                                                child: Padding(
                                                  padding:
                                                      const EdgeInsets.all(7.0),
                                                  child: Container(
                                                    decoration: BoxDecoration(
                                                      borderRadius:
                                                          BorderRadius.circular(
                                                              10),
                                                      color:
                                                          MyColors().mainColor,
                                                    ),
                                                    child: Center(
                                                      child: Text(
                                                        servedNumList['chk_data']
                                                                    [index]
                                                                ['chk_num']
                                                            .toString(),
                                                        style: TextStyle(
                                                          fontSize: 30,
                                                          fontWeight:
                                                              FontWeight.bold,
                                                          color:
                                                              MyColors().white,
                                                        ),
                                                      ),
                                                    ),
                                                  ),
                                                ),
                                              ),
                                              if (revarseList[servedNumList[
                                                              'chk_data'][index]
                                                          ['id']] !=
                                                      null &&
                                                  revarseList[servedNumList[
                                                              'chk_data'][index]
                                                          ['id']] ==
                                                      true)
                                                Positioned(
                                                  top: 0,
                                                  right: 0,
                                                  child: InkWell(
                                                    onTap: () {
                                                      Repositories().updateChk(
                                                        servedNumList[
                                                                'chk_data']
                                                            [index]['id'],
                                                        'F',
                                                      );
                                                      revarseList.remove(
                                                          servedNumList[
                                                                  'chk_data']
                                                              [index]['id']);
                                                    },
                                                    child: Container(
                                                      decoration: BoxDecoration(
                                                          shape:
                                                              BoxShape.circle,
                                                          color:
                                                              Colors.grey[200]),
                                                      height: 20,
                                                      width: 20,
                                                      child: Center(
                                                        child: Icon(
                                                          Icons.clear,
                                                          size: 18,
                                                          color: MyColors()
                                                              .mainColor,
                                                        ),
                                                      ),
                                                    ),
                                                  ),
                                                ),
                                            ],
                                          ),
                                        );
                                      },
                                    ),
                                  );

                            // ListView.builder(
                            //     // itemCount: nowServingNumbers.length
                            //     itemCount: servedNumList['chk_data'].length,
                            //     itemBuilder: (itemBuilder, index) {
                            //       return InkWell(
                            //         onDoubleTap: () {
                            //           Repositories().updateChk(
                            //               servedNumList['chk_data'][index]
                            //                   ['id'],
                            //               'SERVED');
                            //           // nowServingNumbers.removeAt(index);
                            //           nowServingNumbers.clear();
                            //           setState(() {});
                            //         },
                            //         child: Padding(
                            //           padding: const EdgeInsets.symmetric(
                            //               horizontal: 120, vertical: 0),
                            //           child: Card(
                            //             color: MyColors()
                            //                 .mainColor, // Set the card background color
                            //             child: Text(
                            //               // nowServingNumbers[index]['chk_num']
                            //               servedNumList['chk_data'][index]
                            //                       ['chk_num']
                            //                   .toString(),
                            //               style: TextStyle(
                            //                 fontSize: 30,
                            //                 fontWeight: FontWeight.bold,
                            //                 color: MyColors().white,
                            //               ),
                            //               textAlign: TextAlign.center,
                            //             ),
                            //           ),
                            //         ),
                            //       );
                            //     },
                            //   );
                          },
                        ),
                      ),
                      Row(
                        mainAxisAlignment: MainAxisAlignment.end,
                        children: [
                          Container(
                            padding: EdgeInsets.all(3),
                            color: MyColors().mainColor.withOpacity(1),
                            // Adjust padding as needed
                            child: Text(
                              'Powered By: Transcom Technology',
                              style: TextStyle(
                                  fontSize: 12, color: MyColors().white),
                            ),
                          ),
                        ],
                      ),
                    ],
                  ),
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }
}
