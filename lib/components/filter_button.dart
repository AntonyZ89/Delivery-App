import 'package:flutter/material.dart';

class FilterButton extends StatefulWidget {
  final Function() onTap;
  bool? selected;
  final String category;

  FilterButton({
    Key? key,
    required this.onTap,
    this.selected = false,
    this.category = 'CATEGORY',
  }) : super(key: key);

  @override
  State<FilterButton> createState() => _FilterButtonState();
}

class _FilterButtonState extends State<FilterButton> {
  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: widget.onTap,
      child: Container(
        margin: const EdgeInsets.symmetric(horizontal: 2.5),
        alignment: Alignment.center,
        child: ClipRRect(
          borderRadius: BorderRadius.circular(10),
          child: Container(
            color: widget.selected == true ? Colors.yellow[700] : null,
            child: Padding(
              padding: const EdgeInsets.all(8),
              child: Text(
                widget.category,
                style: const TextStyle(
                  fontWeight: FontWeight.bold,
                ),
              ),
            ),
          ),
        ),
      ),
    );
  }
}
