import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:stocks_app_flutter/pages/home_page.dart';
import 'package:stocks_app_flutter/view_models/home_page_view_model.dart';


void main() => runApp(App());

class App extends StatelessWidget {

  @override
  Widget build(BuildContext context) {

    return MaterialApp(
      title: "Stocks", 
      home: 
      ChangeNotifierProvider(
        create: (_) => HomePageViewModel(), 
        child: HomePage()
      )
    );
    
  }

}
