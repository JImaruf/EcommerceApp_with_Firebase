

import 'package:firebasetryflutter/controller/HomeController.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

import 'AddProduct.dart';

class MyHomePage extends StatelessWidget {

  const MyHomePage({super.key});

  @override
  Widget build(BuildContext context) {
    return GetBuilder<HomeController>(
      assignId: true,
      builder: (ctrl) {
        return Scaffold(
          body: ListView.builder(
            itemCount: 10,
            itemBuilder: (context, index) {
            return ListTile(
              title: Text("Samsung"),
              subtitle: Text("Price"),
              trailing: IconButton(onPressed: () {
                Get.snackbar("Hello", "Clicked", colorText: Colors.green,
                    backgroundColor: Colors.white);
              }, icon: Icon(Icons.delete)),
            );
          },),

          floatingActionButton: FloatingActionButton(onPressed: () {

            Get.to(AddProduct());


          },
            child: Icon(Icons.add),),
        );
      },
    );
  }
}
