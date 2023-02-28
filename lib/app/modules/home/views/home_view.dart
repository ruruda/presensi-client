import 'package:flutter/material.dart';
import 'package:get/get.dart';

import '../controllers/home_controller.dart';

class HomeView extends GetView<HomeController> {
  const HomeView({Key? key}) : super(key: key);
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: PreferredSize(
        preferredSize: const Size.fromHeight(80),
        child: Container(
          padding: const EdgeInsets.fromLTRB(20, 53, 20, 0),
          alignment: Alignment.centerLeft,
          color: Colors.blue,
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              const Text(
                "Welcom back,",
                style: TextStyle(color: Colors.white, fontSize: 18),
              ),
              const SizedBox(height: 7),
              Text(
                "${controller.decode["name"]}",
                style:
                    const TextStyle(fontSize: 20, fontWeight: FontWeight.bold, color: Colors.white),
              ),
            ],
          ),
        ),
      ),
      body: Stack(
        children: [
          Container(
            height: Get.height / 5,
            decoration: const BoxDecoration(color: Colors.blue),
          ),
          ListView(
            padding: const EdgeInsets.symmetric(horizontal: 20, vertical: 30),
            children: [
              Container(
                color: Colors.red,
                alignment: Alignment.topLeft,
                height: Get.height / 3.8,
                child: Column(
                  children: [
                    const Text(
                      "Last Attendance",
                      style:
                          TextStyle(color: Colors.white, fontWeight: FontWeight.bold, fontSize: 16),
                    )
                  ],
                ),
              ),
              const SizedBox(height: 18),
              Container(
                constraints: BoxConstraints(minHeight: Get.height / 2.1),
                child: Column(
                  mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    const Text(
                      "Main Menu",
                      style:
                          TextStyle(fontSize: 16, color: Colors.black, fontWeight: FontWeight.bold),
                    ),
                    GridView.builder(
                      // padding: const EdgeInsets.only(top: 20),
                      physics: const NeverScrollableScrollPhysics(),
                      shrinkWrap: true,
                      itemCount: controller.menuItems.length,
                      gridDelegate: const SliverGridDelegateWithFixedCrossAxisCount(
                        crossAxisCount: 2,
                        mainAxisSpacing: 25,
                        crossAxisSpacing: 25,
                        childAspectRatio: 10 / 8,
                      ),
                      itemBuilder: (context, index) {
                        final Map<String, dynamic> item = controller.menuItems[index];

                        return Material(
                          color: item['color'],
                          borderRadius: BorderRadius.circular(20),
                          child: InkWell(
                            onTap: item['onTap'],
                            child: Column(
                              mainAxisAlignment: MainAxisAlignment.center,
                              children: [
                                SizedBox(
                                  width: 50,
                                  height: 50,
                                  child: Icon(item['icon'], size: 40, color: Colors.white),
                                ),
                                const SizedBox(height: 6),
                                Text(
                                  item['title'],
                                  style: const TextStyle(color: Colors.white, fontSize: 15),
                                )
                              ],
                            ),
                          ),
                        );
                      },
                    ),
                  ],
                ),
              )
            ],
          ),
        ],
      ),
    );
  }
}
