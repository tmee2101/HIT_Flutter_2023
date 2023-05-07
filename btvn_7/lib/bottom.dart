import 'package:flutter/material.dart';
import 'package:intl/intl.dart';
import 'package:provider/provider.dart';
import 'main.dart';

class BottomCart extends StatelessWidget {
  const BottomCart({super.key});

  @override
  Widget build(BuildContext context) {
    var f = NumberFormat("###,###,###");
    return Row(
      mainAxisAlignment: MainAxisAlignment.end,
      children: [
        Container(
          padding: const EdgeInsets.symmetric(horizontal: 5),
          width: MediaQuery.of(context).size.width * 0.5,
          child: Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              Icon(
                Icons.shopping_basket_rounded,
                color: Colors.orange[900],
              ),
              Text(
                "${f.format(context.watch<Cal>().money)}đ",
                style: const TextStyle(fontWeight: FontWeight.bold),
              )
            ],
          ),
        ),
        Container(
          width: MediaQuery.of(context).size.width * 0.5,
          color: Colors.orange[800],
          child: const Text(
            "Giao hàng",
            style: TextStyle(
              color: Colors.white,
            ),
            textAlign: TextAlign.center,
          ),
        )
      ],
    );
  }
}
