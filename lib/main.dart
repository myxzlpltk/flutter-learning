import 'package:flutter/material.dart';
import 'package:learn_flutter/product_card.dart';
import 'package:provider/provider.dart';

void main() {
  runApp(MyApp());
}

class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      home: Scaffold(
        appBar: AppBar(backgroundColor: firstColor),
        body: ChangeNotifierProvider<ProductState>(
          create: (context, ) => ProductState(),
          child: Container(
            margin: EdgeInsets.all(20),
            child: Align(
              alignment: Alignment.topCenter,
              child: Consumer<ProductState>(
                builder: (context, productState, _) => ProductCard(
                  name: "Juan",
                  price: "Rp. 25.000",
                  quantity: productState.quantity,
                  notification: (productState.quantity > 5) ? "Diskon 10%" : null,
                  onAddCartTap: (){

                  },
                  onIncrementTap: (){
                    productState.quantity += 1;
                  },
                  onDecrementTap: (){
                    productState.quantity -= 1;
                  },
                ),
              ),
            ),
          ),
        ),
      ),
    );
  }
}

class ProductState with ChangeNotifier{
  int _quantity = 0;

  int get quantity => _quantity;
  set quantity(value){
    _quantity = value;
    notifyListeners();
  }
}