import 'package:attractions/model/attraction_model.dart';
import 'package:attractions/screen/book_screen.dart';
import 'package:flutter/material.dart';
import 'package:intl/intl.dart';
import 'package:share_plus/share_plus.dart';

class DetailsListCard extends StatelessWidget {
  final AttractionModel model;

  DetailsListCard({super.key, required this.model});

  void _onShare(BuildContext context, String title, String url) async {
    // A builder is used to retrieve the context immediately
    // surrounding the ElevatedButton.
    //
    // The context's `findRenderObject` returns the first
    // RenderObject in its descendent tree when it's not
    // a RenderObjectWidget. The ElevatedButton's RenderObject
    // has its position and size after it's built.
    final box = context.findRenderObject() as RenderBox?;

    await Share.share("$title - $url",
        subject: title,
        sharePositionOrigin: box!.localToGlobal(Offset.zero) & box.size);
  }

  @override
  Widget build(BuildContext context) {
    final ButtonStyle style = ElevatedButton.styleFrom(
        shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(20)),
        textStyle: const TextStyle(fontSize: 18),
        backgroundColor: const Color.fromARGB(255, 118, 17, 28));

    final format = new NumberFormat("#,##0", "en_US");
    return Container(
      child: Scaffold(
        appBar: AppBar(
          shape:
              RoundedRectangleBorder(borderRadius: BorderRadius.circular(25)),
          title: Text(model.placeName),
          backgroundColor: const Color.fromARGB(255, 118, 17, 28),
        ),
        body: ListView(
          children: <Widget>[
            Container(
              height: 250,
              decoration: BoxDecoration(
                image: DecorationImage(
                  image: NetworkImage(model.picture),
                  fit: BoxFit.cover,
                ),
                borderRadius: BorderRadius.vertical(top: Radius.circular(20)),
              ),
            ),
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                Column(
                  children: [
                    Padding(
                      padding:
                          const EdgeInsets.only(left: 20, top: 10, bottom: 5),
                      child: Text(
                        model.placeName,
                        overflow: TextOverflow.ellipsis,
                        style: TextStyle(
                            fontSize: 16, fontWeight: FontWeight.bold),
                      ),
                    ),
                  ],
                ),
                Column(
                  children: [
                    Row(
                      children: [
                        Column(
                          children: [
                            Padding(
                              padding: EdgeInsets.only(right: 5, top: 5),
                              child: Icon(
                                Icons.favorite_border_outlined,
                                color: Color.fromARGB(255, 118, 17, 28),
                              ),
                            ),
                          ],
                        ),
                        Column(
                          children: [
                            Padding(
                                padding: EdgeInsets.only(right: 20, top: 5),
                                child: IconButton(
                                  onPressed: () {
                                    _onShare(context, model.placeName,
                                        model.description);
                                  },
                                  icon: Icon(
                                    Icons.share_outlined,
                                    color: Color.fromARGB(255, 118, 17, 28),
                                  ),
                                )

                                // Icon(
                                //   Icons.share_outlined,
                                //   color: Color.fromARGB(255, 118, 17, 28),
                                // ),
                                ),
                          ],
                        ),
                      ],
                    ),
                    // Container(
                    //   child: Padding(
                    //     padding: EdgeInsets.only(right: 10),
                    //     child: Icon(
                    //       Icons.favorite_border_outlined,
                    //       color: Color.fromARGB(255, 118, 17, 28),
                    //     ),
                    //   ),
                    // ),
                  ],
                ),
              ],
            ),
            Row(
              children: [
                const Padding(
                  padding: EdgeInsets.only(left: 20),
                  child: Icon(
                    Icons.star,
                    color: Colors.amber,
                  ),
                ),
                Padding(
                  padding: const EdgeInsets.only(left: 10),
                  child: Text(model.placeRating.toString()),
                ),
              ],
            ),
            Row(
              children: [
                const Padding(
                  padding: EdgeInsets.only(left: 20, top: 5),
                  child: Icon(
                    Icons.pin_drop,
                    color: Color.fromARGB(255, 118, 17, 28),
                  ),
                ),
                Padding(
                  padding: const EdgeInsets.only(left: 10),
                  child: Text(model.city.toString()),
                ),
              ],
            ),
            Row(
              children: [
                const Padding(
                  padding: EdgeInsets.only(left: 20, top: 5),
                  child: Icon(
                    Icons.whatsapp,
                    color: Color.fromARGB(255, 118, 17, 28),
                  ),
                ),
                Padding(
                  padding: const EdgeInsets.only(left: 10),
                  child: Text(model.contactPerson.toString()),
                ),
              ],
            ),
            Row(
              children: [
                const Padding(
                  padding: EdgeInsets.only(left: 20, top: 5),
                  child: Icon(
                    Icons.payments_sharp,
                    color: Color.fromARGB(255, 118, 17, 28),
                  ),
                ),
                Padding(
                  padding: const EdgeInsets.only(left: 10),
                  child: Text("Rp. ${format.format(model.price)} "),
                ),
              ],
            ),
            Column(
              children: [
                Row(
                  children: <Widget>[
                    Padding(
                      padding: const EdgeInsets.only(left: 20, top: 15),
                      child: Card(
                        shape: RoundedRectangleBorder(
                          borderRadius: BorderRadius.circular(15),
                        ),
                        color: Color.fromARGB(255, 118, 17, 28),
                        child: SizedBox(
                          child: Padding(
                            padding: EdgeInsets.only(
                                top: 5, bottom: 5, right: 10, left: 10),
                            child: Text(
                              model.category,
                              style: TextStyle(color: Colors.white),
                            ),
                          ),
                        ),
                      ),
                    ),
                  ],
                ),
                Padding(
                  padding: const EdgeInsets.only(top: 15),
                ),
                Divider(
                  thickness: 0.5,
                  indent: 15,
                  endIndent: 15,
                ),
                Row(
                  children: [
                    Padding(
                      padding: const EdgeInsets.only(left: 20, top: 15),
                      child: Text(
                        "Deskripsi Obyek Wisata",
                        style: TextStyle(
                            fontWeight: FontWeight.bold, fontSize: 16),
                      ),
                    ),
                  ],
                ),
                Column(
                  children: <Widget>[
                    Padding(
                      padding:
                          const EdgeInsets.only(left: 20, top: 5, right: 20),
                      child: Text(
                        model.description,
                        textAlign: TextAlign.justify,
                      ),
                    ),
                  ],
                ),
                Padding(
                  padding: const EdgeInsets.only(top: 15),
                ),
                Divider(
                  thickness: 0.5,
                  indent: 15,
                  endIndent: 15,
                ),
                Row(
                  children: [
                    Padding(
                      padding: const EdgeInsets.only(left: 20, top: 15),
                      child: Text(
                        "Jam Buka",
                        style: TextStyle(
                            fontWeight: FontWeight.bold, fontSize: 16),
                      ),
                    ),
                  ],
                ),
                Row(
                  children: [
                    const Padding(
                      padding: EdgeInsets.only(left: 20, top: 10),
                      child: Icon(
                        Icons.access_time_sharp,
                        color: Color.fromARGB(255, 118, 17, 28),
                      ),
                    ),
                    Padding(
                      padding: const EdgeInsets.only(left: 7, top: 10),
                      child: Text(
                          "${model.openHour.toString()} - ${model.closeHour} "),
                    ),
                  ],
                ),
                Padding(
                  padding: const EdgeInsets.only(top: 15),
                ),
                Divider(
                  thickness: 0.5,
                  indent: 15,
                  endIndent: 15,
                ),
                Row(
                  children: [
                    Padding(
                      padding: const EdgeInsets.only(left: 20, top: 15),
                      child: Text(
                        "Fasilitas Yang Tersedia",
                        style: TextStyle(
                            fontWeight: FontWeight.bold, fontSize: 16),
                      ),
                    ),
                  ],
                ),
                Row(
                  children: [
                    Padding(
                      padding: EdgeInsets.only(left: 20, top: 10, bottom: 10),
                      child: Text(model.fasilities),
                    ),
                  ],
                ),
                Center(
                  child: Column(
                    children: [
                      const SizedBox(height: 10),
                      SizedBox(
                        width: 360,
                        height: 45,
                        child: ElevatedButton(
                          style: style,
                          onPressed: () {
                            Navigator.push(
                                context,
                                MaterialPageRoute(
                                  builder: (context) =>
                                      BookScreen(model: model),
                                ));
                          },
                          child: const Text('Cari Tiket'),
                        ),
                      ),
                      const SizedBox(height: 20)
                    ],
                  ),
                ),
              ],
            ),
          ],
        ),
      ),
    );
  }
}
