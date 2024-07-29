import 'package:flutter/material.dart';

import '../utils/globals.dart';

class CartProvider extends ChangeNotifier {
  double totalPrice = 0;
  double totalDiscount = 0;
  int totalQuantity = 1;

  void Function()? onUpdate;

  void addQuantity(int index) {
    itemQuantities[index]++;
    calculateTotalPrice();
    notifyListeners();
    if (onUpdate != null) onUpdate!();
  }

  void removeQuantity(int index) {
    if (itemQuantities[index] > 0) {
      itemQuantities[index]--;
      calculateTotalPrice();
      notifyListeners();
      if (onUpdate != null) onUpdate!();
    }
  }

  void removeItem(int index) {
    totalPrice -= cartList[index].price;
    cartList.removeAt(index);
    itemQuantities.removeAt(index);
    calculateTotalPrice();
    notifyListeners();
    if (onUpdate != null) onUpdate!();
  }

  void calculateTotalPrice() {
    totalPrice = 0;
    for (int i = 0; i < cartList.length; i++) {
      totalPrice += cartList[i].price * itemQuantities[i];
    }
    notifyListeners();
  }

  void calculateTotalDiscount() {
    totalDiscount = 0;
    totalQuantity = 0;
    for (int i = 0; i < cartList.length; i++) {
      totalDiscount += cartList[i].discountPercentage * itemQuantities[i];
      totalQuantity += itemQuantities[i];
    }
    notifyListeners();
  }
}
