import 'package:daniel_garcia_app_ev1/bbdd.dart';
import 'package:daniel_garcia_app_ev1/models/qr.dart';
import 'package:daniel_garcia_app_ev1/my_scaffold.dart';
import 'package:flutter/material.dart';
import 'package:url_launcher/url_launcher.dart';

class QR_Library extends StatefulWidget {
  const QR_Library({super.key});

  @override
  State<QR_Library> createState() => _QR_LibraryState();
}

// ignore: camel_case_types
class _QR_LibraryState extends State<QR_Library> {
  List<QR>? qrList;
  List<bool> isOpen = List.filled(2, false);
  @override
  // initState() {
  //   super.initState();
  //   Future.delayed(const Duration(milliseconds: 1), () async {
  //     qrList = await Bbdd().obtainListOfQR();
  //     setState(() {});
  //   });
  // }

  @override
  Widget build(BuildContext context) {
    return MyScaffold(
      currentIndex: 0,
      body: Column(
        children: [
          Padding(
            padding: const EdgeInsets.all(15.0),
            child: ExpansionPanelList(
              children: [
                ExpansionPanel(
                    canTapOnHeader: true,
                    backgroundColor: Colors.amber,
                    headerBuilder: (context, isExpanded) {
                      return const Padding(
                        padding: EdgeInsets.all(10.0),
                        child: Row(
                          children: [
                            Icon(Icons.ac_unit),
                            Padding(
                              padding: EdgeInsets.all(8.0),
                              child: Text("Cabesa"),
                            )
                          ],
                        ),
                      );
                    },
                    body: Card(
                      child: Padding(
                        padding: const EdgeInsets.all(12.0),
                        child: Row(
                          mainAxisAlignment: MainAxisAlignment.spaceBetween,
                          children: [
                            const Column(
                              crossAxisAlignment: CrossAxisAlignment.start,
                              children: [
                                Text("Id: 1"),
                                SizedBox(height: 12),
                                SizedBox(
                                  width: 200,
                                  height: 50,
                                  child: Scrollbar(
                                    child: Text("Url: www.cositas.com"),
                                  ),
                                )
                              ],
                            ),
                            IconButton(
                                onPressed: () async {},
                                icon: const Icon(Icons.open_in_browser))
                          ],
                        ),
                      ),
                      // child: Center(child: Text(qrList![index].id!.toString())),
                    ),
                    isExpanded: isOpen[0]),
                ExpansionPanel(
                    canTapOnHeader: true,
                    backgroundColor: const Color.fromARGB(255, 44, 180, 17),
                    headerBuilder: (context, isExpanded) {
                      return const Padding(
                        padding: EdgeInsets.all(10.0),
                        child: Row(
                          children: [
                            Icon(Icons.access_alarm),
                            Padding(
                              padding: EdgeInsets.all(8.0),
                              child: Text("Tronko"),
                            )
                          ],
                        ),
                      );
                    },
                    body: Card(
                      child: Padding(
                        padding: const EdgeInsets.all(12.0),
                        child: Row(
                          mainAxisAlignment: MainAxisAlignment.spaceBetween,
                          children: [
                            const Column(
                              crossAxisAlignment: CrossAxisAlignment.start,
                              children: [
                                Text("Id: 1"),
                                SizedBox(height: 12),
                                SizedBox(
                                  width: 200,
                                  height: 50,
                                  child: Scrollbar(
                                    child: Text("Url: www.cositas.com"),
                                  ),
                                )
                              ],
                            ),
                            IconButton(
                                onPressed: () async {},
                                icon: const Icon(Icons.open_in_browser))
                          ],
                        ),
                      ),
                      // child: Center(child: Text(qrList![index].id!.toString())),
                    ),
                    isExpanded: isOpen[1]),
              ],
              expansionCallback: (panelIndex, isExpanded) => setState(() {
                isOpen[panelIndex] = isExpanded;
              }),
            ),
          )
        ],
      ),
    );
  }
}
