import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:sizer/sizer.dart';
import 'package:to_do_app/controller/themeController.dart';
import 'package:to_do_app/modals/DataController.dart';

class HomePage extends StatefulWidget {
  const HomePage({Key? key}) : super(key: key);

  @override
  State<HomePage> createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
  @override
  Widget build(BuildContext context) {
    themeController themecontroller = Get.put(themeController());
    DataController dataController = Get.put(DataController());
    return Scaffold(
      appBar: AppBar(
        title: const Text("TO DO App"),
        centerTitle: true,
        actions: [
          GetBuilder<themeController>(builder: (_) {
            return Switch(
                activeColor: Colors.tealAccent,
                inactiveThumbColor: Colors.white,
                activeThumbImage: const AssetImage("assets/images/moon.png"),
                value: themecontroller.dark,
                onChanged: (val) {
                  themecontroller.themeChange(val);
                });
          }),
        ],
      ),
      body: Column(
        children: [
          SizedBox(
            height: 10,
          ),
          Expanded(
            flex: 2,
            child: Padding(
              padding: EdgeInsets.all(10),
              child: Container(
                  alignment: Alignment.center,
                  height: 100,
                  width: double.infinity,
                  decoration: BoxDecoration(
                    borderRadius: BorderRadius.circular(10),
                    gradient: LinearGradient(
                        colors: [Colors.blue.shade800, Colors.greenAccent]),
                  ),
                  child: Row(
                    children: [
                      const SizedBox(
                        width: 20,
                      ),
                      CircleAvatar(
                        radius: 35,
                        backgroundColor: Colors.blue.shade500,
                        child: Image.asset("assets/images/woman.png",
                            fit: BoxFit.fill),
                      ),
                      const SizedBox(
                        width: 10,
                      ),
                      Column(
                        mainAxisAlignment: MainAxisAlignment.center,
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: const [
                          Text(
                            "Hi, Ishika",
                            style: TextStyle(
                                fontWeight: FontWeight.bold,
                                fontSize: 25,
                                color: Colors.white),
                          ),
                          Text(
                            "Here is your Today's Task",
                            style: TextStyle(
                                fontWeight: FontWeight.w400,
                                fontSize: 17,
                                color: Colors.white),
                          ),
                        ],
                      ),
                    ],
                  )),
            ),
          ),
          const SizedBox(
            height: 20,
          ),
          Expanded(
            flex: 8,
            child: GetBuilder<DataController>(
              builder: (_) {
                return ListView.builder(
                    itemCount: dataController.list.length,
                    itemBuilder: (context, index) => Padding(
                          padding: const EdgeInsets.all(10),
                          child: Row(
                            children: [
                              Container(
                                height: 8.h,
                                width: 20.w,
                                alignment: Alignment.center,
                                decoration: BoxDecoration(
                                    border: Border.all(
                                        width: 5, color: Colors.black),
                                    borderRadius: BorderRadius.circular(10)),
                                child: Text(
                                  dataController.list[index].time,
                                  style: const TextStyle(
                                      fontSize: 20,
                                      fontWeight: FontWeight.bold),
                                ),
                              ),
                              SizedBox(width: 3.w),
                              Expanded(child: dataController.list[index].body)
                            ],
                          ),
                        ));
              },
            ),
          ),
        ],
      ),
      floatingActionButton: FloatingActionButton(
        onPressed: () {
          dataController.addToList();
        },
        child: const Icon(Icons.add),
      ),
    );
  }
}
