import 'package:dummy_categories/data/dummy_data.dart';
import 'package:flutter/material.dart';
import 'listMeal.dart';

class HomeScreen extends StatelessWidget {
  const HomeScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return  SafeArea(
      child: Scaffold(
          appBar: AppBar( 
        leading: const Icon(
          Icons.menu_rounded,
          color: Colors.white,
        ),
        title: const Text(
          "Categories",
          style: TextStyle(color: Colors.white),
        ),
        backgroundColor: Colors.pink,
      ),
      body: screenContent(context),
      
      ),
    );
  }

  Widget screenContent(BuildContext context) {
    return GridView.count(
      crossAxisCount: 3,
      crossAxisSpacing: 10,
      mainAxisSpacing: 10,
      shrinkWrap: true,
      children: List.generate(DUMMY_CATEGORIES.length, (index) => _categoryBuilder(context, DUMMY_CATEGORIES[index]))
    );
  }
  
  Widget _categoryBuilder(BuildContext context, Category category) {
    return InkWell(
      onTap: () {
        Navigator.push(context, MaterialPageRoute(builder: (context) => ListMealScreen(category: category)));
      },

      child: Container(
        padding: const EdgeInsets.all(10),
        decoration: BoxDecoration(
          color: category.color,
          borderRadius: BorderRadius.circular(5)
        ),
        child: Text(category.title, style: const TextStyle(color: Colors.white),)
      ),
    );
  }  
}

