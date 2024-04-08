import 'package:daniel_garcia_app_ev1/bbdd.dart';
import 'package:daniel_garcia_app_ev1/models/qr.dart';
import 'package:daniel_garcia_app_ev1/my_scaffold.dart';
import 'package:flutter/material.dart';
import 'package:url_launcher/url_launcher.dart';

// ignore: camel_case_types
class QR_Record extends StatefulWidget {
  const QR_Record({super.key});

  @override
  State<QR_Record> createState() => _QR_RecordState();
}

// ignore: camel_case_types
class _QR_RecordState extends State<QR_Record> {
  List<QR>? qrList;
  @override
  initState() {
    super.initState();
    Future.delayed(const Duration(milliseconds: 1), () async {
      qrList = await Bbdd().obtainListOfQR();
      setState(() {});
    });
  }

  @override
  Widget build(BuildContext context) {
    return MyScaffold(
        currentIndex: 2,
        body: qrList != null
            ? qrList!.isEmpty
                ? const Padding(
                    padding: EdgeInsets.all(20.0),
                    child: Center(
                        child: Text(
                      "Todavia no has guardado ningún QR",
                      textAlign: TextAlign.center,
                      style: TextStyle(
                        fontSize: 25,
                      ),
                    )),
                  )
                : ListView.builder(
                    padding: const EdgeInsets.all(8),
                    itemCount: qrList!.length,
                    itemBuilder: (BuildContext context, int index) {
                      return Card(
                        child: Padding(
                          padding: const EdgeInsets.all(12.0),
                          child: Row(
                            mainAxisAlignment: MainAxisAlignment.spaceBetween,
                            children: [
                              Column(
                                crossAxisAlignment: CrossAxisAlignment.start,
                                children: [
                                  Text("Id: ${qrList![index].id}"),
                                  const SizedBox(height: 12),
                                  SizedBox(
                                    width: 200,
                                    height: 50,
                                    child: Scrollbar(
                                      child:
                                          Text("Url: ${qrList![index].qr_url}"),
                                    ),
                                  )
                                ],
                              ),
                              IconButton(
                                  onPressed: () async {
                                    try {
                                      Uri? url = Uri.parse(
                                          qrList![index].qr_url ?? "");
                                      await launchUrl(url);
                                    } catch (e) {
                                      // ignore: use_build_context_synchronously
                                      ScaffoldMessenger.of(context)
                                          .showSnackBar(
                                        const SnackBar(
                                            content: Text(
                                                'No se pudo abrir el enlace')),
                                      );
                                    }
                                  },
                                  icon: const Icon(Icons.open_in_browser))
                            ],
                          ),
                        ),
                        // child: Center(child: Text(qrList![index].id!.toString())),
                      );
                    })
            : const Center(child: CircularProgressIndicator()));
  }
}
