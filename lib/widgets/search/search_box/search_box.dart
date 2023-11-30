import 'package:first_app/widgets/search/search_input/search_input.dart';
import 'package:flutter/material.dart';

class SearchBox extends StatelessWidget {
  final Function onChangeText;

  const SearchBox({super.key, required this.onChangeText});

  @override
  Widget build(BuildContext context) {
    return Container(
      padding: const EdgeInsets.symmetric(horizontal: 15),
      margin: const EdgeInsets.only(bottom: 20),
      decoration: BoxDecoration(
          color: Colors.white, borderRadius: BorderRadius.circular(20)),
      child: SearchInput(
        onChangeText: onChangeText,
      ),
    );
  }
}
