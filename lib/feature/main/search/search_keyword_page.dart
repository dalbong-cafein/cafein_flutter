import 'package:flutter/material.dart';

class SearchKeywordPage extends StatefulWidget {
  const SearchKeywordPage({Key? key}) : super(key: key);

  static const routeName = 'SearchKeywordPage';

  @override
  State<SearchKeywordPage> createState() => _SearchKeywordPageState();
}

class _SearchKeywordPageState extends State<SearchKeywordPage> {
  @override
  Widget build(BuildContext context) {
    return const Scaffold(
      body: Center(
        child: Text('검색페이지'),
      ),
    );
  }
}
