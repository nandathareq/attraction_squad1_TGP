import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

import '../provider/reservation_detail_provider.dart';

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
    return Scaffold(
      body: Container(
          padding: const EdgeInsets.all(10),
          color: const Color.fromARGB(255, 118, 17, 28),
          child: Column(
            children: [
              Row(
                children: [
                  TextButton.icon(
                      onPressed: (() {}),
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
                              const Icon(Icons.check),
                              const Text(
                                "Sukses!",
                                style: TextStyle(
                                    fontSize: 10, color: Colors.black),
                              ),
                              const Text(
                                "Transaksi Anda Telah Berhasil",
                                style: TextStyle(
                                    fontSize: 10, color: Colors.black),
                              ),
                              const Text("-----------------------------------"),
                              const Icon(Icons.access_alarm),
                              const Text("NOMINAL"),
                              Text(data.total),
                              Padding(
                                padding: const EdgeInsets.all(30),
                                child: Column(
                                  crossAxisAlignment: CrossAxisAlignment.start,
                                  children: [
                                    Row(children: const [
                                      Text("Pembayaran Ke"),
                                      Spacer(),
                                      Text("SQ1.COM")
                                    ]),
                                    Row(
                                      children: [
                                        Column(
                                          crossAxisAlignment:
                                              CrossAxisAlignment.start,
                                          children: [
                                            const Text("Waktu Transaksi"),
                                            Text(data.date)
                                          ],
                                        ),
                                        const Spacer(),
                                        Column(
                                            crossAxisAlignment:
                                                CrossAxisAlignment.start,
                                            children: [
                                              const Text("ID Transaksi"),
                                              Text(data.idTransaksi)
                                            ]),
                                      ],
                                    ),
                                    Column(
                                      crossAxisAlignment:
                                          CrossAxisAlignment.start,
                                      children: [
                                        Column(
                                            crossAxisAlignment:
                                                CrossAxisAlignment.start,
                                            children: [
                                              const Text("Dibayar oleh"),
                                              Text(data.nasabah)
                                            ]),
                                        Column(
                                            crossAxisAlignment:
                                                CrossAxisAlignment.start,
                                            children: [
                                              const Text(
                                                  "Rekening Sumber Dana"),
                                              Text(data.rekening)
                                            ]),
                                        Column(
                                            crossAxisAlignment:
                                                CrossAxisAlignment.start,
                                            children: [
                                              const Text("Kode Pemesanan"),
                                              Text(data.kodeBooking)
                                            ]),
                                        Column(
                                            crossAxisAlignment:
                                                CrossAxisAlignment.start,
                                            children: [
                                              const Text("Total Pembayaran"),
                                              Text(data.total)
                                            ])
                                      ],
                                    )
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
                    onPressed: () {},
                    child: const Text(
                      "Lihat Tiket",
                      style: TextStyle(color: Colors.black),
                    )),
              )
            ],
          )),
    );
  }
}
