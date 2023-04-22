import 'package:dummy_categories/data/dummy_data.dart';
import 'package:flutter/material.dart';

// ignore: must_be_immutable
class MealScreen extends StatelessWidget {
  Meal meal;
  MealScreen(this.meal, {super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        appBar: AppBar(
            leading: IconButton(
              icon: const Icon(Icons.arrow_back),
              onPressed: () {
                Navigator.of(context).pop();
              },
            ),
            title: Text(meal.title)),
        body: mealDetail(context));
  }

  Widget mealDetail(BuildContext context) {
    return SingleChildScrollView(
      child: Container(
        color: Colors.amber[100],
        child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Container(
                alignment: Alignment.center,
                child: Image.network(meal.imageUrl),
              ),
              Container(
                alignment: Alignment.center,
                child: const Text(
                  "Ingredients",
                  style: TextStyle(fontSize: 24),
                ),
              ),
              listIngredients(),
              Container(
                alignment: Alignment.center,
                child: const Text(
                  "Steps",
                  style: TextStyle(fontSize: 24),
                ),
              ),
              listSteps()
            ]),
      ),
    );
  }

  Widget listIngredients() {
    return ListView.builder(
      shrinkWrap: true,
      itemCount: meal.ingredients.length,
      itemBuilder: (context, index) {
        return Container(
            decoration: BoxDecoration(
              borderRadius: BorderRadius.circular(2),
              color: Colors.amber,
            ),
            margin: const EdgeInsets.symmetric(vertical: 5, horizontal: 5),
            child: Text(meal.ingredients[index],
                style: const TextStyle(color: Colors.black, fontSize: 18)));
      },
    );
  }

  Widget listSteps() {
    return ListView.builder(
      shrinkWrap: true,
      itemCount: meal.steps.length,
      itemBuilder: (context, index) => Row(
        children: [
          Container(
            padding: EdgeInsets.all(5),
            margin: EdgeInsets.all(5),
            decoration: BoxDecoration(
              shape: BoxShape.circle, color: Colors.pink[700],
              // borderRadius: BorderRadius.circular(10)
            ),
            child: Text(
              '#${index + 1}',
              style: const TextStyle(fontSize: 18),
            ),
          ),
          Text(
            meal.steps[index],
            style: const TextStyle(color: Colors.black, fontSize: 18),
          )
        ],
      ),
    );
  }
}
