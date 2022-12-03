import 'dart:convert';

import 'package:attractions/main.dart';
import 'package:attractions/screen/ringkasan_screen.dart';
import 'package:http/http.dart' as http;

import 'package:flutter/cupertino.dart';

import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:intl/intl.dart';

import '../constant/constant.dart';
import '../model/attraction_model.dart';

class BookScreen extends StatefulWidget {
  final AttractionModel model;
  const BookScreen({super.key, required this.model});

  @override
  State<BookScreen> createState() => _BookScreenState();
}

class _BookScreenState extends State<BookScreen> {
  final _formKey = GlobalKey<FormState>();
  // final FocusNode _focusNode = FocusNode();
  // final FocusNode _focusNode1 = FocusNode();
  // final FocusNode _focusNode2 = FocusNode();
  // late Color color;

  num _jumlahTiket = 1;
  DateTime _tanggal = DateTime.now();
  DateTime _initTanggal = DateTime.now();
  String? _name = null;
  String? _email = null;
  String? _phone = null;
  // Future? _response;
  Map<String, dynamic>? _response;

  // final TextEditingController _nameController = TextEditingController();
  // final TextEditingController _emailController = TextEditingController();
  // final TextEditingController _phoneController = TextEditingController();

  Future book(
      {required String? email,
      required int attractionId,
      required num quantity}) async {
    // print(widget.model.price.toDouble().runtimeType);

    DateFormat newsFormatDate = DateFormat("yyyy-MM-dd'T'hh:mm'Z'");
    String tanggalTicket = newsFormatDate.format(_tanggal).toString();

    print(tanggalTicket);

    final response = await http.post(
      Uri.parse('$ipAddress:5000/api/v1/ticket/book'),
      headers: <String, String>{
        'Content-Type': 'application/json; charset=UTF-8',
      },
      body: jsonEncode(<String, dynamic>{
        "grandTotal": widget.model.price.toDouble() * quantity.toDouble(),
        "issuer": email,
        "subInvoice": [
          {
            "issuedTo": email,
            "total": widget.model.price.toDouble() * quantity.toDouble(),
            "items": [
              {
                "attractionPlaceId": attractionId,
                "placeName": widget.model.placeName,
                "qty": quantity,
                "subTotal": widget.model.price.toDouble() * quantity.toDouble(),
                "date": tanggalTicket
              }
            ]
          }
        ]
      }),
    );
    final extractedDatas = json.decode(response.body);

    print(extractedDatas.toString());
    setState(() {
      _response = extractedDatas;
    });
  }

  void add() {
    setState(() {
      _jumlahTiket++;
    });
  }

