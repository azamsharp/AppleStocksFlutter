import 'dart:convert';

import 'package:stocks_app_flutter/models/news_article.dart';
import 'package:stocks_app_flutter/models/stock.dart';
import 'package:http/http.dart' as http;

class Webservice {


  Future<List<NewsArticle>> getTopNews() async {
    
    final url = "https://silicon-rhinoceros.glitch.me/top-news"; 

    final response = await http.get(url); 
    if(response.statusCode == 200) {
      Iterable json = jsonDecode(response.body); 
      return json.map((newsArticle) => NewsArticle.fromJson(newsArticle)).toList(); 
    } else {
      throw Exception("Error fetching news"); 
    }

  }

  Future<List<Stock>> getStocks() async {
    
    final url = "https://silicon-rhinoceros.glitch.me/stocks";

    final response = await http.get(url);
    if (response.statusCode == 200) {
      Iterable json = jsonDecode(response.body);
      return json.map((stock) => Stock.fromJson(stock)).toList();
    } else {
      throw Exception("Error fetching stocks");
    }
  }
}
