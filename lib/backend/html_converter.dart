import 'dart:convert';
import 'package:html/dom.dart';
import 'package:html/parser.dart';
import 'package:http/http.dart';

class HtmlConverter{


  Future<String> getData(String link)  async {

    Response response =await get(Uri.parse(link));//getting data from http web page
    Document document=parse(utf8.decode(response.bodyBytes));//parsing for html library

    final elements=document.getElementsByTagName("p");//getting all the elements with tag: <p>

    String res="";//temporary variable for getting the content from elements

    for(int i=0; i<elements.length; i++){
      res+=elements[i].text.replaceAll("&nbsp", "");
    }
    return res;
  }

}