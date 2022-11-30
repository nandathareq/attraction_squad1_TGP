import 'package:flutter/material.dart';
import '../widget/ringkasan_card.dart';
import 'package:provider/provider.dart';

import '../provider/reservation_detail_provider.dart';

class RingkasanScreen extends StatefulWidget {
  final String booking;
  const RingkasanScreen({super.key, required this.booking});

  @override
  State<RingkasanScreen> createState() => _RingkasanScreen();
}

class _RingkasanScreen extends State<RingkasanScreen> {
  bool _init = true;
  bool _isLoading = false;

  @override
  void didChangeDependencies() {
    super.didChangeDependencies();

    if (_init) {
      setState(() {
        _isLoading = true;
      });
      Provider.of<ReservationProvider>(context)
          .fetchCodeBoking(widget.booking)
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
    return Scaffold(
      appBar: AppBar(
        title: const Center(
          child: Text('Ringkasan'),
        ),
        backgroundColor: const Color.fromARGB(255, 118, 17, 28),
      ),
      body: FutureBuilder(
        future: Provider.of<ReservationProvider>(context, listen: false)
            .fetchCodeBoking(widget.booking),
        builder: (ctx, dataSnapshot) {
          if (dataSnapshot.connectionState == ConnectionState.waiting) {
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
              return Consumer<ReservationProvider>(
                builder: (ctx, reser, ch) {
                  final resersDatas = reser.resers;

                  return ListView(
                    children: resersDatas
                        .map(
                          (ringkas) => RingkasanCard(
                              bookingCode: ringkas.bookingCode,
                              total: ringkas.total,
                              items: ringkas.items),
                        )
                        .toList(),
                  );
                },
              );
            }
          }
        },
      ),
    );
  }
}
