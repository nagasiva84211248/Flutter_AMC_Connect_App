import 'package:flutter/material.dart';

class SearchbarAnimated extends StatefulWidget {
  const SearchbarAnimated({super.key});

  @override
  State<SearchbarAnimated> createState() => _SearchbarAnimatedState();
}

class _SearchbarAnimatedState extends State<SearchbarAnimated> {
  final _controller = TextEditingController();
  @override
  Widget build(BuildContext context) {
    return Container(
        child: TextField(
          controller: _controller,
      decoration: const InputDecoration(
        contentPadding: const EdgeInsets.only(left: 5),
        filled: true,
        hintStyle: TextStyle(letterSpacing: 0, fontSize: 12.0),
      ),
    ));
  }
}
