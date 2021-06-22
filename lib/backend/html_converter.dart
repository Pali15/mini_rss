import 'dart:convert';
import 'package:html/dom.dart';
import 'package:html/parser.dart';
import 'package:http/http.dart';

//getting a content from a page
class HtmlConverter{

  /*
  *Get a link and returnes the content
  *String link-Url to the page
   */
  Future<String> getData(String link)  async {

    Response response =await get(Uri.parse(link));//getting data from http web page
    Document document=parse(utf8.decode(response.bodyBytes));//parsing for html library

    final elements=document.getElementsByTagName("p");//getting all the elements with tag: <p>

    String res="";//temporary variable for getting the content from elements

    for(int i=0; i<elements.length; i++){//getting the text from the page
      res+=elements[i].text.trim();
      res+='\n';
      res+='\n';
    }

    //formatting the texts
    res.replaceAll("  ", "");
    res.replaceAll("&nbsp", "");

    return res;
  }

}