import 'package:flutter/cupertino.dart';

///
class TabControllerMy extends ChangeNotifier {
  ///
  factory TabControllerMy() => _my;

  TabControllerMy._();

  static final TabControllerMy _my = TabControllerMy._();

  int _currentPage = 0;

  ///
  bool attached = false;

  ///
  PageController pageController;

  ///
  void attach(PageController _pageController) {
    pageController = _pageController;
    attached = true;
  }

  ///
  int get currentPage => _currentPage;

  ///
  void jumpTo(int i) {
    pageController.jumpToPage(i);
    currentPage = i;
  }

  ///
  set currentPage(int page) {
    _currentPage = page;
    notifyListeners();
  }
}
