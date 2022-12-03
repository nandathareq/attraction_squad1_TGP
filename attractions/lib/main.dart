import 'package:attractions/provider/attraction_provider.dart';
import 'package:attractions/provider/gettiket_provider.dart';
import 'package:attractions/provider/getinvoice_provider.dart';
import 'package:attractions/provider/reservation_detail_provider.dart';
import 'package:attractions/screen/get_tiket_screen.dart';
import 'package:attractions/screen/list_screen.dart';
import 'package:attractions/screen/ringkasan_screen.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

void main() {
  runApp(const MyApp());
}

const int userIdGlobal = 1;
const int userIdRekeningGlobal = 2;
const String userEmailGlobal = "faishal.fachtur@gmail.com";
const String userNameGlobal = "Faishal Fachtur";
const String userMobileNumberGlobal = "0856454327854";

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MultiProvider(
      providers: [
        ChangeNotifierProvider(
          create: (_) => AttractionProvider(),
        ),
        ChangeNotifierProvider(create: (_) => ReservationProvider()),
        ChangeNotifierProvider(
          create: (context) => GetTiketProvider(),
        ),
        ChangeNotifierProvider(
          create: (context) => InvoiceProvider(),
        ),
      ],
      child: const MaterialApp(
        title: 'Attractions',
        home: MyHomePage(title: 'Lifestyle'),
      ),
    );
  }
}

class MyHomePage extends StatefulWidget {
  const MyHomePage({super.key, required this.title});

  final String title;

  @override
  State<MyHomePage> createState() => _MyHomePageState();
}

class _MyHomePageState extends State<MyHomePage> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        shape: RoundedRectangleBorder(
            borderRadius: BorderRadius.vertical(bottom: Radius.circular(20))),
        title: Center(child: Text(widget.title)),
        backgroundColor: const Color.fromARGB(255, 118, 17, 28),
      ),
      body: GridView.count(
        primary: false,
        padding: const EdgeInsets.all(4),
        mainAxisSpacing: 4,
        crossAxisCount: 4,
        children: [
          Container(
            padding: const EdgeInsets.all(15),
            child: Center(
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.center,
                children: const [
                  Icon(
                    Icons.restaurant_menu_outlined,
                    size: 47.0,
                  ),
                  SizedBox(height: 3),
                  Text('Kuliner'),
                ],
              ),
            ),
          ),
          InkWell(
            onTap: () {
              Navigator.of(context)
                  .push(MaterialPageRoute(builder: (context) => ListScreen()));
            },
            child: Container(
              padding: const EdgeInsets.all(15),
              child: Center(
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.center,
                  children: const [
                    Icon(
                      Icons.attractions_outlined,
                      size: 47.0,
                    ),
                    SizedBox(height: 3),
                    Text('Atraksi'),
                  ],
                ),
              ),
            ),
          ),
          Container(
            padding: const EdgeInsets.all(15),
            child: Center(
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.center,
                children: const [
                  Icon(
                    Icons.movie_creation_outlined,
                    size: 47.0,
                  ),
                  SizedBox(height: 3),
                  Text('Film'),
                ],
              ),
            ),
          ),
          Container(
            padding: const EdgeInsets.all(15),
            child: Center(
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.center,
                children: const [
                  Icon(
                    Icons.hotel_outlined,
                    size: 47.0,
                  ),
                  SizedBox(height: 3),
                  Text('Hotel'),
                ],
              ),
            ),
          ),
          Container(
            padding: const EdgeInsets.all(15),
            child: Center(
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.center,
                children: const [
                  Icon(
                    Icons.event,
                    size: 47.0,
                  ),
                  SizedBox(height: 3),
                  Text('Acara'),
                ],
              ),
            ),
          )
        ],
      ),
    );
  }
}
