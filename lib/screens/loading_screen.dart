import 'package:flutter/material.dart';
import 'package:flutter_spinkit/flutter_spinkit.dart';
import 'package:mini_rss/backend/html_converter.dart';
import 'package:mini_rss/backend/rss_to_news.dart';
import 'package:mini_rss/costum_classes/news.dart';
//this will be a loading screen whil the app loads the rss feed
class Loading extends StatefulWidget {
  @override
  _LoadingState createState() => _LoadingState();
}

class _LoadingState extends State<Loading> {

  //gets the data and navigate to the news_listview screen and passing the data
  void setupFeed() async {
    RssToNewsConverter rr=new RssToNewsConverter('https://index.hu/24ora/rss?rovatkeres=osszes');//creating the web reader
    await rr.setFeed();//waiting for the rss feed
    Navigator.pushReplacementNamed(context, '/listview', arguments: rr.news);
  }


  @override
  void initState() {
    super.initState();
    setupFeed();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        backgroundColor: Colors.blue[900],
        body: Center(
            child: SpinKitRing(
              color: Colors.white,
              size: 50.0,
            )
        )
    );
  }
}