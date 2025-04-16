


import 'package:flutter/material.dart';

class CustomDropDown extends StatelessWidget {
  const CustomDropDown({
    super.key,
    required this.hintText,
    this.onChanged,
    this.items,
    this.value,
    this.padding = const EdgeInsets.symmetric(horizontal: 16, vertical: 6),
  });

  final String hintText;
  final void Function(String?)? onChanged;
  final List<DropdownMenuItem<String>>? items;
  final String? value;
  final EdgeInsetsGeometry padding; // Added padding parameter

  @override
  Widget build(BuildContext context) {
    return Container(
      width: 300,
      decoration: BoxDecoration(
        border: Border.all(
            color: Colors.grey,
            width: 1), // Use a standard color here for better visibility
        borderRadius: BorderRadius.circular(10),
        color: Colors.white,
        boxShadow: [
          BoxShadow(
            color: Colors.grey.withOpacity(0.5),
            spreadRadius: 3,
            blurRadius: 8,
            offset: Offset(0, 3),
          ),
        ],
      ),
      child: Padding(
        // Added Padding Widget here.
        padding: padding,
        child: DropdownButtonHideUnderline(
          child: DropdownButton<String>(
            hint: Text(
              hintText,
              style: TextStyle(color: Colors.grey[600]),
            ),
            value: value,
            style: Theme.of(context).textTheme.bodyMedium!.copyWith(
                  color: Colors
                      .black, // Use a standard color here for better visibility
                  fontWeight: FontWeight.w600,
                  fontSize: 18.0,
                ),
            onChanged: onChanged,
            items: items,
            icon: Icon(Icons.arrow_drop_down, color: Colors.grey),
          ),
        ),
      ),
    );
  }
}
