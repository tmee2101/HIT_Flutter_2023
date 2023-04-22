import 'package:dummy_categories/AppScreen/detail.dart';
import 'package:dummy_categories/data/dummy_data.dart';
import 'package:flutter/material.dart';

class ListMealScreen extends StatelessWidget {
  const ListMealScreen({super.key, required this.category});
  final Category category;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        backgroundColor: Colors.amber[100],
        appBar: AppBar(
          leading: IconButton(
            icon: const Icon(
              Icons.arrow_back,
              color: Colors.white,
            ),
            onPressed: () {
              Navigator.pop(context);
            },
          ),
          title: Text(category.title),
          backgroundColor: Colors.pink,
        ),
        body: list_meal(context));
  }

  ListView list_meal(BuildContext context) {
    return ListView(
      padding: EdgeInsets.all(5),
      children: [
        for (Meal item in DUMMY_MEALS)
          if (item.categories.contains(category.id)) meal_brief(context, item),
        const SizedBox(
          height: 18,
        )
      ],
    );
  }

  Widget meal_brief(BuildContext context, Meal item) {
    return InkWell(
        onTap: () {
          Navigator.push(context,
              MaterialPageRoute(builder: (context) => MealScreen(item)));
        },
        borderRadius: BorderRadius.circular(8),
        child: Container(
          decoration: BoxDecoration(
            borderRadius: BorderRadius.circular(5),
            color: Colors.white,
          ),
          child: Column(children: [
            Image.network(item.imageUrl),
            Container(
              margin: const EdgeInsets.all(10),
              child: Row(
                mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                crossAxisAlignment: CrossAxisAlignment.center,
                children: [
                  Container(
                    child: Row(children: [
                      const Icon(
                        Icons.access_time,
                        color: Colors.black,
                        size: 24,
                      ),
                      Text(
                        "${item.duration}",
                        style: const TextStyle(color: Colors.black),
                      )
                    ]),
                  ),
                  Container(
                    child: Row(
                      children: [
                        const Icon(
                          Icons.shopping_bag_rounded,
                          color: Colors.black,
                          size: 24,
                        ),
                        Text(
                          item.complexity.name,
                          style: const TextStyle(color: Colors.black),
                        )
                      ],
                    ),
                  ),
                  Container(
                    child: Row(children: [
                      const Icon(
                        Icons.attach_money_rounded,
                        color: Colors.black,
                        size: 24,
                      ),
                      Text(
                        item.affordability.name,
                        style: const TextStyle(color: Colors.black),
                      )
                    ]),
                  )
                ],
              ),
            )
          ]),
        ));
  }
}
