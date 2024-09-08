import 'package:apple_store/common/product.dart';
import 'package:flutter/material.dart';

// InheritedWidget를 상속받음
class InheritedCart extends InheritedWidget {
  const InheritedCart({
    super.key,
    required super.child,
    required this.cartProductList,
    required this.onProductPressed,
  });

  /// 카트에 담긴 상품 목록
  final List<Product> cartProductList; // 공유상태(외부에서 전달받을꺼임)

  /// 상품 클릭 // 클릭 이벤트함수 (외부에서 전달받을꺼임),
  final void Function(Product product) onProductPressed;

  // @override //update를 바로 해주눈 부분
  // bool updateShouldNotify(InheritedCart oldWidget) {
  //   return true;
  // }

  @override //update를 바로 해주눈 부분
  bool updateShouldNotify(InheritedCart oldWidget) {
    print("${cartProductList.length} / ${oldWidget.cartProductList.length}");
    return cartProductList != oldWidget.cartProductList;
  }

  /// InheritedCart.of(context)로 손쉽게 접근
  static InheritedCart of(BuildContext context) {
    return context.dependOnInheritedWidgetOfExactType<InheritedCart>()!;
  }
}

extension BuildContextExt on BuildContext {
  /// context.read<InheritedCart>()로 손쉽게 접근
  T read<T extends InheritedWidget>() {
    return dependOnInheritedWidgetOfExactType<T>()!;
  }
}
