import 'package:btvn_7/menu_screen.dart';
import 'package:flutter/foundation.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

void main() {
  runApp(
    MultiProvider(
      providers: [
        ChangeNotifierProvider(create: (_) => Cal()),
      ],
      child: const MainApp(),
    ),
  );
}

class Cal with ChangeNotifier, DiagnosticableTreeMixin {
  int _money = 0;

  int get money => _money;

  void addToCart(int cost) {
    _money += cost;
    notifyListeners();
  }

  void removeFromCart(int cost) {
    _money -= cost;
    notifyListeners();
  }
}

class MainApp extends StatelessWidget {
  const MainApp({super.key});

  @override
  Widget build(BuildContext context) {
    return const MaterialApp(
      home: MenuScreen(),
    );
  }
}
