import 'dart:convert';
import 'package:attractions/main.dart';
import 'package:attractions/screen/ringkasan_screen.dart';
import 'package:http/http.dart' as http;

import 'package:counter/counter.dart';
import 'package:flutter/cupertino.dart';

import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:intl/intl.dart';

import '../model/attraction_model.dart';

class BookScreen extends StatefulWidget {
  final AttractionModel model;
  const BookScreen({super.key, required this.model});

  @override
  State<BookScreen> createState() => _BookScreenState();
}

class _BookScreenState extends State<BookScreen> {
  final _formKey = GlobalKey<FormState>();

  num _jumlahTiket = 1;
  DateTime _tanggal = DateTime.now();
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
      Uri.parse('http://10.0.2.2:5000/api/v1/ticket/book'),
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

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text("Selesaikan Pemesananmu"),
        centerTitle: true,
        backgroundColor: const Color.fromARGB(255, 118, 17, 28),
      ),
      body: Container(
        padding: const EdgeInsets.all(20),
        child: ListView(
          children: [
            const Text(
              "Detail Pesanan",
              style: TextStyle(fontSize: 20, fontWeight: FontWeight.bold),
            ),
            Container(
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
              child: Column(children: [
                Row(
                  children: [
                    SizedBox(
                      height: 80,
                      child: Image.network(widget.model.picture),
                    ),
                    Text(
                      widget.model.placeName,
                      style: const TextStyle(
                          fontSize: 20, fontWeight: FontWeight.bold),
                    )
                  ],
                ),
                const Divider(
                  color: Colors.black,
                  thickness: 1,
                ),
                Container(
                  height: 50,
                  child: Row(
                    children: [
                      const Text("pilih jumlah"),
                      Container(
                        width: 200,
                        child: Counter(
                          min: 1,
                          max: 50,
                          bound: 1,
                          step: 1,
                          onValueChanged: ((value) {
                            _jumlahTiket = value;
                          }),
                        ),
                      )
                    ],
                  ),
                ),
                Column(
                  children: [
                    const Text("Pilih tanggal"),
                    Container(
                      height: 80,
                      child: CupertinoDatePicker(
                          mode: CupertinoDatePickerMode.date,
                          initialDateTime: DateTime.now(),
                          // minimumDate: DateTime.now(),
                          onDateTimeChanged: (val) {
                            _tanggal = val;
                          }),
                    )
                  ],
                )
              ]),
            ),
            const Text(
              "Detail Pemesan",
              style: TextStyle(fontSize: 20, fontWeight: FontWeight.bold),
            ),
            Container(
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
                          // controller: _nameController,
                          decoration: const InputDecoration(
                              border: OutlineInputBorder(),
                              labelText: 'Nama anda'),
                          onChanged: ((value) => _name = value),
                          validator: (value) {
                            _name = value;
                            if (value == null || value.isEmpty) {
                              return 'Masukkan nama anda';
                            }

                            return null;
                          }),
                    ),
                    Padding(
                      padding: const EdgeInsets.all(8.0),
                      child: TextFormField(
                          initialValue: userEmailGlobal,
                          // controller: _emailController,
                          decoration: const InputDecoration(
                              border: OutlineInputBorder(),
                              labelText: 'Alamat email'),
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
                              border: OutlineInputBorder(),
                              labelText: 'No ponsel'),
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
            TextButton(
                style: TextButton.styleFrom(
                    primary: Colors.white,
                    backgroundColor: const Color.fromARGB(255, 118, 17, 28)),
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
                child: const Text('Pesan')),
          ],
        ),
      ),
    );
  }
}
