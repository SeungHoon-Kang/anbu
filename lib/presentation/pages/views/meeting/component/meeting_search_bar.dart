// meeting_search_bar.dart
import 'package:flutter/material.dart';

class MeetingSearchBar extends StatelessWidget {
  final String searchQuery;
  final ValueChanged<String> onChanged;

  MeetingSearchBar({required this.searchQuery, required this.onChanged});

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.all(16.0),
      child: TextField(
        decoration: InputDecoration(
          hintText: '검색어를 입력하세요',
          prefixIcon: Icon(Icons.search),
          border: OutlineInputBorder(
            borderRadius: BorderRadius.circular(10.0),
          ),
        ),
        onChanged: onChanged,
      ),
    );
  }
}
