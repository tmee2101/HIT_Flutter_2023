import 'package:flutter/material.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  // This widget is the root of your application.
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
        body: Stack(
          children: [
            Container(
              decoration: const BoxDecoration(
                  image: DecorationImage(
                      image: AssetImage('assests/images/sky3.jpg'),
                      fit: BoxFit.cover
                  )
              ),
              child: null,
            ),

            Container(
              padding: const EdgeInsets.symmetric(vertical: 25),

              child: Column(
                children: [
                  Row(
                    children: const [
                      CircleAvatar(
                        radius: 16,
                        backgroundColor: Colors.white,
                        child: Icon(Icons.more_horiz_outlined, color: Colors.black),
                      )
                    ],
                  ),

                  Row(
                    mainAxisAlignment: MainAxisAlignment.end,
                    children: [
                      Container(
                        // padding: EdgeInsets.symmetric(vertical: 50, horizontal: 100),
                        margin: const EdgeInsets.only(top: 10, right: 15),
                        width: 160,
                        height: 45,
                        decoration: ShapeDecoration(
                            color: Colors.white,
                            shape: RoundedRectangleBorder(
                                borderRadius: BorderRadius.circular(10)
                            )
                        ),
                        child: Row(
                          children: [
                            const Icon(Icons.home_filled, size: 45, color: Colors.deepOrange),
                            Column(
                              mainAxisAlignment: MainAxisAlignment.center,
                              children: const [
                                Text(
                                  'Số dư khả dụng',
                                  style: TextStyle(
                                      fontSize: 14,
                                      color: Colors.black
                                  ),
                                ),

                                Text(
                                  '49,999,999',
                                  style: TextStyle(
                                      color: Colors.black,
                                      fontWeight: FontWeight.bold,
                                      fontSize: 14
                                  ),
                                )
                              ],
                            ),
                          ],
                        ),


                      )
                    ],
                  ),
                  Container(
                    height: 65,
                    margin: const EdgeInsets.symmetric(vertical: 40, horizontal: 15),
                    decoration: ShapeDecoration(
                        color: Colors.white,
                        shape: RoundedRectangleBorder(
                            borderRadius: BorderRadius.circular(15)
                        )
                    ),

                    child: Row(
                      mainAxisAlignment: MainAxisAlignment.spaceAround,
                      children: [
                        options(icon: Icons.credit_card_outlined, text: "Tài khoản và thẻ"),
                        options(icon: Icons.attach_money, text: "Rút tiền"),
                        options(icon: Icons.compare_arrows, text: "Chuyển tiền"),
                        options(icon: Icons.qr_code_2, text: "Mã Qr code")
                      ],
                    ),
                  ),

                  Container(
                    margin: const EdgeInsets.symmetric(vertical: 30, horizontal: 15),
                    height: 200,
                    color: Colors.white,
                    child: Column(
                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      children: [
                        Container(
                          padding: const EdgeInsets.symmetric(horizontal: 15, vertical: 5),
                          child: Row(
                            mainAxisAlignment: MainAxisAlignment.spaceBetween,
                            crossAxisAlignment: CrossAxisAlignment.center,
                            children: const [
                              Text(
                                "Lịch sử giao dịch",
                                style: TextStyle(
                                    fontSize: 18,
                                    color: Colors.black,
                                    fontWeight: FontWeight.bold
                                ),
                              ),

                              Icon(Icons.refresh, color: Colors.grey, size: 32,)
                            ],
                          ),
                        ),

                        Container(
                          padding: const EdgeInsets.symmetric(horizontal: 15),
                          alignment: Alignment.topLeft,
                          child: const Text(
                            "Hôm qua, 5 thg 1, 2023",
                            style: TextStyle(
                                fontSize: 12,
                                color: Colors.grey
                            ),
                          ),
                        ),

                        notices(icon: Icons.arrow_forward, color: Colors.greenAccent, title: "Truong Bach Chien", subTitle: "Chien chuyen tien hoc", money: "+ 10,000,000"),
                        notices(icon: Icons.arrow_back, color: Colors.red, title: "Truong Bach Chien", subTitle: "Thanh toan tien an", money: "- 5,000,000")



                      ],
                    ),
                  )

                ],
              ),
            )
          ],
        )
    );
  }
}

Container options({
  required IconData icon,
  required String text
}){
  return Container(
    child: Column(
      mainAxisAlignment: MainAxisAlignment.center,
      children: [
        Icon(icon, color: Colors.deepOrange, size: 35),
        Text(
          text,
          style: const TextStyle(
              color: Colors.black,
              fontSize: 12
          ),
        )
      ],
    ),
  );
}

Container notices({
  required IconData icon,
  required Color color,
  required String title,
  required String subTitle,
  required String money
}) {
  return Container(
    padding: const EdgeInsets.symmetric(vertical: 10, horizontal: 15),
    child: Row(
      mainAxisAlignment: MainAxisAlignment.spaceBetween,
      children: [
        Container(
          child: Column(
              children: [
                Row(
                  children: [
                    Icon(icon, size: 20, color: color),
                    Container(
                      padding: const EdgeInsets.only(left: 5),
                      child: Column(
                        mainAxisAlignment: MainAxisAlignment.start,
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          Text(
                            title,
                            style: const TextStyle(
                                fontSize: 17,
                                fontWeight: FontWeight.bold,
                                color: Colors.black
                            ),
                          ),

                          Text(
                            subTitle,
                            style: const TextStyle(
                              fontSize: 10,
                              color: Colors.grey,
                            ),
                          ),
                        ],
                      ),
                    )
                  ],
                )
              ]
          ),
        ),
        Container(
          child: Text(
            money,
            style: const TextStyle(
                fontSize: 15,
                fontWeight: FontWeight.bold,
                color: Colors.black
            ),
          ),
        )
      ],
    ),

  );
}







