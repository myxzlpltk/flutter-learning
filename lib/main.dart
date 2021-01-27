import 'package:flutter/material.dart';
import 'package:learn_flutter/cart.dart';
import 'package:learn_flutter/money.dart';
import 'package:provider/provider.dart';

void main() {
  runApp(MyApp());
}

class MyApp extends StatefulWidget {
  @override
  _MyAppState createState() => _MyAppState();
}

class _MyAppState extends State<MyApp> {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      home: MultiProvider(
        providers: [
          ChangeNotifierProvider<Money>(create: (context) => Money()),
          ChangeNotifierProvider<Cart>(create: (context) => Cart()),
        ],
        child: Scaffold(
          appBar: AppBar(
            backgroundColor: Colors.purple,
            title: Text("Multi Provider"),
          ),
          floatingActionButton: Consumer<Money>(
            builder: (context, money, _) => Consumer<Cart>(
              builder: (context, cart, _) => FloatingActionButton(
                child: Icon(Icons.add_shopping_cart),
                backgroundColor: Colors.purple,
                onPressed: () {
                  if(money.balance >= 500){
                    cart.quantity += 1;
                    money.balance -= 500;
                  }
                },
              ),
            ),
          ),
          body: Center(
            child: Column(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                Row(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    Text("Balance"),
                    Container(
                      child: Align(
                        alignment: Alignment.centerRight,
                        child: Consumer<Money>(
                          builder: (context, money, _) => Text(
                            money.balance.toString(),
                            style: TextStyle(
                              color: Colors.purple,
                              fontWeight: FontWeight.w700,
                            ),
                          ),
                        ),
                      ),
                      height: 30,
                      width: 150,
                      margin: EdgeInsets.all(5),
                      padding: EdgeInsets.all(5),
                      decoration: BoxDecoration(
                        color: Colors.purple[100],
                        border: Border.all(
                          color: Colors.purple,
                          width: 2,
                        ),
                        borderRadius: BorderRadius.circular(5),
                      ),
                    )
                  ],
                ),
                Container(
                  child: Consumer<Cart>(
                    builder: (context, cart, _) => Row(
                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      children: [
                        Text(
                          "Apple (500) x " + cart.quantity.toString(),
                          style: TextStyle(
                            fontWeight: FontWeight.w500,
                          ),
                        ),
                        Text(
                          (500 * cart.quantity).toString(),
                          style: TextStyle(
                            fontWeight: FontWeight.w500,
                          ),
                        )
                      ],
                    ),
                  ),
                  height: 30,
                  margin: EdgeInsets.all(5),
                  padding: EdgeInsets.all(5),
                  decoration: BoxDecoration(
                    border: Border.all(
                      color: Colors.black,
                      width: 2,
                    ),
                    borderRadius: BorderRadius.circular(5),
                  ),
                ),
              ],
            ),
          ),
        ),
      ),
    );
  }
}
