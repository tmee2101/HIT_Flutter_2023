import 'package:easy_pos/add_customer.dart';
import 'package:flutter/material.dart';
import 'Customer.dart';
import 'data.dart';

class BoardScreen extends StatefulWidget {
  const BoardScreen({super.key});

  @override
  State<BoardScreen> createState() => _BoardScreenState();
}

class _BoardScreenState extends State<BoardScreen> {
  @override
  Widget build(BuildContext context) {
    return DefaultTabController(
      length: 4,
      child: Scaffold(
        appBar: AppBar(
          backgroundColor: Colors.blue,
          leading: const Icon(Icons.arrow_back),
          title: SizedBox(
            child: Container(
              decoration: BoxDecoration(
                  color: Colors.white,
                  shape: BoxShape.rectangle,
                  borderRadius: BorderRadius.circular(50)),
              child: ListTile(
                leading: const Icon(
                  Icons.search,
                  color: Colors.blue,
                ),
                title: Text(
                  "Tìm kiếm",
                  style: TextStyle(color: Colors.grey[400]),
                ),
              ),
            ),
          ),
          actions: <Widget>[
            Container(
              decoration: const BoxDecoration(
                  shape: BoxShape.circle, color: Colors.white),
              child: IconButton(
                  onPressed: () {
                    Navigator.push<Customer>(
                      context,
                      MaterialPageRoute(
                        builder: (context) => const AddCustomerScreen(),
                      ),
                    ).then((value) {
                      if (value != null) {
                        list.add(value);
                        setState(() {});
                      }
                    });
                  },
                  icon: const Icon(Icons.add, color: Colors.blue)),
            )
          ],
          bottom: const TabBar(
            tabs: [
              Tab(
                child: Text(
                  "Tất cả",
                  textAlign: TextAlign.center,
                ),
              ),
              Tab(
                child: Text(
                  "Khách hàng",
                  textAlign: TextAlign.center,
                ),
              ),
              Tab(
                child: Text(
                  "Khách hàng và nhà cung cấp",
                  textAlign: TextAlign.center,
                ),
              ),
              Tab(
                child: Text(
                  "Nhà cung cấp",
                  textAlign: TextAlign.center,
                ),
              ),
            ],
          ),
        ),
        body: TabBarView(children: [
          viewAll(),
          viewCustomer(),
          viewBoth(),
          viewProviders(),
        ]),
      ),
    );
  }
}

Widget tabTitle({required String title}) {
  return Tab(
    child: Text(
      title,
      textAlign: TextAlign.center,
    ),
  );
}

Widget viewEmpty() {
  return Container(
    alignment: Alignment.center,
    child: Text(
      "List is empty",
      style: TextStyle(color: Colors.grey[600], fontSize: 24),
    ),
  );
}

Widget viewObject(Customer item) {
  return Container(
    margin: const EdgeInsets.all(10),
    padding: const EdgeInsets.symmetric(horizontal: 5),
    color: Colors.blue[100],
    child: ListTile(
      leading: const Icon(Icons.person),
      title: Text(item.name),
      subtitle: Text(item.phoneNumber),
    ),
  );
}

Widget viewAll() {
  return ListView.builder(
    itemCount: list.length,
    shrinkWrap: true,
    itemBuilder: (context, index) => viewObject(list[index]),
  );
}

Widget viewCustomer() {
  List<Customer> listCus = list.where((element) => element.type == 1).toList();
  return listCus.isEmpty
      ? viewEmpty()
      : ListView.builder(
          shrinkWrap: true,
          itemCount: listCus.length,
          itemBuilder: (context, index) => viewObject(list[index]),
        );
}

Widget viewBoth() {
  List<Customer> listBoth = list.where((element) => element.type == 2).toList();
  return listBoth.isEmpty
      ? viewEmpty()
      : ListView.builder(
          shrinkWrap: true,
          itemCount: listBoth.length,
          itemBuilder: (context, index) => viewObject(
            listBoth[index],
          ),
        );
}

Widget viewProviders() {
  List<Customer> listProviders =
      list.where((element) => element.type == 3).toList();
  return listProviders.isEmpty
      ? viewEmpty()
      : ListView.builder(
          shrinkWrap: true,
          itemCount: listProviders.length,
          itemBuilder: (context, index) => viewObject(
            listProviders[index],
          ),
        );
}
