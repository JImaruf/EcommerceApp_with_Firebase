import 'package:dropdown_button2/dropdown_button2.dart';
import 'package:firebasetryflutter/widgets/dropdownbutton.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';


import '../controller/HomeController.dart';

class AddProduct extends StatelessWidget {
  const AddProduct({super.key});
  @override
  Widget build(BuildContext context) {
    return GetBuilder<HomeController>(builder: (ctrl) {
      return Scaffold(
        appBar: AppBar(
          title: Text("Add Product"),
          centerTitle: true,

        ),
        body: SingleChildScrollView(
          child: Container(
            margin: EdgeInsets.only(left: 15, right: 15),
            width: double.maxFinite,
            child: Column(

              crossAxisAlignment: CrossAxisAlignment.center,
              children: [
                Text("Add New Product", style: TextStyle(
                    color: Colors.blueAccent,
                    fontWeight: FontWeight.bold,
                    fontSize: 30),),
                SizedBox(height: 20,),

                TextField(
                  controller: ctrl.productNameController,
                  decoration: InputDecoration(
                      hintText: "Enter Your Product Name",
                      label: Text("Enter Your Product Name"),

                      border: OutlineInputBorder(

                          borderRadius: BorderRadius.circular(10)
                      )
                  ),
                ),
                SizedBox(height: 20,),
                TextField(
                  controller: ctrl.productDescriptionController,
                  maxLines: 4,
                  decoration: InputDecoration(
                      hintText: "Product Description",
                      label: Text("Product Description"),

                      border: OutlineInputBorder(

                          borderRadius: BorderRadius.circular(10)
                      )
                  ),
                ),
                SizedBox(height: 20,),
                TextField(
                  controller: ctrl.productImgController,
                  decoration: InputDecoration(
                      hintText: "image URL",
                      label: Text("Image URL"),
                      border: OutlineInputBorder(
                          borderRadius: BorderRadius.circular(10)
                      )
                  ),
                ),
                SizedBox(height: 20,),
                TextField(
                  controller: ctrl.productPriceController,
                  decoration: InputDecoration(
                      hintText: "Product Price",
                      label: Text("Product Price"),

                      border: OutlineInputBorder(

                          borderRadius: BorderRadius.circular(10)
                      )
                  ),
                ),
                SizedBox(height: 20,),
                Row(

                  mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                  children: [
                    DropDownBTN(items: ["Cat1", 'cat2', "cat3"],
                      hintText: ctrl.category,
                      onSelectedValue: (selectedValue) {
                           ctrl.category = selectedValue?? "Geenerel";
                           ctrl.update();

                      },),
                    DropDownBTN(items: ['Brand1', "Brand2", "Brand3"],
                      hintText: "Brand",
                      onSelectedValue: (selectedValue) {
                        print(selectedValue);
                      },)
                  ],
                ),
                SizedBox(height: 20,),
                Text("Offer Product?", style: TextStyle(fontSize: 15,
                    fontWeight: FontWeight.bold,
                    color: Colors.black54),),
                DropDownBTN(items: ["True", "False"],
                  hintText: "False",
                  onSelectedValue: (selectedValue) {

                  },),

                ElevatedButton(
                    onPressed: (){
                      ctrl.addProduct();
                    }, child: Text('Add Poduct')),
              ],
            ),
          ),
        ),
      );
    });
  }
}
