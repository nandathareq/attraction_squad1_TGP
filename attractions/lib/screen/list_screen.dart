// ignore: import_of_legacy_library_into_null_safe
import 'package:attractions/main.dart';
import 'package:flutter/material.dart';
import 'package:group_button/group_button.dart';
import 'package:searchbar_animation/searchbar_animation.dart';
import '../provider/attraction_provider.dart';
import 'package:provider/provider.dart';
import '../provider/getinvoice_provider.dart';
import '../widget/invoice_card.dart';
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
  String? city = '';
  String? category = '';
  String? sortBy = '';
  bool? desc = false;

  @override
  void didChangeDependencies() {
    super.didChangeDependencies();

    if (_init) {
      setState(() {
        _isLoading = true;
      });

      Provider.of<AttractionProvider>(context)
          .fetchAndSetAttractions(
              cityParam: city,
              categoryParam: category,
              sortByParam: sortBy,
              descParam: desc)
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

  final controller = GroupButtonController(
      // selectedIndex: 0,
      // selectedIndexes: [0, 1, 2, 3, 4],
      // disabledIndexes: [10, 12, 13, 14, 15, 23],
      // onDisablePressed: (i) => print('Button #$i is disabled'),
      );

  @override
  Widget build(BuildContext context) {
    final controller = GroupButtonController();
    return DefaultTabController(
      initialIndex: 0,
      length: 3,
      child: Scaffold(
        floatingActionButtonLocation: FloatingActionButtonLocation.centerFloat,
        floatingActionButton: FloatingActionButton.extended(
          onPressed: () {
            showModalBottomSheet(
                isScrollControlled: true,
                shape: const RoundedRectangleBorder(
                  borderRadius: BorderRadius.only(
                    topRight: Radius.circular(30),
                    topLeft: Radius.circular(30),
                  ),
                ),
                context: context,
                builder: (context) {
                  return Column(
                    mainAxisSize: MainAxisSize.min,
                    children: <Widget>[
                      Padding(
                        padding: const EdgeInsets.fromLTRB(0, 30, 0, 15),
                        child: Container(
                          height: 5,
                          width: 100,
                          decoration: const BoxDecoration(
                              color: Colors.grey,
                              borderRadius:
                                  BorderRadius.all(Radius.circular(20))),
                          child: const Text(''),
                        ),
                      ),
                      ListTile(
                          title: const Center(
                            child: Text(
                              "Atraksi Berdasarkan Kota",
                              style: TextStyle(
                                  fontWeight: FontWeight.bold,
                                  color: Color.fromARGB(255, 118, 17, 28)),
                            ),
                          ),
                          subtitle: GroupButton(
                            options: const GroupButtonOptions(
                              selectedColor: Color.fromARGB(255, 118, 17, 28),
                            ),
                            isRadio: false,
                            onSelected: (val, index, isSelected) {
                              if (isSelected) {
                                setState(() {
                                  city = val;
                                });
                              } else {
                                setState(() {
                                  city = '';
                                });
                              }
                            },

                            // print('$index button is selected'),
                            buttons: const [
                              "Jakarta",
                              "Yogyakarta",
                              "Bandung",
                              "Semarang",
                              "Surabaya"
                            ],
                            maxSelected: 1,
                          )),
                      ListTile(
                          title: const Center(
                            child: Text(
                              "Atraksi Berdasarkan Kategori",
                              style: TextStyle(
                                  fontWeight: FontWeight.bold,
                                  color: Color.fromARGB(255, 118, 17, 28)),
                            ),
                          ),
                          subtitle: GroupButton(
                            options: const GroupButtonOptions(
                              selectedColor: Color.fromARGB(255, 118, 17, 28),
                            ),
                            isRadio: false,
                            onSelected: (val, index, isSelected) {
                              if (isSelected) {
                                setState(() {
                                  category = val;
                                });
                              } else {
                                setState(() {
                                  category = '';
                                });
                              }
                            },
                            buttons: const [
                              "Budaya",
                              "Bahari",
                              "Taman Hiburan",
                              "Cagar Alam",
                              "Pusat Perbelanjaan",
                              "Tempat Ibadah"
                            ],
                            maxSelected: 1,
                          )),
                      ListTile(
                          title: const Center(
                            child: Text(
                              "Urutkan Tempat Atraksi",
                              style: TextStyle(
                                  fontWeight: FontWeight.bold,
                                  color: Color.fromARGB(255, 118, 17, 28)),
                            ),
                          ),
                          subtitle: GroupButton(
                            options: const GroupButtonOptions(
                              selectedColor: Color.fromARGB(255, 118, 17, 28),
                            ),
                            isRadio: false,
                            onSelected: (val, index, isSelected) {
                              print('$index button is selected');
                              if (isSelected) {
                                setState(() {
                                  sortBy = val;
                                });
                              } else {
                                setState(() {
                                  sortBy = '';
                                });
                              }
                            },
                            buttons: const [
                              "Harga",
                              "Rating",
                            ],
                            maxSelected: 1,
                          )),
                      ListTile(
                          title: const Center(
                            child: Text(
                              "Urutkan Naik/Turun",
                              style: TextStyle(
                                  fontWeight: FontWeight.bold,
                                  color: Color.fromARGB(255, 118, 17, 28)),
                            ),
                          ),
                          subtitle: GroupButton(
                            options: const GroupButtonOptions(
                              selectedColor: Color.fromARGB(255, 118, 17, 28),
                            ),
                            isRadio: false,
                            onSelected: (val, index, isSelected) {
                              // print('$val button is selected');
                              if (isSelected) {
                                // print(val);
                                // print('$val button is selected');
                                // print("${val == 'Naik'}");
                                val == "Naik"
                                    ? setState(() {
                                        desc = false;
                                      })
                                    : setState(() {
                                        desc = true;
                                      });
                              } else {
                                setState(() {
                                  desc = false;
                                });
                              }
                            },
                            buttons: const [
                              "Naik",
                              "Turun",
                            ],
                            maxSelected: 1,
                          )),
                      const Padding(
                          padding: EdgeInsets.fromLTRB(10, 10, 10, 10),
                          child: Divider(
                            indent: 10,
                            endIndent: 10,
                            height: 3,
                            thickness: 2,
                          )),
                      Container(
                        width: double.infinity,
                        padding: const EdgeInsets.fromLTRB(20, 10, 20, 10),
                        child: TextButton(
                            onPressed: () {
                              // setState(() {
                              //   Provider.of<AttractionProvider>(context,
                              //           listen: false)
                              //       .fetchAndSetAttractions(cityParam: city);
                              // });
                              Navigator.of(context).pop();
                            },
                            child: Text(
                              "Terapkan",
                              style: TextStyle(color: Colors.white),
                            ),
                            style: ButtonStyle(
                              backgroundColor: MaterialStateProperty.all(
                                  Color.fromARGB(255, 118, 17, 28)),
                            )),
                      ),
                    ],
                  );
                });
            // Add your onPressed code here!
          },
          backgroundColor: Colors.white,
          shape: RoundedRectangleBorder(
              side:
                  BorderSide(width: 2, color: Color.fromARGB(255, 118, 17, 28)),
              borderRadius: BorderRadius.circular(30)),
          label: IntrinsicHeight(
              child: Row(
            children: [
              Icon(Icons.filter_list_alt,
                  color: Color.fromARGB(255, 118, 17, 28)),
              Text(
                "Filter",
                style: TextStyle(color: Color.fromARGB(255, 118, 17, 28)),
              ),
              Padding(
                padding: EdgeInsets.fromLTRB(10, 0, 10, 0),
                child: VerticalDivider(
                  color: Color.fromARGB(255, 118, 17, 28),
                  thickness: 2,
                  width: 5,
                ),
              ),

              Text(
                "Sort",
                style: TextStyle(color: Color.fromARGB(255, 118, 17, 28)),
              ),
              Icon(Icons.sort, color: Color.fromARGB(255, 118, 17, 28)),

              // Directionality(
              //   textDirection: TextDirection.rtl,
              //   child: TextButton.icon(
              //       onPressed: () {},
              //       icon: Icon(Icons.sort_rounded,
              //           color: Color.fromARGB(255, 118, 17, 28)),
              //       label: Text(
              //         "Sort",
              //         style: TextStyle(color: Color.fromARGB(255, 118, 17, 28)),
              //       )),
              // )
            ],
          )),
        ),
        appBar: AppBar(
          title: const Text('Attraction'),
          centerTitle: true,
          shape: RoundedRectangleBorder(
              borderRadius: BorderRadius.vertical(bottom: Radius.circular(25))),
          actions: [
            SearchBarAnimation(
              hintText: "Cari Atraksi",
              searchBoxWidth: MediaQuery.of(context).size.width * 0.80,
              textEditingController: TextEditingController(),
              isOriginalAnimation: true,
              enableKeyboardFocus: true,
              buttonColour: Colors.transparent,
              // buttonShadowColour: Colors.transparent,
              buttonBorderColour: Colors.transparent,
              enableBoxShadow: false,
              enableButtonShadow: false,
              isSearchBoxOnRightSide: true,
              onFieldSubmitted: () {},
              trailingWidget: Icon(
                Icons.search_rounded,
                size: 20,
                color: Color.fromARGB(255, 118, 17, 28),
              ),
              secondaryButtonWidget: Icon(
                Icons.close_rounded,
                size: 20,
                color: Color.fromARGB(255, 118, 17, 28),
              ),
              buttonWidget: const Icon(
                Icons.search_rounded,
                size: 20,
                color: Colors.white,
              ),
            ),
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
                ),
                Tab(
                  icon: Icon(Icons.receipt_long_outlined),
                  text: "History Transaction",
                )
              ],
            ).preferredSize,
            child: const Material(
              shape: RoundedRectangleBorder(
                  borderRadius:
                      BorderRadius.vertical(bottom: Radius.circular(25))),
              color: Color.fromARGB(255, 118, 17, 28),
              child: TabBar(
                indicatorColor: Color.fromARGB(255, 118, 17, 28),
                tabs: <Widget>[
                  Tab(
                    icon: Icon(Icons.pin_drop_outlined, color: Colors.white),
                    child: Text('Attraction',
                        style: TextStyle(color: Colors.white)),
                  ),
                  Tab(
                    icon: Icon(
                      Icons.map_outlined,
                      color: Colors.white,
                    ),
                    child: Text(
                      "Itinerary",
                      style: TextStyle(color: Colors.white),
                    ),
                  ),
                  Tab(
                    icon: Icon(
                      Icons.receipt_long_outlined,
                      color: Colors.white,
                    ),
                    child: Text(
                      "History",
                      style: TextStyle(color: Colors.white),
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
                    .fetchAndSetAttractions(
                        cityParam: city,
                        categoryParam: category,
                        sortByParam: sortBy,
                        descParam: desc),
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
                                    picture: attraction.picture,
                                    model: attraction,
                                  ),
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
              child: Text('UNDER CONSTRUCTION'),
            ),
            Center(
              child: FutureBuilder(
                future: Provider.of<InvoiceProvider>(context, listen: false)
                    .fetchInvoice(userIdGlobal),
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
                      return Consumer<InvoiceProvider>(
                        builder: (ctx, invoice, ch) {
                          final invoiceDatas = invoice.invoices;

                          return ListView(
                            physics: const ScrollPhysics(),
                            children: invoiceDatas
                                .map(
                                  (invoice) => InvoiceCard(
                                    key: ValueKey(invoice.id),
                                    id: invoice.id,
                                    grandInvoiceId: invoice.grandInvoiceId,
                                    total: invoice.total,
                                    bookingCode: invoice.bookingCode,
                                    raisedDate: invoice.raisedDate,
                                    status: invoice.status,
                                  ),
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
          ],
        ),
      ),
    );
  }
}
