import 'package:flutter/material.dart';

import '../widget/get_tiket_card.dart';
import 'package:provider/provider.dart';
import 'package:attractions/screen/list_screen.dart';
import '../provider/gettiket_provider.dart';

class GetTiketScreen extends StatefulWidget {
  final String booking;
  const GetTiketScreen({super.key, required this.booking});

  @override
  State<GetTiketScreen> createState() => _GetTiketScreen();
}

class _GetTiketScreen extends State<GetTiketScreen> {
  bool _init = true;
  bool _isLoading = false;

  @override
  void didChangeDependencies() {
    super.didChangeDependencies();

    if (_init) {
      setState(() {
        _isLoading = true;
      });
      Provider.of<GetTiketProvider>(context)
          .fetchGetTikets(widget.booking)
          .then((_) {})
          .catchError((err) {
        // print(err);
      }).whenComplete(() {
        _init = false;
        setState(() {
          _isLoading = false;
        });
      });
    }
  }

  @override
  Widget build(BuildContext context) {
    // TODO: implement build
    return Scaffold(
      appBar: AppBar(
        shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(25)),
        title: Center(
          child: Text('Detail Tiket'),
        ),
        backgroundColor: const Color.fromARGB(255, 118, 17, 28),
        actions: [
          IconButton(
              onPressed: () {
                Navigator.of(context).pushAndRemoveUntil(
                    MaterialPageRoute(builder: (context) => ListScreen()),
                    (Route<dynamic> route) => false);
              },
              icon: Icon(
                Icons.home,
                color: Colors.white,
              ))
        ],
      ),
      body: ListView(
        children: [
          Center(
            child: Column(
              children: [
                FutureBuilder(
                  future: Provider.of<GetTiketProvider>(context, listen: false)
                      .fetchGetTikets(widget.booking),
                  builder: (ctx, dataSnapshot) {
                    if (dataSnapshot.connectionState ==
                        ConnectionState.waiting) {
                      return Center(
                        child: CircularProgressIndicator(),
                      );
                    } else {
                      if (dataSnapshot.error != null) {
                        return const Center(
                          child: Text(
                            'Something went wrong',
                            style: TextStyle(color: Colors.red),
                          ),
                        );
                      } else {
                        return Consumer<GetTiketProvider>(
                          builder: (ctx, tiket, ch) {
                            final tiketsDatas = tiket.tikets;

                            return Column(
                              children: tiketsDatas
                                  .map((tiket) => GetTiketCard(
                                      bookingCode: tiket.bookingCode,
                                      placeName: tiket.placeName,
                                      ticketCode: tiket.ticketCode,
                                      attractionDate: tiket.attractionDate))
                                  .toList(),
                            );
                          },
                        );
                      }
                    }
                  },
                ),
                Row(
                  children: [
                    Padding(
                      padding: EdgeInsets.only(left: 20, top: 20),
                      child: Text(
                        'Detail Pemesan',
                        style: TextStyle(
                            fontWeight: FontWeight.bold, fontSize: 16),
                      ),
                    ),
                  ],
                ),
                FutureBuilder(
                  future: Provider.of<GetTiketProvider>(context, listen: false)
                      .fetchGetTikets(widget.booking),
                  builder: (ctx, dataSnapshot) {
                    if (dataSnapshot.connectionState ==
                        ConnectionState.waiting) {
                      return Center(
                        child: CircularProgressIndicator(),
                      );
                    } else {
                      if (dataSnapshot.error != null) {
                        return const Center(
                          child: Text(
                            'Something went wrong',
                            style: TextStyle(color: Colors.red),
                          ),
                        );
                      } else {
                        return Consumer<GetTiketProvider>(
                          builder: (ctx, user, ch) {
                            final usersDatas = user.users;

                            return Padding(
                              padding: EdgeInsets.only(
                                  left: 20, right: 20, top: 5, bottom: 10),
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
                                      children: [
                                        Padding(
                                          padding: EdgeInsets.only(
                                              left: 15, top: 5, bottom: 5),
                                          child: Text(
                                            usersDatas[0].userName,
                                            style: TextStyle(
                                                fontSize: 16,
                                                fontWeight: FontWeight.bold),
                                          ),
                                        ),
                                      ],
                                    ),
                                    Row(
                                      children: [
                                        Padding(
                                          padding: EdgeInsets.only(
                                              left: 15, top: 5, bottom: 5),
                                          child: Text(
                                            usersDatas[0].userMobileNumber,
                                            style: TextStyle(
                                                fontSize: 16,
                                                fontWeight: FontWeight.normal),
                                          ),
                                        ),
                                      ],
                                    ),
                                    Row(
                                      children: [
                                        Padding(
                                          padding: EdgeInsets.only(
                                              left: 15, top: 5, bottom: 5),
                                          child: Text(
                                            usersDatas[0].userEmail,
                                            style: TextStyle(
                                                fontSize: 16,
                                                fontWeight: FontWeight.normal),
                                          ),
                                        ),
                                      ],
                                    ),
                                  ],
                                ),
                              ),
                            );
                          },
                        );
                      }
                    }
                  },
                ),
                Divider(
                  thickness: 3,
                  indent: 20,
                  endIndent: 20,
                ),
                Center(
                  child: Column(
                    children: [
                      Padding(
                        padding: EdgeInsets.only(left: 20, right: 20, top: 10),
                        child: Icon(Icons.contact_mail_outlined, size: 100),
                      ),
                      Padding(
                        padding:
                            EdgeInsets.only(left: 20, right: 20, bottom: 10),
                        child: Text(
                            'Tunjukan nomor tiket dan \nidentitas pada saat check-in'),
                      ),
                    ],
                  ),
                ),
                Divider(
                  thickness: 3,
                  indent: 20,
                  endIndent: 20,
                ),
                Padding(
                  padding: EdgeInsets.only(left: 20, right: 20, bottom: 10),
                  child: Text(
                    'Untuk dapatkan e-tiket, silahkan hubungi',
                    style: TextStyle(fontWeight: FontWeight.bold),
                  ),
                ),
                Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    Column(
                      children: [
                        Row(
                          children: [
                            Padding(
                              padding: EdgeInsets.only(
                                  top: 15, right: 10, bottom: 20, left: 20),
                              child: Icon(Icons.call),
                            ),
                            Column(
                              children: [
                                Row(
                                  children: [
                                    Padding(
                                      padding:
                                          EdgeInsets.only(top: 15, right: 15),
                                      child: Text(
                                        'Customer Service',
                                        style: TextStyle(
                                            fontSize: 14,
                                            fontWeight: FontWeight.normal),
                                      ),
                                    ),
                                  ],
                                ),
                                Row(
                                  children: [
                                    Padding(
                                      padding: EdgeInsets.only(
                                          right: 15, bottom: 20),
                                      child: Text(
                                        '+88799678578',
                                        style: TextStyle(
                                            fontSize: 14,
                                            fontWeight: FontWeight.bold),
                                      ),
                                    ),
                                  ],
                                ),
                              ],
                            ),
                          ],
                        ),
                      ],
                    ),
                    Column(
                      children: [
                        Row(
                          children: [
                            Padding(
                              padding: EdgeInsets.only(top: 15, right: 15),
                              child: Text(
                                'Email Customer Service',
                                style: TextStyle(
                                    fontSize: 14,
                                    fontWeight: FontWeight.normal),
                              ),
                            ),
                          ],
                        ),
                        Row(
                          children: [
                            Padding(
                              padding: EdgeInsets.only(right: 15, bottom: 20),
                              child: Text(
                                'Help@SQ1.com',
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
              ],
            ),
          ),
        ],
      ),

      // FutureBuilder(
      //   future: Provider.of<GetTiketProvider>(context, listen: false)
      //       .fetchGetTikets(widget.booking),
      //   builder: (ctx, dataSnapshot) {
      //     if (dataSnapshot.connectionState == ConnectionState.waiting) {
      //       return Center(
      //         child: CircularProgressIndicator(),
      //       );
      //     } else {
      //       if (dataSnapshot.error != null) {
      //         return const Center(
      //           child: Text(
      //             'Something went wrong',
      //             style: TextStyle(color: Colors.red),
      //           ),
      //         );
      //       } else {
      //         return Consumer<GetTiketProvider>(
      //           builder: (ctx, tiket, ch) {
      //             final tikestDatas = tiket.tikets;

      //             return ListView(
      //               children: tikestDatas.map(

      //                 (tikets) => GetTiketCard(
      //                   bookingCode: tikets.bookingCode, placeName: tikets.placeName, ticketCode: tikets.ticketCode, attractionDate: tikets.attractionDate).

      //               ).toList(),

      //             );
      //           },
      //         );
      //       }
      //     }
      //   },
      // ),
    );
  }
}
