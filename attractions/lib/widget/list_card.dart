import 'package:attractions/widget/details_list_card.dart';
import 'package:flutter/material.dart';
import 'package:intl/intl.dart';

import '../model/attraction_model.dart';

class ListCard extends StatelessWidget {
  final int id;
  final String placeName;
  final String description;
  final String category;
  final String city;
  final int price;
  final double lattitude;
  final double longtitude;
  final String openHour;
  final String closeHour;
  final double placeRating;
  final String fasilities;
  final String contactPerson;
  final String picture;
  final AttractionModel model;

  const ListCard({
    Key? key,
    required this.id,
    required this.placeName,
    required this.description,
    required this.category,
    required this.city,
    required this.price,
    required this.lattitude,
    required this.longtitude,
    required this.openHour,
    required this.closeHour,
    required this.placeRating,
    required this.fasilities,
    required this.contactPerson,
    required this.picture,
    required this.model,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    final format = new NumberFormat("#,##0", "en_US");
    return InkWell(
      onTap: () {
        Navigator.push(
            context,
            MaterialPageRoute(
              builder: (context) => DetailsListCard(model: model),
            ));
      },
      child: Padding(
        padding: const EdgeInsets.all(5),
        child: Card(
          shape:
              RoundedRectangleBorder(borderRadius: BorderRadius.circular(15)),
          elevation: 5,
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: <Widget>[
              Container(
                height: 150,
                decoration: BoxDecoration(
                  borderRadius: BorderRadius.only(
                      topLeft: Radius.circular(15),
                      topRight: Radius.circular(15)),
                  image: DecorationImage(
                    image: NetworkImage(picture),
                    fit: BoxFit.cover,
                  ),
                ),
              ),
              Padding(
                padding: const EdgeInsets.all(10),
                child: SizedBox(
                  child: Text(
                    placeName,
                    maxLines: 1,
                    overflow: TextOverflow.ellipsis,
                    style: TextStyle(fontSize: 16, fontWeight: FontWeight.bold),
                  ),
                ),
              ),
              Row(
                children: [
                  const Padding(
                    padding: EdgeInsets.only(left: 5),
                    child: Icon(
                      Icons.star,
                      color: Colors.amber,
                    ),
                  ),
                  Padding(
                    padding: const EdgeInsets.only(left: 3),
                    child: Text(placeRating.toString()),
                  ),
                ],
              ),
              Row(
                children: [
                  const Padding(
                    padding: EdgeInsets.only(left: 5, top: 5),
                    child: Icon(
                      Icons.pin_drop_outlined,
                      color: Color.fromARGB(255, 118, 17, 28),
                    ),
                  ),
                  Padding(
                    padding: const EdgeInsets.only(left: 3, top: 5),
                    child: Text(city),
                  ),
                ],
              ),
              Row(
                children: const [
                  Padding(
                    padding: EdgeInsets.only(left: 125, top: 15),
                    child: Text('Harga', style: TextStyle(fontSize: 16)),
                  ),
                ],
              ),
              Row(
                mainAxisAlignment: MainAxisAlignment.end,
                children: [
                  Padding(
                    padding: const EdgeInsets.only(right: 10, top: 5),
                    child: Text(
                      "Rp. ${format.format(price)}",
                      style:
                          TextStyle(fontSize: 16, fontWeight: FontWeight.bold),
                    ),
                  ),
                ],
              ),
            ],
          ),
        ),
      ),
    );
  }
}