  void minus() {
    setState(() {
      if (_jumlahTiket > 1) _jumlahTiket--;
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(25)),
        title: const Text("Selesaikan Pemesananmu"),
        centerTitle: true,
        backgroundColor: const Color.fromARGB(255, 118, 17, 28),
      ),
      body: Container(
        // padding: const EdgeInsets.all(20),
        child: ListView(
          children: [
            Padding(
              padding: EdgeInsets.only(left: 20, right: 20, top: 20),
              child: const Text(
                "Detail Pemesanan",
                style: TextStyle(fontSize: 16, fontWeight: FontWeight.bold),
              ),
            ),
            Padding(
              padding: EdgeInsets.only(
                left: 20,
                right: 20,
              ),
              child: Container(
                margin: const EdgeInsets.fromLTRB(0, 20, 0, 20),
                padding: const EdgeInsets.all(20),
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
                child: Column(children: [
                  Row(
                    children: [
                      Padding(
                        padding: EdgeInsets.only(right: 10),
                        child: Column(
                          children: [
                            Container(
                              width: 100,
                              child: ClipRRect(
                                borderRadius: BorderRadius.circular(15),
                                child: Image.network(widget.model.picture),
                              ),
                            ),
                          ],
                        ),
                      ),
                      Padding(
                        padding: EdgeInsets.only(right: 5),
                        child: Column(
                          children: [
                            SizedBox(
                              width: 150,
                              child: Text(
                                widget.model.placeName,
                                maxLines: 3,
                                overflow: TextOverflow.ellipsis,
                                style: const TextStyle(
                                    fontSize: 20, fontWeight: FontWeight.bold),
                              ),
                            ),
                          ],
                        ),
                      ),
                    ],
                  ),
                  Padding(
                    padding: EdgeInsets.only(top: 10),
                    child: const Divider(
                      color: Colors.black,
                      thickness: 1,
                    ),
                  ),
                  Padding(
                    padding: EdgeInsets.only(bottom: 5),
                    child: Row(
                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      children: [
                        Column(
                          children: [
                            const Text("Pilih Jumlah Tiket"),
                          ],
                        ),
                        Column(
                          children: [
                            Row(
                              mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                              children: <Widget>[
                                Container(
                                  child: SizedBox(
                                    width: 25,
                                    height: 25,
                                    child: FloatingActionButton(
                                      backgroundColor:
                                          Color.fromARGB(255, 118, 17, 28),
                                      heroTag: "btn1",
                                      onPressed: minus,
                                      child: Icon(
                                        Icons.remove,
                                        size: 20,
                                      ),
                                      shape: BeveledRectangleBorder(
                                          borderRadius:
                                              BorderRadius.circular(2)),
                                    ),
                                  ),
                                ),
                                Padding(
                                  padding: EdgeInsets.only(left: 5, right: 5),
                                  child: Text('$_jumlahTiket',
                                      style: TextStyle(
                                          fontSize: 18,
                                          fontWeight: FontWeight.bold)),
                                ),
                                Container(
                                  child: SizedBox(
                                    width: 25,
                                    height: 25,
                                    child: FloatingActionButton(
                                      backgroundColor:
                                          Color.fromARGB(255, 118, 17, 28),
                                      heroTag: "btn2",
                                      onPressed: add,
                                      child: Icon(
                                        Icons.add,
                                        size: 20,
                                      ),
                                      shape: BeveledRectangleBorder(
                                          borderRadius:
                                              BorderRadius.circular(2)),
                                    ),
                                  ),
                                ),
                              ],
                            ),
                            // Counter(
                            //   min: 1,
                            //   max: 50,
                            //   bound: 1,
                            //   step: 1,
                            //   onValueChanged: ((value) {
                            //     _jumlahTiket = value;
                            //   }),
                            // ),
                          ],
                        ),
                      ],
                    ),
                  ),
                  Padding(
                    padding: EdgeInsets.only(bottom: 10),
                    child: Row(
                      children: [
                        const Text("Pilih Tanggal"),
                      ],
                    ),
                  ),
                  Column(
                    children: [
                      Container(
                        height: 35,
                        child: CupertinoDatePicker(
                            mode: CupertinoDatePickerMode.date,
                            initialDateTime: _initTanggal,
                            minimumDate: _initTanggal,
                            onDateTimeChanged: (val) {
                              _tanggal = val;
                            }),
                      )
                    ],
                  ),
                  Row(
                    children: [],
                  ),
                ]),
              ),
            ),
            Padding(
              padding: EdgeInsets.only(left: 20, right: 20),
              child: const Text(
                "Detail Pemesan",
                style: TextStyle(fontSize: 16, fontWeight: FontWeight.bold),
              ),
            ),
            Padding(
              padding: EdgeInsets.only(left: 20, right: 20),
              child: Container(
                margin: const EdgeInsets.fromLTRB(0, 20, 0, 20),
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
                  key: _formKey,
                  child: Column(
                    children: [
                      Padding(
                        padding: const EdgeInsets.all(8.0),
                        child: TextFormField(
                            initialValue: userNameGlobal,
                            // focusNode: _focusNode,
                            // controller: _nameController,
                            decoration: InputDecoration(
                              focusedBorder: OutlineInputBorder(
                                  borderSide: BorderSide(
                                color: Color.fromARGB(255, 117, 17, 28),
                                width: 3,
                              )),
                              border: OutlineInputBorder(),
                              labelText: 'Nama Lengkap',
                              labelStyle: TextStyle(color: Colors.grey),
                              // labelStyle: TextStyle(
                              //   color: _focusNode.hasFocus
                              //       ? Color.fromARGB(255, 117, 17, 28)
                              //       : Colors.grey,
                              // )

                              // floatingLabelStyle: TextStyle(
                              //     color: Color.fromARGB(255, 117, 17, 28))
                            ),
                            onChanged: ((value) => _name = value),
                            validator: (value) {
                              _name = value;
                              if (value == null || value.isEmpty) {
                                return 'Masukkan Nama Lengkap Anda';
                              }

                              return null;
                            }),
                      ),
                      Padding(
                        padding: const EdgeInsets.all(8.0),
                        child: TextFormField(
                            initialValue: userEmailGlobal,
                            // focusNode: _focusNode1,
                            // controller: _emailController,
                            decoration: InputDecoration(
                              focusedBorder: OutlineInputBorder(
                                  borderSide: BorderSide(
                                color: Color.fromARGB(255, 117, 17, 28),
                                width: 3,
                              )),
                              border: OutlineInputBorder(),
                              labelText: 'Alamat email',
                              labelStyle: TextStyle(color: Colors.grey),
                              // labelStyle: TextStyle(
                              //   color: _focusNode.hasFocus
                              //       ? Color.fromARGB(255, 117, 17, 28)
                              //       : Colors.grey,
                              // )
                            ),
                            onChanged: ((value) => _email = value),
                            validator: (value) {
                              _email = value;
                              if (value == null ||
                                  value.isEmpty ||
                                  !value.contains("@")) {
                                return 'Masukkan email anda dengan baik';
                              }
                              return null;
                            }),
                      ),
                      Padding(
                        padding: const EdgeInsets.all(8.0),
                        child: TextFormField(
                            initialValue: userMobileNumberGlobal,
                            // controller: _phoneController,
                            decoration: const InputDecoration(
                              focusedBorder: OutlineInputBorder(
                                  borderSide: BorderSide(
                                color: Color.fromARGB(255, 117, 17, 28),
                                width: 3,
                              )),
                              border: OutlineInputBorder(),
                              labelText: 'No ponsel',
                              labelStyle: TextStyle(color: Colors.grey),
                            ),
                            keyboardType: TextInputType.number,
                            inputFormatters: <TextInputFormatter>[
                              FilteringTextInputFormatter.digitsOnly
                            ],
                            onChanged: ((value) => _phone = value.toString()),
                            validator: (value) {
                              _phone = value.toString();
                              if (value == null ||
                                  value.isEmpty ||
                                  value.length < 8) {
                                return 'Masukkan nomor ponsel dengan baik';
                              }
                              return null;
                            }),
                      ),
                    ],
                  ),
                ),
              ),
            ),
            Padding(
              padding: EdgeInsets.only(left: 20, right: 20, bottom: 20),
              child: SizedBox(
                width: 360,
                height: 45,
                child: TextButton(
                    style: TextButton.styleFrom(
                        textStyle: const TextStyle(fontSize: 18),
                        shape: RoundedRectangleBorder(
                            borderRadius: BorderRadius.circular(20)),
                        primary: Colors.white,
                        backgroundColor:
                            const Color.fromARGB(255, 118, 17, 28)),
                    onPressed: () async {
                      if (_formKey.currentState!.validate()) {
                        try {
                          // _response = book(
                          //     email: _email,
                          //     attractionId: widget.model.id,
                          //     quantity: _jumlahTiket);
                          await book(
                              email: _email,
                              attractionId: widget.model.id,
                              quantity: _jumlahTiket);

                          print(_response.toString());

                          Navigator.push(
                              context,
                              MaterialPageRoute(
                                builder: (context) => RingkasanScreen(
                                    booking: _response?['bookingCodes'][0]
                                        ['bookingCode']),
                              ));
                        } catch (e) {
                          print(e);
                        }
                        // ScaffoldMessenger.of(context).showSnackBar(
                        //   SnackBar(content: Text("${_response.toString()}")),
                        // );
                      }
                    },
                    child: const Text('Pesan Sekarang')),
              ),
            ),
          ],
        ),
      ),
    );
  }
}
