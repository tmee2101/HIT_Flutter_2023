import 'package:flutter/material.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return const MaterialApp(
      home: MyHomePage(),
    );
  }
}

class MyHomePage extends StatefulWidget {
  const MyHomePage({super.key});

  @override
  State<MyHomePage> createState() => _MyHomePageState();
}

class _MyHomePageState extends State<MyHomePage> {

  @override
  Widget build(BuildContext context) {

    return Scaffold(
        body: Column(
          mainAxisAlignment: MainAxisAlignment.start,
          children: [
            Container(
              padding: const EdgeInsets.fromLTRB(15, 35, 15, 25),
              // padding: EdgeInsets.symmetric(vertical: 30, horizontal: 15),
              child: Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: const [
                  Text(
                    "Profile",
                    style: TextStyle(
                        color: Colors.black,
                        fontWeight: FontWeight.bold,
                        fontSize: 18
                    ),
                  ),

                  Text(
                    "Edit Profile",
                    style: TextStyle(
                        color: Colors.blue,
                        fontWeight: FontWeight.bold,
                        fontSize: 18
                    ),
                  )
                ],
              ),
            ),

            Container(
              padding: const EdgeInsets.symmetric(horizontal: 15),
              child: Row(
                children: [
                  const CircleAvatar(
                    backgroundImage: AssetImage('assets/images/meowloading.jpg'),
                    radius: 35,
                  ),

                  Container(
                    padding: EdgeInsets.symmetric(horizontal: 10),
                    child: Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: const [
                        Text(
                          "Trần Thị Trà Mi",
                          style: TextStyle(
                              fontSize: 16,
                              fontWeight: FontWeight.bold,
                              color: Colors.black
                          ),
                        ),

                        Text(
                          "0123 456 789",
                          style: TextStyle(
                              fontWeight: FontWeight.normal,
                              fontSize: 14,
                              color: Colors.grey
                          ),
                        )
                      ],
                    ),
                  )
                ],
              ),
            ),

            Container(
              padding: const EdgeInsets.symmetric(vertical: 20),

              child: Column(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  options(text: "My Account", color: Colors.blue, icon: Icons.credit_card_outlined),

                  options(text: "Address", color: Colors.purple, icon: Icons.location_on_outlined),

                  options(text: "Setting", color: Colors.deepOrange, icon: Icons.settings),

                  options(text: "Help Center", color: Colors.purpleAccent, icon: Icons.question_mark_rounded),

                  options(text: "Contact", color: Colors.blue, icon: Icons.phone)
                ],
              ),
            ),

            Container(
              height: 45,
              width: 300,
              color: Colors.red[100],
              alignment: Alignment.center,
              child: const Text(
                "Log out",
                style: TextStyle(
                  fontSize: 16,
                  color: Colors.red,
                  fontWeight: FontWeight.bold,
                ),

              ),
            )

          ],
        )
    );
  }
}

Container options({
  required String text,
  required Color color,
  required IconData icon
}) {
  return Container(
    padding: const EdgeInsets.symmetric(vertical: 8),
    child: ListTile(
        leading: Container(
          width: 45,
          height: 45,
          decoration: ShapeDecoration(
              color: color,
              shape: RoundedRectangleBorder(
                borderRadius: BorderRadius.circular(10),


              )
          ),

          child: Icon(icon, size: 20, color: Colors.white),
        ),

        title: Text(
          text,
          style: const TextStyle(
            fontSize: 16,
            fontWeight: FontWeight.bold,
            color: Colors.black,
          ),
        ),
        trailing: const Icon(Icons.navigate_next, color: Colors.grey, size: 45,)
    ),
  );
}

