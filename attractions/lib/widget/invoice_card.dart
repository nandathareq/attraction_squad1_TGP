import 'package:attractions/widget/details_list_card.dart';
import 'package:flutter/material.dart';
import 'package:attractions/screen/resi_screen.dart';
import '../model/attraction_model.dart';
import 'package:intl/intl.dart' as intl;

intl.DateFormat dateFormat = intl.DateFormat('dd MMMM yyyy');

class InvoiceCard extends StatelessWidget {
  final int id;
  final int grandInvoiceId;
  final double total;
  final String bookingCode;
  final String raisedDate;
  final String status;

  const InvoiceCard({
    Key? key,
    required this.id,
    required this.grandInvoiceId,
    required this.total,
    required this.bookingCode,
    required this.raisedDate,
    required this.status,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    final format = new intl.NumberFormat("#,##0", "en_US");
    return InkWell(
        onTap: () {
          status == "PAID"
              ? Navigator.of(context).pushAndRemoveUntil(
                  MaterialPageRoute(
                      builder: (context) => ResiScreen(
                            bookingCode: bookingCode,
                          )),
                  (Route<dynamic> route) => false)
              : null;
          // Navigator.push(
          //     context,
          //     MaterialPageRoute(
          //       builder: (context) => DetailsListCard(model: model),
          //     ));
        },
        child: ListTile(
          leading: Icon(Icons.receipt_outlined),
          title: Text("Kode Booking : ${bookingCode.toUpperCase()}"),
          subtitle: Text(
            dateFormat.format(DateTime.parse(raisedDate).toLocal()),
          ),
          trailing: Text(
            status,
            style:
                TextStyle(color: status == "PAID" ? Colors.green : Colors.red),
          ),
        ));
  }
}
