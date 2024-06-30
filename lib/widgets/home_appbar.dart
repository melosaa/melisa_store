import 'package:flutter/material.dart';

class SearchBar extends StatefulWidget {
  const SearchBar({super.key});

  @override
  State<SearchBar> createState() => _SearchBarState();
}

class _SearchBarState extends State<SearchBar> {
  bool isDark = false;
  @override
  Widget build(BuildContext context) {
    Size screensize = MediaQuery.of(context).size;
    return Scaffold(
      appBar: AppBar(
        backgroundColor: Colors.black,
        title: Container(
          padding: EdgeInsets.symmetric(
            horizontal: 16.0,
          ),
          decoration: BoxDecoration(borderRadius: BorderRadius.circular(8.0)),
          child: const Row(
            children: [
              Icon(
                Icons.search,
                color: Colors.grey,
              )
            ],
          ),
        ),
      ),
    );
  }
}
