import 'package:flutter/material.dart';
import 'package:flutter_advanced_drawer/flutter_advanced_drawer.dart';
import 'package:tobeto_app/components/drawer/my_advanced_drawer.dart';
import 'package:tobeto_app/components/drawer/my_appbar.dart';
import 'package:tobeto_app/components/drawer/my_drawer.dart';

class HomePage extends StatefulWidget {
  const HomePage({Key? key}) : super(key: key);

  @override
  _HomePageState createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
  @override
  Widget build(BuildContext context) {
    final drawerController = AdvancedDrawerController();

    return MyAdvancedDrawer(
      drawer: const MyDrawer(),
      controller: drawerController,
      child: Scaffold(
        body: Expanded(
          child: Column(
            children: [
              MyAppbar(drawerController: drawerController),
              const SizedBox(
                height: 40,
              ),
              const Padding(
                padding: EdgeInsets.symmetric(horizontal: 20),
                child: Column(
                  children: [
                    Row(
                      mainAxisAlignment: MainAxisAlignment.center,
                      children: [
                        Text(
                          "TOBETO",
                          style: TextStyle(
                              fontWeight: FontWeight.bold,
                              color: Colors.deepPurple,
                              fontSize: 24),
                        ),
                        Text(
                          "'ya hoş geldin",
                          style: TextStyle(fontSize: 24),
                        ),
                      ],
                    ),
                    Text(
                      "Kullanıcı",
                      style: TextStyle(fontSize: 24),
                    ),
                    SizedBox(
                      height: 20,
                    ),
                    Text(
                      textAlign: TextAlign.center,
                      style: TextStyle(
                        fontSize: 18,
                      ),
                      "Yeni nesil öğrenme deneyimi ile Tobeto kariyer yolculuğunda senin yanında!",
                    ),
                    SizedBox(
                      height: 50,
                    ),
                    Image(
                        width: 160,
                        image: AssetImage("assets/images/istanbul.png")),
                    SizedBox(
                      height: 50,
                    ),
                    Text(
                      textAlign: TextAlign.center,
                      style: TextStyle(
                        fontSize: 18,
                      ),
                      "Ücretsiz eğitimlerle, geleceğin mesleklerinde sen de yerini al.",
                    ),
                    SizedBox(
                      height: 20,
                    ),
                    Image(
                        width: 240, image: AssetImage("assets/images/is.png")),
                  ],
                ),
              ),
              // TAB BAR
              DefaultTabController(
                length: 4,
                child: Expanded(
                  child: Flex(
                    direction: Axis.vertical,
                    children: [
                      const TabBar(
                        tabs: [
                          Tab(
                            text: "Başvurularım",
                          ),
                          Tab(
                            text: "Eğitimlerim",
                          ),
                          Tab(
                            text: "Duyuru ve Haberlerim",
                          ),
                          Tab(
                            text: "Anketim",
                          ),
                        ],
                      ),
                      Expanded(
                        child: TabBarView(children: [
                          Container(
                            child: const Center(
                              child: Text("1. sayfa"),
                            ),
                          ),
                          Container(
                            child: const Center(
                              child: Text("2. sayfa"),
                            ),
                          ),
                          Container(
                            child: const Center(
                              child: Text("3. sayfa"),
                            ),
                          ),
                          Container(
                            child: const Center(
                              child: Text("4. sayfa"),
                            ),
                          )
                        ]),
                      ),
                    ],
                  ),
                ),
              ),
              const SizedBox(
                height: 50,
              ),
              const Text(
                "Sınavlarım",
                style: TextStyle(fontWeight: FontWeight.bold),
              ),
              const SizedBox(
                height: 60,
              ),
              const Image(image: AssetImage("assets/images/istanbul.png"))
            ],
          ),
        ),
      ),
    );
  }
}
