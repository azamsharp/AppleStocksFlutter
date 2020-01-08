import 'package:flutter/material.dart';
import 'package:stocks_app_flutter/models/stock.dart';
import 'package:stocks_app_flutter/services/webservice.dart';

class StockListViewModel extends ChangeNotifier {

  List<StockViewModel> stocks = List<StockViewModel>();
  List<StockViewModel> allStocks = List<StockViewModel>();

  Future<void> fetchStocks() async {
    final result = await Webservice().getStocks();
    stocks = result.map((stock) => StockViewModel(stock: stock)).toList();
    allStocks = stocks; 
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
