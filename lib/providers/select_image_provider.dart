import 'package:flutter/widgets.dart';
import 'package:provider_ecom/Model/product_model.dart';

class SelectImageProvider extends ChangeNotifier {
  ProductModel? _product;
  ProductModel? get product => _product;

  void selectProduct(ProductModel p) {
    _product = p;
    notifyListeners();
  }

  void clear() {
    _product = null;
    notifyListeners();
  }
}
