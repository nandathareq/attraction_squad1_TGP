import 'package:attractions/screen/resi_screen.dart';
import 'package:pinput/pinput.dart';
import 'package:attractions/widget/dropdown_item.dart';
import 'package:flutter/material.dart';
import 'package:intl/intl.dart' as intl;
import 'package:http/http.dart' as http;
import 'dart:convert';
import 'dart:async';
import 'package:attractions/main.dart';

import '../constant/constant.dart';

intl.DateFormat dateFormat = intl.DateFormat('dd MMMM yyyy');

class RingkasanCard extends StatelessWidget {
  final String bookingCode;
  final double total;
  final List<dynamic> items;
  final pinController = TextEditingController();
  final focusNode = FocusNode();
  final formKey = GlobalKey<FormState>();
  String? pinInput;
  bool? paymentStatus;
  String? paymentMessage;
  List<dynamic>? rekenings;

  RingkasanCard(
      {required this.bookingCode, required this.total, required this.items});

  final String apiUrl =
      "$ipAddress:8080/core_banking/details/$userIdRekeningGlobal";
  Future<List<dynamic>> _fecthRekening() async {
    var result = await http.get(Uri.parse(apiUrl));
    rekenings = json.decode(result.body);

    return json.decode(result.body);
  }

  List<DropdownMenuItem<String>> get dropdownItems {
    List<DropdownMenuItem<String>> menuItems = [
      DropdownMenuItem(
          value: "230215250415",
          child: Row(
            children: const [
              Icon(Icons.credit_card),
              Padding(padding: EdgeInsets.fromLTRB(5, 4, 10, 4)),
              Text("Xtra Savers - 230215250415")
            ],
          )),
      DropdownMenuItem(
          value: "455314976730",
          child: Row(
            children: const [
              Icon(Icons.credit_card),
              Padding(padding: EdgeInsets.fromLTRB(5, 4, 10, 4)),
              Text("Payroll - 455314976730")
            ],
          )),
      DropdownMenuItem(
          value: "778629831212",
          child: Row(
            children: const [
              Icon(Icons.credit_card),
              Padding(padding: EdgeInsets.fromLTRB(5, 4, 10, 4)),
              Text("Giro Perusahaan - 778629831212")
            ],
          )),
      DropdownMenuItem(
          value: "639136319357",
          child: Row(
            children: const [
              Icon(Icons.credit_card),
              Padding(padding: EdgeInsets.fromLTRB(5, 4, 10, 4)),
              Text("Rekening Ponsel - 639136319357")
            ],
          )),
    ];
    return menuItems;
  }

  Future pay(String pin, ipAddress) async {
    final response = await http.post(
      Uri.parse('$ipAddress:5000/api/v1/ticket/pay'),
      headers: <String, String>{
        'Content-Type': 'application/json; charset=UTF-8',
      },
      body: jsonEncode(<String, dynamic>{
        "grandTotal": total,
        "bookingCode": bookingCode,
        "nomorRekening": selectedRekening,
        "pin": pin
      }),
    );

    final extractedDatas = json.decode(response.body);
    extractedDatas['paymentSucces'] == true
        ? paymentStatus = true
        : paymentStatus = false;
    paymentMessage = extractedDatas['detail'];
    print(extractedDatas.toString());
  }

  String? selectedRekening = null;
  final _dropdownFormKey = GlobalKey<FormState>();

  @override
  Widget build(BuildContext context) {
    final format = new intl.NumberFormat("#,##0", "en_US");
    final ButtonStyle gaya = ElevatedButton.styleFrom(
        shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(20)),
        textStyle: const TextStyle(fontSize: 20),
        backgroundColor: const Color.fromARGB(255, 118, 17, 28));

    const focusedBorderColor = Color.fromARGB(255, 118, 17, 28);
    const fillColor = Color.fromRGBO(243, 246, 249, 0);
    const borderColor = Color.fromARGB(255, 118, 17, 28);

