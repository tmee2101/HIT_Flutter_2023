import 'package:flutter/material.dart';
import 'package:kiem_tra/Task.dart';
import 'package:kiem_tra/add_task.dart';

class Board extends StatefulWidget {
  const Board({super.key});

  @override
  State<Board> createState() => _BoardState();
}

class _BoardState extends State<Board> {
  static List<Task> listTasks = <Task>[];
  // final _tabController = TabController(length: 2, vsync: this);
  @override
  Widget build(BuildContext context) {
    return DefaultTabController(
        length: 4,
        child: Scaffold(
          appBar: AppBar(
            backgroundColor: Colors.white,
            title: const Text(
              "Board",
              style: TextStyle(color: Colors.black),
            ),
            actions: const <Widget>[
              Icon(
                Icons.search,
                color: Colors.black,
                size: 30,
              ),
              Icon(
                Icons.notifications,
                color: Colors.black,
                size: 30,
              ),
              Icon(
                Icons.calendar_month,
                color: Colors.black,
                size: 30,
              )
            ],
            bottom: const TabBar(
                // controller: _tabController,
                tabs: <Widget>[
                  Tab(
                    child: Text(
                      "All",
                      style: TextStyle(color: Colors.black, fontSize: 10),
                    ),
                  ),
                  Tab(
                      child: Text(
                    "Uncompleted",
                    style: TextStyle(color: Colors.black, fontSize: 10),
                  )),
                  Tab(
                      child: Text(
                    "Completed",
                    style: TextStyle(color: Colors.black, fontSize: 10),
                  )),
                  Tab(
                      child: Text(
                    "Favourite",
                    style: TextStyle(color: Colors.black, fontSize: 10),
                  )),
                ]),
          ),
          body: TabBarView(children: <Widget>[
            viewAll(),
            viewUncompleted(),
            viewCompleted(),
            viewFavourite()
          ]),
          bottomNavigationBar: ElevatedButton(
              onPressed: () {
                Navigator.push(
                    context,
                    MaterialPageRoute(
                        builder: (context) => AddTask()));
              },
              style:
                  ElevatedButton.styleFrom(backgroundColor: Colors.teal[700]),
              child: const Text("Add task")),
        ));
  }

  Widget viewAll() {
    return listTasks.isEmpty ? viewEmpty() : ListView(
      shrinkWrap: true,
      children: [
        for (Task item in listTasks) viewTask(item)
      ],
    );
  }

  Widget viewUncompleted() {
    List<Task> listCompleted =
        listTasks.where((element) => !element.isCompleted).toList();
    return listCompleted.isEmpty ? viewEmpty() : ListView(
      shrinkWrap: true,
      children: [
        for (Task item in listCompleted) viewTask(item)
      ],
    );
  }

  Widget viewCompleted() {
    List<Task> listCompleted =
        listTasks.where((element) => element.isCompleted).toList();
    return listCompleted.isEmpty ? viewEmpty() : ListView(
      shrinkWrap: true,
      children: [
        for (Task item in listCompleted) viewTask(item)
      ],
    );
  }

  Widget viewFavourite() {
    List<Task> listFavourite =
        listTasks.where((element) => element.isFavourite).toList();
    return listFavourite.isEmpty ? viewEmpty() : ListView(
      shrinkWrap: true,
      children: [
        for (Task item in listFavourite) viewTask(item)
      ],
    );
  }

  Widget viewTask(Task item) {
    return ListTile(
        leading: Checkbox(
          checkColor: Colors.blue,
          value: item.isCompleted,
          onChanged: (value) {
            setState(() {
              item.isCompleted = value!;
            });
          },
        ),
        title: Text(
          item.title,
          style: const TextStyle(color: Colors.black),
        ),
        trailing: IconButton(
          icon: item.isFavourite
              ? const Icon(Icons.favorite_outlined, color: Colors.green)
              : const Icon(
                  Icons.favorite_outline,
                  color: Colors.green,
                ),
          onPressed: () {
            item.isFavourite = !item.isFavourite;
            setState(() {});
          },
        ));
  }

  Widget viewEmpty() {
    return Container(
      alignment: Alignment.center,
      child: SizedBox(
        height: MediaQuery.of(context).size.height * 2/3,
        child: Column(      
          children: [
          Icon(Icons.menu_outlined, color: Colors.grey[300], size: 50,),
          const Text("No Task Yeys, Please Insert Some Tasks")
          ]))
    );
  }
}
