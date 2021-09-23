import 'package:flutter/material.dart';

class FilterButton extends StatefulWidget {
  const FilterButton({Key? key}) : super(key: key);

  @override
  State<FilterButton> createState() => _FilterButtonState();
}

class _FilterButtonState extends State<FilterButton> {
  @override
  Widget build(BuildContext context) {
    return Container(
      margin: const EdgeInsets.symmetric(horizontal: 2.5),
      child: ClipRRect(
        borderRadius: BorderRadius.circular(10),
        child: Container(
          color: Colors.yellow[700],
          child: const Padding(
            padding: EdgeInsets.all(8),
            child: Text('CATEGORY'),
          ),
        ),
      ),
    );
  }
}