    final defaultPinTheme = PinTheme(
      width: 56,
      height: 56,
      textStyle: const TextStyle(
        fontSize: 22,
        color: Color.fromRGBO(30, 60, 87, 1),
      ),
      decoration: BoxDecoration(
        borderRadius: BorderRadius.circular(19),
        border: Border.all(color: borderColor),
      ),
    );

    return Container(
      child: Center(
        child: Column(
          children: [
            Padding(
              padding: EdgeInsets.all(20),
              child: Container(
                margin: const EdgeInsets.fromLTRB(0, 10, 0, 10),
                padding: const EdgeInsets.all(10),
                decoration: BoxDecoration(
                  color: Colors.white,
                  boxShadow: [
                    BoxShadow(
                      color: Colors.grey.withOpacity(0.5),
                      spreadRadius: 5,
                      blurRadius: 7,
                      offset: const Offset(0, 0),
                    ),
                  ],
                  borderRadius: BorderRadius.circular(10),
                ),
                child: Column(
                  children: [
                    Row(
                      mainAxisAlignment: MainAxisAlignment.center,
                      children: [
                        Padding(
                            padding: EdgeInsets.only(top: 10, bottom: 5),
                            child: Text(
                              "NOMINAL",
                              style: TextStyle(
                                  fontSize: 18, fontWeight: FontWeight.bold),
                            )),
                      ],
                    ),
                    Row(
                      mainAxisAlignment: MainAxisAlignment.center,
                      children: [
                        Padding(
                            padding: EdgeInsets.only(bottom: 5),
                            child: Text(
                              "Rp.${format.format(total)}",
                              style: TextStyle(
                                  fontSize: 32, fontWeight: FontWeight.bold),
                            )),
                      ],
                    ),
                    Row(
                      mainAxisAlignment: MainAxisAlignment.start,
                      children: [
                        Padding(
                            padding:
                                EdgeInsets.only(left: 20, top: 10, bottom: 5),
                            child: Text(
                              "Pembayaran ke ",
                              style: TextStyle(
                                  fontSize: 16, fontWeight: FontWeight.normal),
                            )),
                      ],
                    ),
                    Row(
                      mainAxisAlignment: MainAxisAlignment.start,
                      children: [
                        Padding(
                            padding:
                                EdgeInsets.only(left: 20, top: 5, bottom: 5),
                            child: Text(
                              "SQ1.COM ",
                              style: TextStyle(
                                  fontSize: 14, fontWeight: FontWeight.bold),
                            )),
                      ],
                    ),
                    Row(
                      mainAxisAlignment: MainAxisAlignment.end,
                      children: [
                        Padding(
                          padding:
                              EdgeInsets.only(right: 10, top: 5, bottom: 5),
                          child: Row(
                            children: [
                              Column(
                                children: [
                                  Padding(
                                    padding: EdgeInsets.only(right: 5),
                                    child: Card(
                                      shape: RoundedRectangleBorder(
                                        borderRadius: BorderRadius.circular(10),
                                      ),
                                      color: Colors.amber,
                                      child: SizedBox(
                                        child: Padding(
                                          padding: EdgeInsets.only(
                                              top: 5,
                                              bottom: 5,
                                              right: 10,
                                              left: 10),
                                          child: Text(
                                            "+ Biaya Admin",
                                            style:
                                                TextStyle(color: Colors.white),
                                          ),
                                        ),
                                      ),
                                    ),
                                  ),
                                ],
                              ),
                              Column(
                                children: [
                                  Text(
                                    "GRATIS ",
                                    style: TextStyle(
                                        fontSize: 14,
                                        fontWeight: FontWeight.bold),
                                  ),
                                ],
                              ),
                            ],
                          ),
                        ),
                      ],
                    ),
                  ],
                ),
              ),
            ),
            Row(
              children: [
                Padding(
                  padding: EdgeInsets.only(left: 20),
                  child: Text(
                    'Pembayaran dari ',
                    style: TextStyle(fontSize: 16, fontWeight: FontWeight.bold),
                  ),
                ),
              ],
            ),
            Padding(
              padding:
                  EdgeInsets.only(top: 10, right: 20, left: 20, bottom: 10),
              child: Container(
                margin: const EdgeInsets.fromLTRB(0, 10, 0, 10),
                padding: const EdgeInsets.all(10),
                decoration: BoxDecoration(
                  color: Colors.white,
                  boxShadow: [
                    BoxShadow(
                      color: Colors.grey.withOpacity(0.5),
                      spreadRadius: 5,
                      blurRadius: 7,
                      offset: const Offset(0, 0),
                    ),
                  ],
                  borderRadius: BorderRadius.circular(10),
                ),
                child: Form(
                    key: _dropdownFormKey,
                    child: Column(
                      mainAxisAlignment: MainAxisAlignment.center,
                      children: [
                        FutureBuilder(
                          future: _fecthRekening(),
                          builder: (BuildContext context,
                              AsyncSnapshot<List<dynamic>> snapshot) {
                            if (snapshot.hasData) {
                              List<dynamic>? rekenings = snapshot.data;
                              return DropdownButtonFormField(
                                  hint: Row(
                                    children: const [
                                      Icon(
                                        Icons.credit_card,
                                        color: Color.fromARGB(255, 118, 17, 28),
                                      ),
                                      Padding(
                                          padding:
                                              EdgeInsets.fromLTRB(5, 4, 10, 4)),
                                      Text("Pilih Sumber Dana")
                                    ],
                                  ),
                                  decoration: InputDecoration(
                                    focusedBorder: OutlineInputBorder(
                                        borderSide: BorderSide(
                                          color:
                                              Color.fromARGB(255, 117, 17, 28),
                                          width: 2,
                                        ),
                                        borderRadius:
                                            BorderRadius.circular(20)),
                                    enabledBorder: OutlineInputBorder(
                                      borderSide: BorderSide(
                                          color:
                                              Color.fromARGB(255, 118, 17, 28),
                                          width: 2),
                                      borderRadius: BorderRadius.circular(20),
                                    ),
                                    border: OutlineInputBorder(
                                      borderSide: BorderSide(
                                          color:
                                              Color.fromARGB(255, 118, 17, 28),
                                          width: 2),
                                      borderRadius: BorderRadius.circular(20),
                                    ),
                                    filled: true,
                                    // fillColor: Colors.blueAccent,
                                  ),
                                  validator: (value) =>
                                      value == null ? "Select a country" : null,
                                  // dropdownColor: Colors.blueAccent,
                                  value: selectedRekening,
                                  onChanged: (String? newValue) {
                                    selectedRekening = newValue!;
                                  },
                                  items: rekenings?.map((item) {
                                    return DropdownMenuItem(
                                      child: Row(
                                        children: [
                                          Icon(
                                            Icons.credit_card,
                                            color: Color.fromARGB(
                                                255, 118, 17, 28),
                                          ),
                                          Padding(
                                              padding: EdgeInsets.fromLTRB(
                                                  5, 4, 10, 4)),
                                          Text(
                                            "${item['rekeningId']['nama'].toString()} - ${item['nomorRekening'].toString()}",
                                            style: TextStyle(
                                                fontWeight: FontWeight.bold),
                                          ),
                                        ],
                                      ),
                                      value: item['nomorRekening'].toString(),
                                    );
                                  }).toList()

                                  // dropdownItems
                                  );
                            } else {
                              return Center(child: CircularProgressIndicator());
                            }
                          },
                        ),

                        // DropdownButtonFormField(
                        //     hint: Row(
                        //       children: const [
                        //         Icon(Icons.credit_card),
                        //         Padding(
                        //             padding: EdgeInsets.fromLTRB(5, 4, 10, 4)),
                        //         Text("Pilih Sumber Dana")
                        //       ],
                        //     ),
                        //     decoration: InputDecoration(
                        //       enabledBorder: OutlineInputBorder(
                        //         // borderSide:
                        //         //     BorderSide(color: Colors.blue, width: 2),
                        //         borderRadius: BorderRadius.circular(20),
                        //       ),
                        //       border: OutlineInputBorder(
                        //         // borderSide:
                        //         //     BorderSide(color: Colors.blue, width: 2),
                        //         borderRadius: BorderRadius.circular(20),
                        //       ),
                        //       filled: true,
                        //       // fillColor: Colors.blueAccent,
                        //     ),
                        //     validator: (value) =>
                        //         value == null ? "Select a country" : null,
                        //     // dropdownColor: Colors.blueAccent,
                        //     value: selectedRekening,
                        //     onChanged: (String? newValue) {
                        //       selectedRekening = newValue!;
                        //     },
                        //     items: dataProvince.map((item) {
                        //       return DropdownMenuItem(
                        //         child: Text(item['province']),
                        //         value: item['province'],
                        //       );
                        //     }).toList()
                        //     // dropdownItems
                        //     ),

                        // ElevatedButton(
                        //     onPressed: () {
                        //       if (_dropdownFormKey.currentState!.validate()) {
                        //         //valid flow
                        //       }
                        //     },
                        //     child: Text("Submit"))
                      ],
                    )),

                // DropdownItem(),
              ),
            ),
            Row(
              children: [
                Padding(
                  padding: EdgeInsets.only(left: 20),
                  child: Text(
                    'Detail Pembayaran ',
                    style: TextStyle(fontSize: 16, fontWeight: FontWeight.bold),
                  ),
                ),
              ],
            ),
            Padding(
              padding:
                  EdgeInsets.only(top: 10, right: 20, left: 20, bottom: 10),
              child: Container(
                margin: const EdgeInsets.fromLTRB(0, 10, 0, 10),
                padding: const EdgeInsets.all(10),
                decoration: BoxDecoration(
                  color: Colors.white,
                  boxShadow: [
                    BoxShadow(
                      color: Colors.grey.withOpacity(0.5),
                      spreadRadius: 5,
                      blurRadius: 7,
                      offset: const Offset(0, 0),
                    ),
                  ],
                  borderRadius: BorderRadius.circular(10),
                ),
                child: Container(
                  child: Column(
                    children: [
                      Row(
                        children: [
                          Padding(
                              padding: EdgeInsets.only(left: 20, top: 10),
                              child: Text('Kode Pemesanan')),
                        ],
                      ),
                      Row(
                        children: [
                          Padding(
                              padding: EdgeInsets.only(left: 20, top: 5),
                              child: Text(
                                bookingCode.toString().toUpperCase(),
                                style: TextStyle(fontWeight: FontWeight.bold),
                              )),
                        ],
                      ),
                      Container(
                        child: Column(children: [
                          Row(
                            children: [
                              Padding(
                                  padding: EdgeInsets.only(left: 20, top: 20),
                                  child: Text('Pemesanan Tiket Untuk')),
                            ],
                          ),
                          Row(
                            children: [
                              Padding(
                                  padding: EdgeInsets.only(left: 20, top: 5),
                                  child: Text(
                                    items[0]['placeName'],
                                    style:
                                        TextStyle(fontWeight: FontWeight.bold),
                                  )),
                            ],
                          ),
                          Row(
                            children: [
                              Padding(
                                  padding: EdgeInsets.only(left: 20, top: 20),
                                  child: Text('Jumlah Tiket')),
                            ],
                          ),
                          Row(
                            children: [
                              Padding(
                                  padding: EdgeInsets.only(left: 20, top: 5),
                                  child: Text(
                                    "${double.parse(items[0]['qty'].toString()).round()} pax",
                                    style:
                                        TextStyle(fontWeight: FontWeight.bold),
                                  )),
                            ],
                          ),
                          Row(
                            children: [
                              Padding(
                                  padding: EdgeInsets.only(left: 20, top: 20),
                                  child: Text('Tanggal Tiket Masuk')),
                            ],
                          ),
                          Row(
                            children: [
                              Padding(
                                  padding: EdgeInsets.only(left: 20, top: 5),
                                  child: Text(
                                    dateFormat.format(DateTime.parse(
                                            items[0]['attractionDate'])
                                        .toLocal()),
                                    style:
                                        TextStyle(fontWeight: FontWeight.bold),
                                  )),
                            ],
                          ),
                          Row(
                            children: [
                              Padding(
                                  padding: EdgeInsets.only(left: 20, top: 20),
                                  child: Text('Total Pembayaran')),
                            ],
                          ),
                          Row(
                            children: [
                              Padding(
                                  padding: EdgeInsets.only(
                                      left: 20, top: 5, bottom: 10),
                                  child: Text(
                                    "Rp.${format.format(total)}",
                                    style:
                                        TextStyle(fontWeight: FontWeight.bold),
                                  )),
                            ],
                          ),
                        ]),
                      ),
                    ],
                  ),
                ),
              ),
            ),
            Center(
              child: Column(
                children: [
                  const SizedBox(height: 10),
                  SizedBox(
                    width: 360,
                    height: 45,
                    child: ElevatedButton(
                      style: gaya,
                      onPressed: () {
                        showModalBottomSheet(
                            isScrollControlled: true,
                            shape: const RoundedRectangleBorder(
                              borderRadius: BorderRadius.only(
                                topRight: Radius.circular(30),
                                topLeft: Radius.circular(30),
                              ),
                            ),
                            context: context,
                            builder: (context) {
                              return Column(
                                mainAxisSize: MainAxisSize.min,
                                children: <Widget>[
                                  const ListTile(
                                    leading: Icon(Icons.close),
                                    minLeadingWidth: 0,
                                    title: Text(
                                      "Konfirmasi Transaksi Anda",
                                      textAlign: TextAlign.center,
                                      style: TextStyle(
                                          fontWeight: FontWeight.bold),
                                    ),
                                    trailing: Icon(
                                      Icons.close,
                                      color: Colors.transparent,
                                    ),
                                  ),
                                  Text("Masukkan PIN OCTO Mobile Anda"),
                                  Container(
                                    margin: EdgeInsets.fromLTRB(5, 15, 5, 15),
                                    child: Form(
                                      key: formKey,
                                      child: Column(
                                        mainAxisAlignment:
                                            MainAxisAlignment.center,
                                        children: [
                                          Directionality(
                                            // Specify direction if desired
                                            textDirection: TextDirection.ltr,
                                            child: Pinput(
                                              length: 6,
                                              obscureText: true,
                                              controller: pinController,
                                              focusNode: focusNode,

                                              defaultPinTheme: defaultPinTheme,
                                              validator: (value) {
                                                return value?.length == 6
                                                    ? null
                                                    : 'Masukkan seluruh pin anda';
                                              },
                                              // onClipboardFound: (value) {
                                              //   debugPrint('onClipboardFound: $value');
                                              //   pinController.setText(value);
                                              // },
                                              hapticFeedbackType:
                                                  HapticFeedbackType
                                                      .lightImpact,
                                              onCompleted: (pin) {
                                                pinInput = pin;

                                                // debugPrint('onCompleted: $pin');
                                              },
                                              onChanged: (value) {
                                                pinInput = value;

                                                // debugPrint('onChanged: $value');
                                              },
                                              cursor: Column(
                                                mainAxisAlignment:
                                                    MainAxisAlignment.end,
                                                children: [
                                                  Container(
                                                    margin:
                                                        const EdgeInsets.only(
                                                            bottom: 9),
                                                    width: 22,
                                                    height: 1,
                                                    color: focusedBorderColor,
                                                  ),
                                                ],
                                              ),
                                              focusedPinTheme:
                                                  defaultPinTheme.copyWith(
                                                decoration: defaultPinTheme
                                                    .decoration!
                                                    .copyWith(
                                                  borderRadius:
                                                      BorderRadius.circular(8),
                                                  border: Border.all(
                                                      color:
                                                          focusedBorderColor),
                                                ),
                                              ),
                                              submittedPinTheme:
                                                  defaultPinTheme.copyWith(
                                                decoration: defaultPinTheme
                                                    .decoration!
                                                    .copyWith(
                                                  color: fillColor,
                                                  borderRadius:
                                                      BorderRadius.circular(19),
                                                  border: Border.all(
                                                      color:
                                                          focusedBorderColor),
                                                ),
                                              ),
                                              errorPinTheme: defaultPinTheme
                                                  .copyBorderWith(
                                                border: Border.all(
                                                    color: Colors.redAccent),
                                              ),
                                            ),
                                          ),
                                          Padding(
                                              padding: EdgeInsets.fromLTRB(
                                                  5, 20, 5, 10)),
                                          SizedBox(
                                            width: 360,
                                            height: 45,
                                            child: TextButton(
                                              onPressed: () async {
                                                if (pinInput?.length == 6) {
                                                  await pay(
                                                      pinInput!, ipAddress);
                                                  paymentStatus == true
                                                      ? Navigator.push(
                                                          context,
                                                          MaterialPageRoute(
                                                              builder:
                                                                  (context) =>
                                                                      ResiScreen(
                                                                        bookingCode:
                                                                            bookingCode,
                                                                      )))
                                                      : showDialog<String>(
                                                          context: context,
                                                          builder: (BuildContext
                                                                  context) =>
                                                              AlertDialog(
                                                                shape: RoundedRectangleBorder(
                                                                    borderRadius:
                                                                        BorderRadius.circular(
                                                                            20)),
                                                                title:
                                                                    const Text(
                                                                  'Payment Gagal',
                                                                  textAlign:
                                                                      TextAlign
                                                                          .center,
                                                                ),
                                                                content: Text(
                                                                  paymentMessage!,
                                                                  textAlign:
                                                                      TextAlign
                                                                          .center,
                                                                  style: TextStyle(
                                                                      color: Colors
                                                                          .black),
                                                                ),
                                                                actions: <
                                                                    Widget>[
                                                                  Center(
                                                                    child:
                                                                        TextButton(
                                                                      onPressed: () => Navigator.pop(
                                                                          context,
                                                                          'OK'),
                                                                      child:
                                                                          const Text(
                                                                        'OK',
                                                                        style: TextStyle(
                                                                            color: Color.fromARGB(
                                                                                255,
                                                                                118,
                                                                                17,
                                                                                28)),
                                                                      ),
                                                                    ),
                                                                  ),
                                                                ],
                                                              ));
                                                } else {
                                                  showDialog<String>(
                                                      context: context,
                                                      builder: (BuildContext
                                                              context) =>
                                                          AlertDialog(
                                                            shape: RoundedRectangleBorder(
                                                                borderRadius:
                                                                    BorderRadius
                                                                        .circular(
                                                                            20)),
                                                            title: const Text(
                                                              'Silahkan Isi PIN Anda dengan Lengkap',
                                                              textAlign:
                                                                  TextAlign
                                                                      .center,
                                                            ),
                                                            // content: const Text('AlertDialog description'),
                                                            actions: <Widget>[
                                                              Center(
                                                                child:
                                                                    TextButton(
                                                                  onPressed: () =>
                                                                      Navigator.pop(
                                                                          context,
                                                                          'OK'),
                                                                  child:
                                                                      const Text(
                                                                    'OK',
                                                                    style: TextStyle(
                                                                        color: Color.fromARGB(
                                                                            255,
                                                                            118,
                                                                            17,
                                                                            28)),
                                                                  ),
                                                                ),
                                                              ),
                                                            ],
                                                          ));
                                                }
                                              },
                                              style: ButtonStyle(
                                                  shape: MaterialStateProperty
                                                      .all<RoundedRectangleBorder>(
                                                          RoundedRectangleBorder(
                                                              borderRadius:
                                                                  BorderRadius
                                                                      .circular(
                                                                          20))),
                                                  backgroundColor:
                                                      MaterialStateProperty.all(
                                                          Color.fromARGB(255,
                                                              118, 17, 28))),
                                              child: const Text(
                                                'Bayar',
                                                style: TextStyle(
                                                    color: Colors.white),
                                              ),
                                            ),
                                          ),
                                        ],
                                      ),
                                    ),
                                  ),
                                  SizedBox(
                                    height: MediaQuery.of(context).size.width *
                                        0.75,
                                  )
                                ],
                              );
                            });
                      },
                      child: const Text('Lanjut'),
                    ),
                  ),
                  const SizedBox(height: 20)
                ],
              ),
            ),
          ],
        ),
      ),
    );
  }
}
