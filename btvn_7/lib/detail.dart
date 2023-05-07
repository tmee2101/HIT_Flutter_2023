import 'package:btvn_7/bottom.dart';
import 'package:flutter/material.dart';
import 'package:intl/intl.dart';
import 'food.dart';
import 'package:provider/provider.dart';
import 'main.dart';

class DetailScreen extends StatelessWidget {
  final Food food;
  const DetailScreen({super.key, required this.food});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      extendBodyBehindAppBar: true,
      appBar: AppBar(
        backgroundColor: const Color.fromRGBO(255, 255, 255, 0),
      ),
      body: foodDetail(food, context),
      bottomSheet: const BottomCart(),
    );
  }

  Widget foodDetail(Food food, BuildContext context) {
    var f = NumberFormat("###,###,###");
    return SingleChildScrollView(
      padding: const EdgeInsets.fromLTRB(5, 5, 5, 0),
      child: Column(
        mainAxisAlignment: MainAxisAlignment.start,
        crossAxisAlignment: CrossAxisAlignment.center,
        children: [
          Image.network(food.imageUlr),
          Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Text(
                food.title,
                style: const TextStyle(
                    color: Colors.black,
                    fontWeight: FontWeight.bold,
                    fontSize: 24),
              ),
              Text(
                food.describe,
                style: TextStyle(color: Colors.grey[700]),
              ),
              const SizedBox(
                height: 10,
              ),
              Text(
                "${food.numOfSold} đã bán | ${food.numOfLike} thích",
                style: const TextStyle(color: Colors.grey),
              ),
              const SizedBox(
                height: 20,
              ),
              Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  Text(
                    "${f.format(food.cost)}đ",
                    style: TextStyle(
                        color: Colors.orange[800],
                        fontSize: 20,
                        fontWeight: FontWeight.bold),
                  ),
                  IconButton(
                    onPressed: () {
                      context.read<Cal>().addToCart(food.cost);
                    },
                    icon: Icon(
                      Icons.add_box_rounded,
                      color: Colors.orange[900],
                    ),
                  ),
                ],
              ),
              Container(
                height: 2,
                color: Colors.grey[300],
              ),
              Container(
                padding: const EdgeInsets.symmetric(vertical: 5),
                child: Text(
                  "Bình luận",
                  style: TextStyle(
                      color: Colors.grey[500],
                      fontWeight: FontWeight.bold,
                      fontSize: 16),
                ),
              )
            ],
          )
        ],
      ),
    );
  }
}
