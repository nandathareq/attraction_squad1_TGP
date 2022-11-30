import 'package:flutter/material.dart';

class DropdownItem extends StatelessWidget {
  const DropdownItem({super.key});

  @override
  Widget build(BuildContext context) {
    return Container(
      child: Column(
        children: [
          Row(
            mainAxisAlignment: MainAxisAlignment.start,
            children: [
              Column(
                children: [
                  Padding(
                    padding: EdgeInsets.only(left: 20),
                    child: Icon(Icons.credit_card),
                  ),
                ],
              ),
              Column(
                children: [
                  Padding(
                    padding: EdgeInsets.only(left: 5, top: 5),
                    child: Row(
                      children: [Text('kak')],
                    ),
                  ),
                  Padding(
                    padding: EdgeInsets.only(left: 5, bottom: 5),
                    child: Row(
                      children: [Text('kak')],
                    ),
                  ),
                ],
              ),
            ],
          ),
        ],
      ),
    );
  }
}
