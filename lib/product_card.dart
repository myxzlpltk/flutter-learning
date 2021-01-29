import 'package:flutter/material.dart';

const Color firstColor = Color(0xFFF44336);
const Color secondColor = Color(0xFF4CAF50);

class ProductCard extends StatelessWidget {
  final String name;
  final String price;
  final TextStyle textStyle = TextStyle(
    fontFamily: "JetBrainsMono",
    fontSize: 14,
    fontWeight: FontWeight.bold,
    color: Colors.black,
  );
  final int quantity;
  final Function onAddCartTap;
  final Function onDecrementTap;
  final Function onIncrementTap;
  final String notification;

  ProductCard(
      {Key key,
      this.name,
      this.price,
      this.onAddCartTap,
      this.onDecrementTap,
      this.onIncrementTap,
      this.quantity = 0,
      this.notification})
      : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Stack(
      children: [
        AnimatedContainer(
          margin: EdgeInsets.only(left: 10, right: 10),
          width: 130,
          height: (notification != null) ? 270 : 250,
          duration: Duration(milliseconds: 300),
          decoration: BoxDecoration(
            boxShadow: [
              BoxShadow(
                blurRadius: 3,
                offset: Offset(1, 1),
                color: Colors.black.withOpacity(0.3),
              )
            ],
            borderRadius: BorderRadius.only(
              bottomLeft: Radius.circular(8),
              bottomRight: Radius.circular(8),
            ),
            color: secondColor,
          ),
          child: Align(
            alignment: Alignment.bottomCenter,
            child: Text(
              (notification != null) ? notification : "",
              style: textStyle.copyWith(
                color: Colors.white,
                fontSize: 12,
              ),
            ),
          ),
        ),
        Container(
          width: 150,
          height: 250,
          decoration: BoxDecoration(
            color: Colors.white,
            borderRadius: BorderRadius.circular(16),
            boxShadow: [
              BoxShadow(
                color: Colors.black.withOpacity(0.2),
                blurRadius: 6,
                offset: Offset(1, 1),
              )
            ],
          ),
          child: Column(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Container(
                    width: 150,
                    height: 100,
                    decoration: BoxDecoration(
                      borderRadius: BorderRadius.only(
                        topLeft: Radius.circular(16),
                        topRight: Radius.circular(16),
                      ),
                      image: DecorationImage(
                        image: AssetImage("assets/juan.jpg"),
                        fit: BoxFit.cover,
                      ),
                    ),
                  ),
                  Container(
                    margin: EdgeInsets.all(5),
                    child: Text(name, style: textStyle),
                  ),
                  Container(
                    margin: EdgeInsets.only(left: 5, right: 5),
                    child: Text(
                      price,
                      style: textStyle.copyWith(
                        fontSize: 12,
                        color: firstColor,
                      ),
                    ),
                  )
                ],
              ),
              Column(
                children: [
                  Container(
                    width: 140,
                    height: 30,
                    decoration: BoxDecoration(
                      border: Border.all(color: firstColor),
                    ),
                    child: Row(
                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      children: [
                        GestureDetector(
                          onTap: onDecrementTap,
                          child: Container(
                            width: 30,
                            height: 30,
                            color: firstColor,
                            child: Icon(Icons.remove,
                                size: 18, color: Colors.white),
                          ),
                        ),
                        Text(quantity.toString(), style: textStyle),
                        GestureDetector(
                          onTap: onIncrementTap,
                          child: Container(
                            width: 30,
                            height: 30,
                            color: firstColor,
                            child:
                                Icon(Icons.add, size: 18, color: Colors.white),
                          ),
                        ),
                      ],
                    ),
                  ),
                  SizedBox(
                    width: 140,
                    child: RaisedButton(
                      child: Icon(Icons.add_shopping_cart,
                          size: 18, color: Colors.white),
                      onPressed: onAddCartTap,
                      color: firstColor,
                      shape: RoundedRectangleBorder(
                        borderRadius: BorderRadius.only(
                          bottomLeft: Radius.circular(16),
                          bottomRight: Radius.circular(16),
                        ),
                      ),
                    ),
                  ),
                ],
              ),
            ],
          ),
        ),
      ],
    );
  }
}
