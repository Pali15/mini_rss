import 'package:flutter/material.dart';
import 'package:mini_rss/screens/news_details.dart';
import 'package:mini_rss/screens/news_listview.dart';
import 'package:mini_rss/screens/loading_screen.dart';

void main() {
  runApp(MaterialApp(
      routes: {
        '/': (context) => Loading(),
        '/listview': (context) => NewsListView(),
        '/detailed': (context) => NewsDetails()
      }
  ));
}


