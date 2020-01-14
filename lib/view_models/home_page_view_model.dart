import 'package:flutter/material.dart';
import 'package:stocks_app_flutter/models/news_article.dart';
import 'package:stocks_app_flutter/models/stock.dart';
import 'package:stocks_app_flutter/services/webservice.dart';

class HomePageViewModel extends ChangeNotifier {

  List<StockViewModel> stocks = List<StockViewModel>();
  List<NewsArticleViewModel> newsArticles = List<NewsArticleViewModel>(); 
  List<StockViewModel> allStocks = List<StockViewModel>();

  Future<void> load() async {

    final list = await Future.wait([Webservice().getStocks(), Webservice().getTopNews()]);

    stocks = list.first.map((stock) => StockViewModel(stock: stock)).toList(); // stocks 
    newsArticles = list.last.map((newsArticle) => NewsArticleViewModel(newsArticle: newsArticle)).toList(); // news articles 

    debugPrint("$list");
    notifyListeners(); 
}

  Future<void> _fetchStocks() async {
    final result = await Webservice().getStocks();
    stocks = result.map((stock) => StockViewModel(stock: stock)).toList();
    allStocks = stocks; 
    notifyListeners();
  }

  Future<void> _fetchTopNews() async {
    final result = await Webservice().getTopNews(); 
    newsArticles = result.map((newsArticle) => NewsArticleViewModel(newsArticle: newsArticle)).toList(); 
    notifyListeners(); 
  }

  void search(String searchTerm) {

    if(searchTerm.isEmpty) {
      stocks = allStocks; 
    } else {
      stocks = allStocks.where((stock) => stock.symbol.startsWith(searchTerm)).toList(); 
    }
    notifyListeners(); 
  }

}

class NewsArticleViewModel {

  final NewsArticle newsArticle; 

  NewsArticleViewModel({this.newsArticle});

  String get title {
    return newsArticle.title; 
  }

  String get publication {
    return newsArticle.publication; 
  }

  String get imageURL {
    return newsArticle.imageURL; 
  }

}

class StockViewModel {
  final Stock stock;

  StockViewModel({this.stock});

  String get symbol {
    return stock.symbol.toUpperCase();
  }

  String get company {
    return stock.company;
  }

  double get price {
    return stock.price;
  }

  String get change {
    return stock.change; 
  }
}
