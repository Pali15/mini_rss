import 'package:flutter/material.dart';
import 'package:http/http.dart' as http;
import 'package:webfeed/webfeed.dart';
import 'package:url_launcher/url_launcher.dart';
import 'package:cached_network_image/cached_network_image.dart';
import 'package:mini_rss/costum_classes/news.dart';

class RssToNewsConverter{
  //list of the news
  late List<News> news=[];

  //link to the rss
  late String rssLink;
  //the feed what are we will read
  RssFeed feed=new RssFeed();

  RssToNewsConverter(rssLink){
    this.rssLink=rssLink;
  }

  //sets the feed
  Future<void> setFeed() async {
    await getData().then((result) => {
        feed=result!
    });
    buildList();
  }

  //builds a list from the rss feed
  void buildList(){
    for(int i=0; i<feed.items!.length; i++){
      final item=feed.items![i];

      //link to the indexpicture.
      //if the enclosure does not exist the link will be "none"
      String? link = item.enclosure == null ? "none" : item.enclosure!.url.toString();

      News temp=News(item.pubDate.toString(), item.title.toString(),  item.description.toString(), "", link);

      news.add(temp);
    }
  }

  //returns the RssFeed if we could rea that or null if we weren't able to read the feed
  Future<RssFeed?> getData() async {
    try{
      final client=http.Client();//creating the client
      http.Response response=await client.get(Uri.parse(rssLink));//getting the response from the page
      return RssFeed.parse(response.body);//returns the rss feed
    }catch(e){}

    return null;//returns null
  }
}