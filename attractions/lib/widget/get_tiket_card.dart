import 'dart:ui';

import 'package:flutter/material.dart';

import 'package:intl/intl.dart';

DateFormat dateFormat = DateFormat('dd MMMM yyyy');

class GetTiketCard extends StatelessWidget {
  final String bookingCode;
  final String placeName;
  final String ticketCode;
  final String attractionDate;

  const GetTiketCard(
      {Key? key,
      required this.bookingCode,
      required this.placeName,
      required this.ticketCode,
      required this.attractionDate});

  @override
  Widget build(BuildContext context) {
    // TODO: implement build
    return Padding(
      padding: EdgeInsets.only(left: 20, right: 20, top: 15),
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
                    placeName.toUpperCase(),
                    style: TextStyle(fontSize: 18, fontWeight: FontWeight.bold),
                  ),
                ),
              ],
            ),
            Divider(
              thickness: 5,
              indent: 15,
              endIndent: 15,
            ),
            Row(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                Padding(
                  padding: EdgeInsets.only(top: 10, bottom: 5),
                  child: Text(
                    'Nomor Tiket',
                    style:
                        TextStyle(fontSize: 14, fontWeight: FontWeight.normal),
                  ),
                ),
              ],
            ),
            Row(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                Padding(
                  padding: EdgeInsets.only(top: 5, bottom: 5),
                  child: Text(
                    ticketCode,
                    style: TextStyle(fontSize: 36, fontWeight: FontWeight.bold),
                  ),
                ),
              ],
            ),
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                Column(
                  children: [
                    Padding(
                      padding: EdgeInsets.only(top: 15, left: 15, bottom: 5),
                      child: Text(
                        'Kode Pemesanan',
                        style: TextStyle(
                            fontSize: 14, fontWeight: FontWeight.normal),
                      ),
                    ),
                  ],
                ),
                Column(
                  children: [
                    Padding(
                      padding: EdgeInsets.only(top: 15, right: 15, bottom: 5),
                      child: Text(
                        bookingCode.toUpperCase(),
                        style: TextStyle(
                            fontSize: 14, fontWeight: FontWeight.bold),
                      ),
                    ),
                  ],
                ),
              ],
            ),
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                Column(
                  children: [
                    Padding(
                      padding: EdgeInsets.only(top: 5, left: 15, bottom: 10),
                      child: Text(
                        'Tanggal Tiket Masuk',
                        style: TextStyle(
                            fontSize: 14, fontWeight: FontWeight.normal),
                      ),
                    ),
                  ],
                ),
                Column(
                  children: [
                    Padding(
                      padding: EdgeInsets.only(top: 5, right: 15, bottom: 10),
                      child: Text(
                        dateFormat.format(DateTime.parse(attractionDate)),
                        style: TextStyle(
                            fontSize: 14, fontWeight: FontWeight.bold),
                      ),
                    ),
                  ],
                ),
              ],
            ),
          ],
        ),
      ),
    );

    // return ListView(
    //   children: [
    //     Center(
    //       child: Column(
    //         children: [
    //           Padding(
    //             padding: EdgeInsets.all(20),
    //             child: Container(
    //               margin: const EdgeInsets.fromLTRB(0, 10, 0, 10),
    //               padding: const EdgeInsets.all(10),
    //               decoration: BoxDecoration(
    //                 color: Colors.white,
    //                 boxShadow: [
    //                   BoxShadow(
    //                     color: Colors.grey.withOpacity(0.5),
    //                     spreadRadius: 5,
    //                     blurRadius: 7,
    //                     offset: const Offset(0, 0),
    //                   ),
    //                 ],
    //                 borderRadius: BorderRadius.circular(10),
    //               ),
    //               child: Column(
    //                 children: [
    //                   Row(
    //                     mainAxisAlignment: MainAxisAlignment.center,
    //                     children: [
    //                       Padding(
    //                         padding: EdgeInsets.only(top: 10, bottom: 5),
    //                         child: Text(
    //                           'KOTA TUA',
    //                           style: TextStyle(
    //                               fontSize: 18, fontWeight: FontWeight.bold),
    //                         ),
    //                       ),
    //                     ],
    //                   ),
    //                   Divider(
    //                     thickness: 5,
    //                     indent: 15,
    //                     endIndent: 15,
    //                   ),
    //                   Row(
    //                     mainAxisAlignment: MainAxisAlignment.center,
    //                     children: [
    //                       Padding(
    //                         padding: EdgeInsets.only(top: 10, bottom: 5),
    //                         child: Text(
    //                           'Nomor Tiket',
    //                           style: TextStyle(
    //                               fontSize: 14, fontWeight: FontWeight.normal),
    //                         ),
    //                       ),
    //                     ],
    //                   ),
    //                   Row(
    //                     mainAxisAlignment: MainAxisAlignment.center,
    //                     children: [
    //                       Padding(
    //                         padding: EdgeInsets.only(top: 5, bottom: 5),
    //                         child: Text(
    //                           '00001',
    //                           style: TextStyle(
    //                               fontSize: 36, fontWeight: FontWeight.bold),
    //                         ),
    //                       ),
    //                     ],
    //                   ),
    //                   Row(
    //                     mainAxisAlignment: MainAxisAlignment.spaceBetween,
    //                     children: [
    //                       Column(
    //                         children: [
    //                           Padding(
    //                             padding: EdgeInsets.only(
    //                                 top: 15, left: 15, bottom: 5),
    //                             child: Text(
    //                               'Kode Pemesanan',
    //                               style: TextStyle(
    //                                   fontSize: 14,
    //                                   fontWeight: FontWeight.normal),
    //                             ),
    //                           ),
    //                         ],
    //                       ),
    //                       Column(
    //                         children: [
    //                           Padding(
    //                             padding: EdgeInsets.only(
    //                                 top: 15, right: 15, bottom: 5),
    //                             child: Text(
    //                               'A1111',
    //                               style: TextStyle(
    //                                   fontSize: 14,
    //                                   fontWeight: FontWeight.bold),
    //                             ),
    //                           ),
    //                         ],
    //                       ),
    //                     ],
    //                   ),
    //                   Row(
    //                     mainAxisAlignment: MainAxisAlignment.spaceBetween,
    //                     children: [
    //                       Column(
    //                         children: [
    //                           Padding(
    //                             padding: EdgeInsets.only(
    //                                 top: 5, left: 15, bottom: 10),
    //                             child: Text(
    //                               'Tanggal Tiket Masuk',
    //                               style: TextStyle(
    //                                   fontSize: 14,
    //                                   fontWeight: FontWeight.normal),
    //                             ),
    //                           ),
    //                         ],
    //                       ),
    //                       Column(
    //                         children: [
    //                           Padding(
    //                             padding: EdgeInsets.only(
    //                                 top: 5, right: 15, bottom: 10),
    //                             child: Text(
    //                               '15 Desember 2022',
    //                               style: TextStyle(
    //                                   fontSize: 14,
    //                                   fontWeight: FontWeight.bold),
    //                             ),
    //                           ),
    //                         ],
    //                       ),
    //                     ],
    //                   ),
    //                 ],
    //               ),
    //             ),
    //           ),
    //           Row(
    //             children: [
    //               Padding(
    //                 padding: EdgeInsets.only(left: 20),
    //                 child: Text(
    //                   'Detail Pemesan',
    //                   style:
    //                       TextStyle(fontWeight: FontWeight.bold, fontSize: 16),
    //                 ),
    //               ),
    //             ],
    //           ),
    //           Padding(
    //             padding:
    //                 EdgeInsets.only(left: 20, right: 20, top: 5, bottom: 10),
    //             child: Container(
    //               margin: const EdgeInsets.fromLTRB(0, 10, 0, 10),
    //               padding: const EdgeInsets.all(10),
    //               decoration: BoxDecoration(
    //                 color: Colors.white,
    //                 boxShadow: [
    //                   BoxShadow(
    //                     color: Colors.grey.withOpacity(0.5),
    //                     spreadRadius: 5,
    //                     blurRadius: 7,
    //                     offset: const Offset(0, 0),
    //                   ),
    //                 ],
    //                 borderRadius: BorderRadius.circular(10),
    //               ),
    //               child: Column(
    //                 children: [
    //                   Row(
    //                     children: [
    //                       Padding(
    //                         padding:
    //                             EdgeInsets.only(left: 15, top: 5, bottom: 5),
    //                         child: Text(
    //                           'Sonya',
    //                           style: TextStyle(
    //                               fontSize: 16, fontWeight: FontWeight.bold),
    //                         ),
    //                       ),
    //                     ],
    //                   ),
    //                   Row(
    //                     children: [
    //                       Padding(
    //                         padding:
    //                             EdgeInsets.only(left: 15, top: 5, bottom: 5),
    //                         child: Text(
    //                           '+6285798098',
    //                           style: TextStyle(
    //                               fontSize: 16, fontWeight: FontWeight.normal),
    //                         ),
    //                       ),
    //                     ],
    //                   ),
    //                   Row(
    //                     children: [
    //                       Padding(
    //                         padding:
    //                             EdgeInsets.only(left: 15, top: 5, bottom: 5),
    //                         child: Text(
    //                           'Sonya',
    //                           style: TextStyle(
    //                               fontSize: 16, fontWeight: FontWeight.normal),
    //                         ),
    //                       ),
    //                     ],
    //                   ),
    //                 ],
    //               ),
    //             ),
    //           ),
    //           Divider(
    //             thickness: 3,
    //             indent: 20,
    //             endIndent: 20,
    //           ),
    //           Center(
    //             child: Column(
    //               children: [
    //                 Padding(
    //                   padding: EdgeInsets.only(left: 20, right: 20, top: 10),
    //                   child: Icon(Icons.contact_mail_outlined, size: 100),
    //                 ),
    //                 Padding(
    //                   padding: EdgeInsets.only(left: 20, right: 20, bottom: 10),
    //                   child: Text(
    //                       'Tunjukan nomor tiket dan \nidentitas pada saat check-in'),
    //                 ),
    //               ],
    //             ),
    //           ),
    //           Divider(
    //             thickness: 3,
    //             indent: 20,
    //             endIndent: 20,
    //           ),
    //           Padding(
    //             padding: EdgeInsets.only(left: 20, right: 20, bottom: 10),
    //             child: Text(
    //               'Untuk dapatkan e-tiket, silahkan hubungi',
    //               style: TextStyle(fontWeight: FontWeight.bold),
    //             ),
    //           ),
    //           Row(
    //             mainAxisAlignment: MainAxisAlignment.spaceBetween,
    //             children: [
    //               Column(
    //                 children: [
    //                   Row(
    //                     children: [
    //                       Padding(
    //                         padding: EdgeInsets.only(
    //                             top: 15, right: 10, bottom: 20, left: 20),
    //                         child: Icon(Icons.call),
    //                       ),
    //                       Column(
    //                         children: [
    //                           Row(
    //                             children: [
    //                               Padding(
    //                                 padding:
    //                                     EdgeInsets.only(top: 15, right: 15),
    //                                 child: Text(
    //                                   'Customer Service',
    //                                   style: TextStyle(
    //                                       fontSize: 14,
    //                                       fontWeight: FontWeight.normal),
    //                                 ),
    //                               ),
    //                             ],
    //                           ),
    //                           Row(
    //                             children: [
    //                               Padding(
    //                                 padding:
    //                                     EdgeInsets.only(right: 15, bottom: 20),
    //                                 child: Text(
    //                                   '+88799678578',
    //                                   style: TextStyle(
    //                                       fontSize: 14,
    //                                       fontWeight: FontWeight.bold),
    //                                 ),
    //                               ),
    //                             ],
    //                           ),
    //                         ],
    //                       ),
    //                     ],
    //                   ),
    //                 ],
    //               ),
    //               Column(
    //                 children: [
    //                   Row(
    //                     children: [
    //                       Padding(
    //                         padding: EdgeInsets.only(top: 15, right: 15),
    //                         child: Text(
    //                           'Email Customer Service',
    //                           style: TextStyle(
    //                               fontSize: 14, fontWeight: FontWeight.normal),
    //                         ),
    //                       ),
    //                     ],
    //                   ),
    //                   Row(
    //                     children: [
    //                       Padding(
    //                         padding: EdgeInsets.only(right: 15, bottom: 20),
    //                         child: Text(
    //                           'Help@SQ1.com',
    //                           style: TextStyle(
    //                               fontSize: 14, fontWeight: FontWeight.bold),
    //                         ),
    //                       ),
    //                     ],
    //                   ),
    //                 ],
    //               ),
    //             ],
    //           ),
    //         ],
    //       ),
    //     ),
    //   ],
    // );
  }
}
