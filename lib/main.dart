import 'package:flutter/material.dart';
import 'package:mini_rss/screens/NewsDetails.dart';
import 'package:mini_rss/screens/news_listview.dart';

void main() {
  runApp(MaterialApp(
      routes: {
        '/': (context) => NewsListView(),
        '/detailed': (context) => NewsDetails()
      }
  ));
}


