import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:mini_rss/costum_classes/news.dart';
import 'package:mini_rss/backend/html_converter.dart';
import 'package:mini_rss/backend/html_converter.dart';

class NewsDetails extends StatefulWidget {
  @override
  _NewsDetailsState createState() => _NewsDetailsState();
}

class _NewsDetailsState extends State<NewsDetails> {
  late News news;

  String content="";

  @override
  void initState() {
    // TODO: implement initState
    super.initState();
  }

  @override
  Widget build(BuildContext context) {

    news = ModalRoute.of(context)!.settings.arguments as News;//getting the news to show3

    return Scaffold(
      appBar: AppBar(
        title: Image(
          image: AssetImage(
            'assets/index.png',
          ),
          width: 500,
          height: 150,
        ),
        backgroundColor: Colors.grey[400],
        centerTitle: true,
      ),

      body: Padding(
        padding: EdgeInsets.all(10),
        child: Container(
          constraints: BoxConstraints.expand(),
          decoration: const BoxDecoration(
            border: Border(
              top: BorderSide(width: 3.0, color: Colors.black),
              left: BorderSide(width: 3.0, color:Colors.black),
              right: BorderSide(width: 3.0, color: Colors.black),
              bottom: BorderSide(width: 3.0, color: Colors.black),
            ),
          ),

          child: SingleChildScrollView(
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.stretch,
              children: [
                Padding(
                  padding: EdgeInsets.fromLTRB(10, 10, 10, 0),
                  child: news.getPicture(500, 200),
                ),
                Align(
                  alignment: Alignment.topRight,
                  child: Padding(
                    padding: EdgeInsets.fromLTRB(0, 10, 10, 0),
                    child: Text(
                      news.getTime(),
                    ),
                  ),
                ),
                Align(
                  alignment: Alignment.topLeft,
                  child: Padding(
                    padding: EdgeInsets.fromLTRB(10, 20, 0, 0),
                    child: Text(
                      news.title,
                      style: TextStyle(
                          fontWeight: FontWeight.bold,
                          fontSize: 28.0
                      ),
                    ),
                  ),
                ),
                Padding(
                    padding: EdgeInsets.fromLTRB(5, 10, 5, 5),
                    child: Text(
                      news.content,
                      textAlign: TextAlign.start,
                    ),
                ),
              ],
            ),
          )),
        ),
      );

  }
}



