import 'package:flutter/material.dart';
import '../widget/ringkasan_card.dart';

class RingkasanScreen extends StatefulWidget {
  @override
  _RingkasanScreen createState() {
    return _RingkasanScreen();
  }
}

class _RingkasanScreen extends State<RingkasanScreen> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Center(
          child: Text('Ringkasan'),
        ),
        backgroundColor: const Color.fromARGB(255, 118, 17, 28),
      ),
      body: ListView(
        children: [
          RingkasanCard(),
        ],
      ),
    );
  }
}
