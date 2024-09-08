import 'package:apple_store/3-provider/state/provider_cart.dart';
import 'package:flutter/material.dart';

class ProviderBadge with ChangeNotifier {
  ProviderBadge({
    required this.providerCart, // 외부에서 providerCart를 전달받아서 속성을 가지고 있도록 하였음
  }) {
    providerCart.addListener(prodiverCartLinster);
  }

  int counter = 0;

  final ProviderCart providerCart;

  void prodiverCartLinster() {
    counter = providerCart.cartProductList.length;
    notifyListeners();
  }

  @override
  void dispose() {
    providerCart
        .removeListener(prodiverCartLinster); // 메모리 누수를 방지하기 위해서 위에서 죽으면 이것도 죽임
    super.dispose();
  }
}
