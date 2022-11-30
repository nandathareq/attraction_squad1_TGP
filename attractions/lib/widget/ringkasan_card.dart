import 'package:attractions/widget/dropdown_item.dart';
import 'package:flutter/material.dart';
import 'package:intl/intl.dart';

class RingkasanCard extends StatelessWidget {
  final String bookingCode;
  final double total;
  final List<dynamic> items;

  const RingkasanCard(
      {Key? key,
      required this.bookingCode,
      required this.total,
      required this.items});

  @override
  Widget build(BuildContext context) {
    final format = new NumberFormat("#,##0", "en_US");
    final ButtonStyle gaya = ElevatedButton.styleFrom(
        shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(20)),
        textStyle: const TextStyle(fontSize: 20),
        backgroundColor: const Color.fromARGB(255, 118, 17, 28));

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
                                  fontSize: 14, fontWeight: FontWeight.normal),
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
                  child: Text('Pembayaran dari '),
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
                child: DropdownItem(),
              ),
            ),
            Row(
              children: [
                Padding(
                  padding: EdgeInsets.only(left: 20),
                  child: Text('Detail Pembayaran '),
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
                                '0001',
                                style: TextStyle(fontWeight: FontWeight.bold),
                              )),
                        ],
                      ),
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
                                'Monumen Nasional',
                                style: TextStyle(fontWeight: FontWeight.bold),
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
                                '1 Pax',
                                style: TextStyle(fontWeight: FontWeight.bold),
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
                                '6 Desember 2022',
                                style: TextStyle(fontWeight: FontWeight.bold),
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
                              padding:
                                  EdgeInsets.only(left: 20, top: 5, bottom: 10),
                              child: Text(
                                'Rp. 100.000',
                                style: TextStyle(fontWeight: FontWeight.bold),
                              )),
                        ],
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
                    width: 300,
                    height: 40,
                    child: ElevatedButton(
                      style: gaya,
                      onPressed: () {},
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
