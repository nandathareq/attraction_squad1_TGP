import 'package:flutter/material.dart';

class DropdownButtonExample extends StatefulWidget {
  final List<Object> list;

  const DropdownButtonExample({super.key, required this.list});

  @override
  State<DropdownButtonExample> createState() => _DropdownButtonExampleState();
}

class _DropdownButtonExampleState extends State<DropdownButtonExample> {
  @override
  Widget build(BuildContext context) {
    return DropdownButton<Object>(
      value: widget.list.first,
      icon: const Icon(Icons.arrow_downward),
      elevation: 16,
      style: const TextStyle(color: Colors.deepPurple),
      underline: Container(
        height: 2,
        color: Colors.deepPurpleAccent,
      ),
      onChanged: (Object? value) {
        // This is called when the user selects an item.
        setState(() {});
      },
      items: widget.list.map<DropdownMenuItem<Object>>((Object value) {
        return DropdownMenuItem<Object>(
          value: value,
          child: Text("aku"),
        );
      }).toList(),
    );
  }
}
