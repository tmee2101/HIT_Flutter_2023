import 'package:btvn_7/detail.dart';
import 'package:flutter/material.dart';
import 'package:intl/intl.dart';
import 'bottom.dart';
import 'data.dart';
import 'food.dart';
import 'package:provider/provider.dart';

import 'main.dart';

class MenuScreen extends StatelessWidget {
  const MenuScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return DefaultTabController(
      length: FoodData.typeOfFood.length,
      child: Scaffold(
        appBar: AppBar(
          backgroundColor: Colors.white,
          leading: Icon(
            Icons.arrow_back,
            color: Colors.orange[700],
          ),
          title: TextFormField(
            decoration: const InputDecoration(
              hintText: "Tìm món tại Cửa hàng của Meee",
              prefixIcon: Icon(Icons.search),
            ),
          ),
          actions: [
            IconButton(
              onPressed: () {},
              icon: Icon(
                Icons.share,
                color: Colors.orange[700],
              ),
            ),
          ],
          bottom: TabBar(
              indicatorColor: Colors.orange[700],
              isScrollable: true,
              tabs: List.generate(
                  FoodData.typeOfFood.length,
                  (index) => Text(
                        FoodData.typeOfFood[index],
                        style: TextStyle(color: Colors.orange[800]),
                      ))),
        ),
        body: TabBarView(children: [
          viewTab(0),
          viewTab(1),
          viewTab(2),
          viewTab(3),
          viewTab(4),
          viewTab(5),
        ]),
        bottomSheet: const BottomCart(),
      ),
    );
  }

  Widget itemView(Food item, BuildContext context) {
    var f = NumberFormat("###,###,###");
    return InkWell(
      onTap: () {
        Navigator.of(context).push(
            MaterialPageRoute(builder: (context) => DetailScreen(food: item)));
      },
      child: Row(
        children: [
          Container(
            padding: const EdgeInsets.fromLTRB(5, 5, 5, 0),
            child: SizedBox(
              width: 80,
              height: 80,
              child: Image.network(item.imageUlr),
            ),
          ),
          Expanded(
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Text(
                  item.title,
                  overflow: TextOverflow.ellipsis,
                  style: const TextStyle(fontWeight: FontWeight.bold),
                ),
                Text(
                  item.describe,
                  overflow: TextOverflow.ellipsis,
                ),
                Row(
                  children: [
                    Text("${item.numOfSold} đã bán "),
                    Text("${item.numOfLike} lượt thích")
                  ],
                ),
                Container(
                  margin: const EdgeInsets.symmetric(horizontal: 5),
                  child: Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: [
                      Text(
                        "${f.format(item.cost)}đ",
                        style: TextStyle(
                            color: Colors.orange[800],
                            fontWeight: FontWeight.bold),
                      ),
                      IconButton(
                        onPressed: () {
                          context.read<Cal>().addToCart(item.cost);
                        },
                        icon: Icon(
                          Icons.add_box,
                          color: Colors.orange[900],
                        ),
                      )
                    ],
                  ),
                )
              ],
            ),
          )
        ],
      ),
    );
  }

  Widget viewTab(int type) {
    List<Food> listFood =
        FoodData.listFoods.where((element) => element.type == type).toList();
    return ListView.builder(
        itemCount: listFood.length,
        itemBuilder: (context, index) => itemView(listFood[index], context));
  }
}
