import 'package:flutter/widgets.dart';
import 'package:flutter/foundation.dart';
import '../../models/cart_item.dart';
import '../../models/order_item.dart';

class OrdersManager with ChangeNotifier{
  final List <OrderItem>_orders=[
   
  ];

  int get orderCount{
    return _orders.length;
  }

  List<OrderItem> get orders{
    return [..._orders];
  }

  void addOrder(List<CartItem> cartProducts, double total) async{
    _orders.insert(
      0, 
      OrderItem(

        id: '0${DateTime.now().toIso8601String()}',
        amount: total,
        products: cartProducts,
        dateTime: DateTime.now(),
       ),
       );
       notifyListeners();
  }
}