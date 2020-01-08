class Stock {
  final String symbol;
  final String company;
  final double price;
  final String change; 

  Stock({this.symbol, this.company, this.price, this.change});

  factory Stock.fromJson(Map<String, dynamic> json) {
    return Stock(
        company: json["description"], change: json["change"], symbol: json["symbol"], price: json["price"].toDouble());
  }

  static List<Stock> getAll() {
    List<Stock> stocks = List<Stock>();
    stocks.add(Stock(company: "Apple Computers", symbol: "APPLE", price: 258));
    stocks.add(Stock(company: "Alphabet", symbol: "ALPH", price: 800));
    stocks
        .add(Stock(company: "General Electronic", symbol: "GE", price: 56.00));
    stocks.add(Stock(company: "Home Depot", symbol: "HE", price: 178));
    stocks.add(Stock(company: "Evergreen Solar", symbol: "EVR", price: 9.0));
    stocks.add(Stock(company: "Facebook", symbol: "FB", price: 200));
    stocks.add(Stock(company: "Samsung", symbol: "SAM", price: 134));
    stocks.add(Stock(company: "Snapchat", symbol: "SNAP", price: 45));
    stocks.add(Stock(company: "Microsoft", symbol: "MSOFT", price: 400));
    stocks.add(Stock(company: "Google", symbol: "GOOG", price: 1800));
    ;

    return stocks;
  }
}
