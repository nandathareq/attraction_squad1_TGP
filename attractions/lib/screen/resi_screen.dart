import 'package:attractions/screen/get_tiket_screen.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:attractions/screen/list_screen.dart';
import '../provider/reservation_detail_provider.dart';
import 'package:intl/intl.dart' as intl;

intl.DateFormat dateFormat = intl.DateFormat('yyyy MMM dd HH:mm');

class ResiScreen extends StatefulWidget {
  final String bookingCode;
  const ResiScreen({super.key, required this.bookingCode});

  @override
  State<ResiScreen> createState() => _ResiScreenState();
}

class _ResiScreenState extends State<ResiScreen> {
  @override
  void didChangeDependencies() {
    super.didChangeDependencies();

    Provider.of<ReservationProvider>(context)
        .fetchResi(bookingCode: widget.bookingCode)
        .then((_) {})
        .catchError((err) {})
        .whenComplete(() {
      setState(() {});
    });
  }

  @override
  Widget build(BuildContext context) {
    final format = new intl.NumberFormat("#,##0", "en_US");
    return Scaffold(
      body: Container(
          // padding: const EdgeInsets.all(10),
          color: const Color.fromARGB(255, 118, 17, 28),
          child: ListView(
            children: [
              // const SizedBox(
              //   height: 50,
              // ),
              Row(
                children: [
                  TextButton.icon(
                      onPressed: (() {
                        Navigator.of(context).pushAndRemoveUntil(
                            MaterialPageRoute(
                                builder: (context) => ListScreen()),
                            (Route<dynamic> route) => false);
                      }),
                      icon: const Icon(
                        Icons.close,
                        size: 20,
                        color: Colors.white,
                      ),
                      label: const Text(
                        "Tutup",
                        style: TextStyle(color: Colors.white, fontSize: 20),
                      )),
                  const Spacer(),
                  TextButton(
                      onPressed: () {},
                      child: const Text(
                        "Simpan",
                        style: TextStyle(color: Colors.white, fontSize: 20),
                      ))
                ],
              ),
              const SizedBox(
                height: 30,
              ),
              Consumer<ReservationProvider>(
                builder: (context, value, child) {
                  final data = value.dataResi;
                  return data == null
                      ? Text("gagal")
                      : Container(
                          width: double.infinity,
                          margin: const EdgeInsets.fromLTRB(20, 0, 20, 0),
                          decoration: BoxDecoration(
                            borderRadius: BorderRadius.circular(30),
                            color: Colors.white,
                          ),
                          child: Column(
                            children: [
                              Padding(
                                padding: EdgeInsets.only(top: 15, bottom: 5),
                                child: Image.asset('assets/images/cek.png',
                                    width: 70),
                              ),
                              const Text(
                                "Sukses!",
                                style: TextStyle(
                                    fontSize: 25,
                                    color: Colors.green,
                                    fontWeight: FontWeight.bold),
                              ),
                              Padding(padding: EdgeInsets.only(top: 10)),
                              const Text(
                                "Transaksi Anda Telah Berhasil",
                                style: TextStyle(
                                    fontSize: 14, color: Colors.black),
                              ),
                              Padding(padding: EdgeInsets.only(top: 10)),
                              const Text(
                                  "-------------------------------------------------------------------------"),
                              Padding(
                                padding: EdgeInsets.only(bottom: 5, top: 5),
                                child: Image.asset(
                                  'assets/images/octo.png',
                                  width: 120,
                                ),
                              ),
                              const Text("NOMINAL",
                                  style:
                                      TextStyle(fontWeight: FontWeight.bold)),
                              Padding(
                                padding: EdgeInsets.only(top: 10),
                                child: Text(
                                  "Rp.${format.format(data.total)}",
                                  style: TextStyle(
                                      fontSize: 25,
                                      fontWeight: FontWeight.bold),
                                ),
                              ),
                              Padding(
                                padding: EdgeInsets.all(30),
                                child: Column(
                                  children: [
                                    Row(
                                      mainAxisAlignment:
                                          MainAxisAlignment.spaceBetween,
                                      children: [
                                        Column(
                                          children: [
                                            Text(
                                              'Pembayaran Ke',
                                              style: TextStyle(
                                                  fontWeight: FontWeight.bold),
                                            ),
                                          ],
                                        ),
                                        Column(
                                          children: [
                                            Text(
                                              'SQ1.COM',
                                              style: TextStyle(
                                                  fontWeight:
                                                      FontWeight.normal),
                                            ),
                                          ],
                                        ),
                                      ],
                                    ),
                                    Padding(
                                      padding: EdgeInsets.only(top: 15),
                                      child: Row(
                                        mainAxisAlignment:
                                            MainAxisAlignment.spaceBetween,
                                        children: [
                                          Column(
                                            children: [
                                              Row(
                                                children: [
                                                  Text(
                                                    'Waktu Transaksi',
                                                    style: TextStyle(
                                                        fontWeight:
                                                            FontWeight.bold),
                                                  ),
                                                ],
                                              ),
                                            ],
                                          ),
                                          Column(
                                            children: [
                                              Text(
                                                'ID Transaksi',
                                                style: TextStyle(
                                                    fontWeight:
                                                        FontWeight.bold),
                                              ),
                                            ],
                                          ),
                                        ],
                                      ),
                                    ),
                                    Padding(
                                      padding: EdgeInsets.only(top: 5),
                                      child: Row(
                                        mainAxisAlignment:
                                            MainAxisAlignment.spaceBetween,
                                        children: [
                                          Column(
                                            children: [
                                              Row(
                                                children: [
                                                  Text(dateFormat.format(
                                                      DateTime.parse(
                                                          data.date)))
                                                ],
                                              ),
                                            ],
                                          ),
                                          Column(
                                            children: [Text(data.idTransaksi)],
                                          ),
                                        ],
                                      ),
                                    ),
                                    Padding(
                                      padding: EdgeInsets.only(top: 15),
                                      child: Row(
                                        children: [
                                          Column(
                                            children: [
                                              Text(
                                                'Dibayar oleh',
                                                style: TextStyle(
                                                    fontWeight:
                                                        FontWeight.bold),
                                              ),
                                            ],
                                          ),
                                        ],
                                      ),
                                    ),
                                    Padding(
                                      padding: EdgeInsets.only(top: 5),
                                      child: Row(
                                        children: [
                                          Column(
                                            children: [
                                              Text(
                                                data.nasabah,
                                                style: TextStyle(
                                                    fontWeight:
                                                        FontWeight.normal),
                                              ),
                                            ],
                                          ),
                                        ],
                                      ),
                                    ),
                                    Padding(
                                      padding: EdgeInsets.only(top: 15),
                                      child: Row(
                                        children: [
                                          Column(
                                            children: [
                                              Text(
                                                'Rekening Sumber Dana',
                                                style: TextStyle(
                                                    fontWeight:
                                                        FontWeight.bold),
                                              ),
                                            ],
                                          ),
                                        ],
                                      ),
                                    ),
                                    Padding(
                                      padding: EdgeInsets.only(top: 5),
                                      child: Row(
                                        children: [
                                          Column(
                                            children: [
                                              Text(
                                                data.rekening,
                                                style: TextStyle(
                                                    fontWeight:
                                                        FontWeight.normal),
                                              ),
                                            ],
                                          ),
                                        ],
                                      ),
                                    ),
                                    Padding(
                                      padding: EdgeInsets.only(top: 15),
                                      child: Row(
                                        children: [
                                          Column(
                                            children: [
                                              Text(
                                                'Kode Pemesanan',
                                                style: TextStyle(
                                                    fontWeight:
                                                        FontWeight.bold),
                                              ),
                                            ],
                                          ),
                                        ],
                                      ),
                                    ),
                                    Padding(
                                      padding: EdgeInsets.only(top: 5),
                                      child: Row(
                                        children: [
                                          Column(
                                            children: [
                                              Text(
                                                data.kodeBooking.toUpperCase(),
                                                style: TextStyle(
                                                    fontWeight:
                                                        FontWeight.normal),
                                              ),
                                            ],
                                          ),
                                        ],
                                      ),
                                    ),
                                    Padding(
                                      padding: EdgeInsets.only(top: 15),
                                      child: Row(
                                        children: [
                                          Column(
                                            children: [
                                              Text(
                                                'Total Pembayaran',
                                                style: TextStyle(
                                                    fontWeight:
                                                        FontWeight.bold),
                                              ),
                                            ],
                                          ),
                                        ],
                                      ),
                                    ),
                                    Padding(
                                      padding: EdgeInsets.only(top: 5),
                                      child: Row(
                                        children: [
                                          Column(
                                            children: [
                                              Text(
                                                "Rp. ${format.format(data.total)}",
                                                style: TextStyle(
                                                    fontWeight:
                                                        FontWeight.normal),
                                              ),
                                            ],
                                          ),
                                        ],
                                      ),
                                    ),
                                  ],
                                ),
                              ),
                            ],
                          ),
                        );
                },
              ),
              const SizedBox(
                height: 20,
              ),
              Container(
                height: 50,
                width: double.infinity,
                margin: const EdgeInsets.fromLTRB(20, 0, 20, 0),
                decoration: BoxDecoration(
                  borderRadius: BorderRadius.circular(30),
                  color: Colors.white,
                ),
                child: TextButton(
                    onPressed: () {
                      Navigator.push(
                          context,
                          MaterialPageRoute(
                            builder: (context) =>
                                GetTiketScreen(booking: widget.bookingCode),
                          ));
                    },
                    child: const Text(
                      "Lihat Tiket",
                      style: TextStyle(color: Colors.black),
                    )),
              ),
              SizedBox(
                height: 20,
              )
            ],
          )),
    );
  }
}
