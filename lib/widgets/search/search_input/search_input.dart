import 'package:first_app/constants/colors.dart';
import 'package:flutter/material.dart';

class SearchInput extends StatelessWidget {
  final Function onChangeText;

  const SearchInput({super.key, required this.onChangeText});

  @override
  Widget build(BuildContext context) {
    return TextField(
      onChanged: (value) => onChangeText(value),
      decoration: const InputDecoration(
          contentPadding: EdgeInsets.all(0),
          prefixIcon: Icon(
            Icons.search,
            color: tdBlack,
            size: 20,
          ),
          border: InputBorder.none,
          hintText: 'Search',
          hintStyle: TextStyle(color: tdGrey),
          prefixIconConstraints: BoxConstraints(maxHeight: 20, minWidth: 25)),
    );
  }
}
