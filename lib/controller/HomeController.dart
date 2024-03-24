import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:firebase_core/firebase_core.dart';
import 'package:firebasetryflutter/models/productmodel.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

class HomeController extends GetxController {
  FirebaseFirestore mDB = FirebaseFirestore.instance;

  late CollectionReference productCollection;

  String test = 'test String';
  String category = "General";
  String brand = "Brand";

  TextEditingController productNameController = TextEditingController();
  TextEditingController productDescriptionController = TextEditingController();
  TextEditingController productImgController = TextEditingController();
  TextEditingController productPriceController = TextEditingController();

  @override
  void onInit() {
    productCollection = mDB.collection("productList");

    // TODO: implement onInit
    super.onInit();
  }

  addProduct() {
    try {
      DocumentReference doc = productCollection.doc();

      Product singleProduct = Product(
              id: doc.id,
              name: 'test name',
              category: 'boots',
              description: 'sdlkjf',
              brand: 'adidas',
              offer: false,
              image: 'url of image',
              price: 500);
      final productJson = singleProduct.toJson();
      doc.set(productJson);
    } catch (e) {
      Get.snackbar('Failed', e.toString());
    }
    // Map <String, dynamic> singleProduct = {
    //   "name": productNameController.text,
    //   "price": productPriceController.text,
    //   "description": productDescriptionController.text,
    //   "img": productImgController.text
    // };

    // productModel singleProduct = new productModel();
    // singleProduct.category='Maruf';
    // singleProduct.name='Maruf';
    // singleProduct.price='Maruf';
    // singleProduct.offer='Maruf';
    // singleProduct.description='Maruf';
    // singleProduct.url='Maruf';
    // singleProduct.brand='Maruf';
    // print("clicked");
    //
    // mDB.collection("collectionPath").add(singleProduct);
  }

  getProduct() {
    List<Map<String, dynamic>> allproduct =
        mDB.collection("collectionPath").get() as List<Map<String, dynamic>>;
  }
}
