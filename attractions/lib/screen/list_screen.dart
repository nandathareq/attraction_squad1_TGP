import 'package:flutter/material.dart';

import '../provider/attraction_provider.dart';
import 'package:provider/provider.dart';
import '../widget/list_card.dart';

class ListScreen extends StatefulWidget {
  @override
  _ListScreen createState() {
    return _ListScreen();
  }
}

class _ListScreen extends State<ListScreen> {
  bool _isLoading = false;
  bool _init = true;

  final _scaffold = GlobalKey<ScaffoldState>();

  @override
  void didChangeDependencies() {
    super.didChangeDependencies();

    if (_init) {
      setState(() {
        _isLoading = true;
      });
      Provider.of<AttractionProvider>(context)
          .fetchAndSetAttractions()
          .then((_) {})
          .catchError((err) {})
          .whenComplete(() {
        _init = false;
        setState(() {
          _isLoading = false;
        });
      });
    }
  }

  @override
  Widget build(BuildContext context) {
    return DefaultTabController(
      initialIndex: 0,
      length: 2,
      child: Scaffold(
        appBar: AppBar(
          title: const Text('Attraction'),
          centerTitle: true,
          actions: [
            IconButton(
                onPressed: () => {
                      showModalBottomSheet(
                          context: context,
                          builder: (BuildContext context) {
                            return Container(
                              height: 1000,
                            );
                          })
                    },
                icon: Icon(Icons.sort))
          ],
          backgroundColor: const Color.fromARGB(255, 118, 17, 28),
          bottom: PreferredSize(
            preferredSize: const TabBar(
              tabs: <Widget>[
                Tab(
                  icon: Icon(Icons.pin_drop_outlined),
                  text: "Attraction",
                ),
                Tab(
                  icon: Icon(Icons.map_outlined),
                  text: "Itinerary",
                )
              ],
            ).preferredSize,
            child: const Material(
              color: Colors.white,
              child: TabBar(
                indicatorColor: Color.fromARGB(255, 118, 17, 28),
                tabs: <Widget>[
                  Tab(
                    icon: Icon(Icons.pin_drop_outlined,
                        color: Color.fromARGB(255, 118, 17, 28)),
                    child: Text('Attraction',
                        style:
                            TextStyle(color: Color.fromARGB(255, 118, 17, 28))),
                  ),
                  Tab(
                    icon: Icon(
                      Icons.map_outlined,
                      color: Color.fromARGB(255, 118, 17, 28),
                    ),
                    child: Text(
                      "Itinerary",
                      style: TextStyle(color: Color.fromARGB(255, 118, 17, 28)),
                    ),
                  )
                ],
              ),
            ),
          ),
        ),
        body: TabBarView(
          children: <Widget>[
            Center(
              child: FutureBuilder(
                future: Provider.of<AttractionProvider>(context, listen: false)
                    .fetchAndSetAttractions(),
                builder: (ctx, dataSnapshot) {
                  if (dataSnapshot.connectionState == ConnectionState.waiting) {
                    return const Center(
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
                      return Consumer<AttractionProvider>(
                        builder: (ctx, attraction, ch) {
                          final attractionDatas = attraction.attractions;

                          return GridView.count(
                            physics: const ScrollPhysics(),
                            childAspectRatio: 0.58,
                            crossAxisCount: 2,
                            children: attractionDatas
                                .map(
                                  (attraction) => ListCard(
                                      key: ValueKey(attraction.id),
                                      id: attraction.id,
                                      placeName: attraction.placeName,
                                      description: attraction.description,
                                      category: attraction.category,
                                      city: attraction.city,
                                      price: attraction.price,
                                      lattitude: attraction.lattitude,
                                      longtitude: attraction.lattitude,
                                      openHour: attraction.openHour,
                                      closeHour: attraction.closeHour,
                                      placeRating: attraction.placeRating,
                                      fasilities: attraction.fasilities,
                                      contactPerson: attraction.contactPerson,
                                      picture: attraction.picture),
                                )
                                .toList(),
                          );
                        },
                      );
                    }
                  }
                },
              ),
            ),
            const Center(
              child: Text('baru'),
            ),
          ],
        ),
      ),
    );
  }
}
