import 'dart:convert';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:html/dom.dart';
import 'package:html/parser.dart';
import 'package:http/http.dart';
import 'package:auto_size_text/auto_size_text.dart';
import 'package:flutter/src/widgets/text.dart' as Text;

class HtmlToContent extends StatefulWidget {

  @override
  _HtmlToContentState createState() => _HtmlToContentState();
}

class _HtmlToContentState extends State<HtmlToContent> {

  String content="";

  void _getData() async {
    Response response =await get(Uri.parse('https://index.hu/belfold/2021/06/22/operativ-torzs-novak-katalin-maszkhasznalat-vakcina/'));//getting data from http web page
    Document document=parse(utf8.decode(response.bodyBytes));//parsing for html library

    final elements=document.getElementsByTagName("p");//getting all the elements with tag: <p>

    String res="";//temporary variable for getting the content from elements

    for(int i=0; i<elements.length; i++){
      res+=elements[i].text.replaceAll("&nbsp", "");
    }
    //setting the content
    setState(() {
      content=res;
    });

  }

  @override
  Widget build(BuildContext context) {

    _getData();

    return  Column(
      crossAxisAlignment: CrossAxisAlignment.stretch,
      children: [
        Expanded(
            child: Container(
                color: Colors.green,
                child: SingleChildScrollView(child: Text.Text(content)))),
      ],
    );
  }
}
