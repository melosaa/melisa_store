import 'package:auto_route/annotations.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';

@RoutePage()
class HomeView extends StatelessWidget {
  const HomeView({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Color.fromARGB(243, 243, 243, 243),
      appBar: AppBar(
        backgroundColor: Colors.white,
        title: const Text("Home Page"),
      ),
      body: SafeArea(
        child: Padding(
          padding: const EdgeInsets.all(40.0),
          child: Column(
            children: [
              Row(
                children: [
                  Expanded(
                    child: Container(
                      width: 50,
                      height: 70,
                      decoration: BoxDecoration(
                          color: const Color.fromRGBO(202, 190, 190, 0.051),
                          borderRadius: BorderRadius.circular(
                            15,
                          ),
                          border: Border.all(color: Colors.black)),
                      padding: const EdgeInsets.symmetric(horizontal: 16.0),
                      child: const Row(
                        children: [
                          Icon(
                            Icons.search,
                            color: Colors.grey,
                          ),
                          SizedBox(width: 10),
                          Expanded(
                            child: TextField(
                              decoration: InputDecoration(
                                hintText: 'Search',
                                hintStyle: TextStyle(color: Colors.grey),
                                border: InputBorder.none,
                              ),
                              style: TextStyle(color: Colors.grey),
                            ),
                          ),
                        ],
                      ),
                    ),
                  ),
                ],
              ),
              const SizedBox(
                height: 60,
              ),
              Row(
                mainAxisAlignment: MainAxisAlignment.spaceAround,
                children: [
                  Container(
                    width: 70,
                    height: 70,
                    decoration: BoxDecoration(
                        border: Border.all(
                            color: const Color.fromARGB(255, 212, 211, 211)),
                        shape: BoxShape.circle,
                        color: Colors.white),
                    child: const Icon(Icons.view_cozy),
                  ),
                  const SizedBox(
                    width: 20,
                  ),
                  Container(
                    width: 70,
                    height: 70,
                    decoration: BoxDecoration(
                        border: Border.all(
                            color: const Color.fromARGB(255, 212, 211, 211)),
                        shape: BoxShape.circle,
                        color: Colors.white),
                    child: const Icon(
                      Icons.add_shopping_cart,
                      color: Colors.blue,
                    ),
                  ),
                  const SizedBox(
                    width: 20,
                  ),
                  Container(
                      width: 70,
                      height: 70,
                      decoration: BoxDecoration(
                          border: Border.all(
                              color: const Color.fromARGB(255, 212, 211, 211)),
                          shape: BoxShape.circle,
                          color: Colors.white),
                      child: const Icon(
                        CupertinoIcons.eyeglasses,
                        color: Colors.blue,
                      )),
                  const SizedBox(
                    width: 20,
                  ),
                  Container(
                    width: 70,
                    height: 70,
                    decoration: BoxDecoration(
                        border: Border.all(
                            color: const Color.fromARGB(255, 212, 211, 211)),
                        shape: BoxShape.circle,
                        color: Colors.white),
                    child: const Icon(
                      Icons.shopping_bag,
                      color: Colors.brown,
                    ),
                  ),
                  const SizedBox(
                    width: 20,
                  ),
                ],
              ),
              const SizedBox(
                height: 30,
              ),
              Container(
                padding: const EdgeInsets.all(10.0),
                width: 480,
                height: 150,
                decoration: BoxDecoration(
                  border: Border.all(
                      color: const Color.fromARGB(210, 118, 118, 119)),
                  color: Colors.white,
                  borderRadius: const BorderRadius.all(
                    Radius.circular(30),
                  ),
                ),
                child: Center(
                  child: Stack(
                    children: [
                      Positioned(
                        top: 30,
                        left: 60,
                        child: Container(
                          width: 50,
                          height: 50,
                          decoration: BoxDecoration(
                            border: Border.all(
                                color:
                                    const Color.fromARGB(210, 118, 118, 119)),
                            color: const Color.fromARGB(255, 212, 212, 211),
                            borderRadius: const BorderRadius.all(
                              Radius.circular(10),
                            ),
                          ),
                          child: const Icon(Icons.percent),
                        ),
                      ),
                      const Positioned(
                        top: 30,
                        left: 180,
                        child: Column(
                          children: [
                            Text(
                              "50% OFF",
                              style: TextStyle(
                                  fontWeight: FontWeight.w600, fontSize: 30),
                            ),
                            Text(
                              "an all woman's shoes",
                              style: TextStyle(
                                  fontWeight: FontWeight.w400, fontSize: 15),
                            ),
                          ],
                        ),
                      ),
                      const Positioned(
                        top: 50,
                        right: 60,
                        child: Row(
                          children: [Icon(Icons.arrow_forward_ios)],
                        ),
                      ),
                    ],
                  ),
                ),
              ),
              const SizedBox(
                height: 40,
              ),
              Expanded(
                child: GridView.builder(
                  gridDelegate: const SliverGridDelegateWithFixedCrossAxisCount(
                      crossAxisSpacing: 30.0,
                      mainAxisSpacing: 30.0,
                      crossAxisCount: 2),
                  itemCount: 10,
                  itemBuilder: (context, index) {
                    return Container(
                      padding: const EdgeInsetsDirectional.all(20.0),
                      decoration: BoxDecoration(
                          color: Colors.white,
                          borderRadius: BorderRadius.circular(20),
                          border: Border.all(
                            color: Colors.grey,
                          )),
                      child: const Center(
                        child: Text("Item &index"),
                      ),
                    );
                  },
                ),
              ),
            ],
          ),
        ),
      ),
      bottomNavigationBar: BottomNavigationBar(
          type: BottomNavigationBarType.shifting,
          items: const <BottomNavigationBarItem>[
            BottomNavigationBarItem(
              backgroundColor: Color.fromARGB(255, 35, 39, 44),
              icon: Icon(
                Icons.home,
                color: Colors.yellow,
              ),
              label: "home",
            ),
            BottomNavigationBarItem(
              icon: Icon(
                Icons.heart_broken_sharp,
                color: Colors.yellow,
              ),
              label: "favorites",
            ),
            BottomNavigationBarItem(
              icon: Icon(
                Icons.shopping_bag_rounded,
                color: Colors.yellow,
              ),
              label: "shopping",
            ),
            BottomNavigationBarItem(
              icon: Icon(
                Icons.person,
                color: Colors.yellow,
              ),
              label: "account",
            ),
          ]),
    );
  }
}
