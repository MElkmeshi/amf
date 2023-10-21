import 'package:amf/cubit/product_cubit.dart';
import 'package:amf/data/models/product.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
class AddProduct extends StatefulWidget {
  final Product product;
  const AddProduct({required this.product,super.key});

  @override
  State<AddProduct> createState() => _AddProductState();
}

class _AddProductState extends State<AddProduct> {
  @override
  Widget build(BuildContext context) {
    final titleController = TextEditingController();
    final brandController = TextEditingController();
    final sizeController = TextEditingController();
    final colorController = TextEditingController();
    final additionsController = TextEditingController();
    final priceController = TextEditingController();

    double width = MediaQuery.of(context).size.width;
    double height = MediaQuery.of(context).size.height;

    return Scaffold(
      appBar: AppBar(
        elevation: 0,
        centerTitle: true,
        title: const Text(
          "Add Product",
          style: TextStyle(
              fontSize: 25,
              color: Colors.black,
              fontWeight: FontWeight.bold),
        ),
        backgroundColor: Colors.white,
        leading: BackButton(
          color: Colors.black,
          onPressed: (){
            Navigator.pop(context);
          },
        ),
      ),
      body: SingleChildScrollView(
        physics: const BouncingScrollPhysics(),
        child: Column(
          children: [
            Container(
              //height: height*.70,
              width: width,
              margin: EdgeInsets.only(
                  top: height / 50,
                  left: height / 28,
                  right: height / 28),
              child: Column(
                children: [
                  const SizedBox(
                    height: 15,
                  ),

                  const SizedBox(
                    height: 10,
                  ),
                  const Row(
                    children: [
                      Text(
                        'Title',
                        style: TextStyle(
                            color: Colors.black87, fontSize: 23),
                      ),
                      SizedBox(
                        height: 5,
                      )
                    ],
                  ),
                  TextFormField(
                    autofocus: true,
                    controller: titleController,
                    decoration: InputDecoration(
                      enabledBorder: OutlineInputBorder(
                        borderRadius: BorderRadius.circular(50.0),
                      ),
                      labelStyle:
                      const TextStyle(color: Colors.black54),
                      // border: InputBorder.none,
                      border: const OutlineInputBorder(),
                    ),
                  ),
                  const SizedBox(
                    height: 10,
                  ),
                  const Row(
                    children: [
                      Text(
                        'Brand',
                        style: TextStyle(
                            color: Colors.black87, fontSize: 23),
                      ),
                      SizedBox(
                        height: 5,
                      )
                    ],
                  ),
                  TextFormField(
                    autofocus: true,
                    controller: brandController,
                    style: const TextStyle(color: Colors.black54),
                    decoration: InputDecoration(
                      enabledBorder: OutlineInputBorder(
                        borderRadius: BorderRadius.circular(50.0),
                      ),
                      // border: InputBorder.none,
                      border: const OutlineInputBorder(),
                    ),
                  ),
                  const SizedBox(
                    height: 10,
                  ),
                  const Row(
                    children: [
                      Text(
                        'Size',
                        style: TextStyle(
                            color: Colors.black87, fontSize: 23),
                      ),
                      SizedBox(
                        height: 5,
                      )
                    ],
                  ),
                  TextFormField(
                    controller: sizeController,
                    style: const TextStyle(color: Colors.black54),
                    decoration: InputDecoration(
                      enabledBorder: OutlineInputBorder(
                        borderRadius: BorderRadius.circular(50.0),
                      ),
                      border: const OutlineInputBorder(),
                    ),
                  ),
                  const SizedBox(
                    height: 10,
                  ),
                  const Row(
                    children: [
                      Text(
                        'Color',
                        style: TextStyle(
                            color: Colors.black87, fontSize: 23),
                      ),
                      SizedBox(
                        height: 5,
                      )
                    ],
                  ),
                  TextFormField(
                    autofocus: true,
                    controller: colorController,
                    style: const TextStyle(color: Colors.black54),
                    decoration: InputDecoration(
                      enabledBorder: OutlineInputBorder(
                        borderRadius: BorderRadius.circular(50.0),
                      ),
                      // border: InputBorder.none,
                      border: const OutlineInputBorder(),
                    ),
                  ),
                  const SizedBox(
                    height: 10,
                  ),
                  const Row(
                    children: [
                      Text(
                        'Additions',
                        style: TextStyle(
                            color: Colors.black87, fontSize: 23),
                      ),
                      SizedBox(
                        height: 5,
                      )
                    ],
                  ),
                  TextFormField(
                    autofocus: true,
                    controller: additionsController,
                    decoration: InputDecoration(
                      enabledBorder: OutlineInputBorder(
                        borderRadius: BorderRadius.circular(50.0),
                      ),
                      border: const OutlineInputBorder(),
                    ),
                  ),
                  const SizedBox(
                    height: 10,
                  ),
                  const Row(
                    children: [
                      Text(
                        'Price',
                        style: TextStyle(
                            color: Colors.black87, fontSize: 23),
                      ),
                      SizedBox(
                        height: 5,
                      )
                    ],
                  ),
                  TextFormField(
                    autofocus: true,
                    controller: priceController,
                    style: const TextStyle(color: Colors.black54),
                    decoration: InputDecoration(
                      enabledBorder: OutlineInputBorder(
                        borderRadius: BorderRadius.circular(50.0),
                      ),
                      border: const OutlineInputBorder(),
                    ),
                  ),
                  const SizedBox(
                    height: 20,
                  ),
                  ElevatedButton(
                    onPressed: () {
                      AlertDialog alertDialog = const AlertDialog(
                        backgroundColor: Colors.black54,
                        elevation: 0,
                        content: SizedBox(
                          height: 70,
                          width: 40,
                          child: Center(
                            child: Column(
                              children: [
                                CircularProgressIndicator(
                                  valueColor: AlwaysStoppedAnimation<Color>(Colors.white),
                                ),
                                SizedBox(height: 10,),
                                Text('Adding Product ...',style: TextStyle(fontWeight: FontWeight.bold,color: Colors.white),),

                              ],
                            ),
                          ),
                        ),
                      );

                      showDialog(
                        barrierColor: Colors.white.withOpacity(0),
                        barrierDismissible: false,
                        context: context,
                        builder: (context) {
                          return alertDialog;
                        },
                      );

                      final String title = titleController.text;
                      final String brand = brandController.text;
                      final String size = sizeController.text;
                      final String color = colorController.text;
                      final String additions =
                          additionsController.text;
                      final String price = priceController.text;
                      final addPro = Product(
                          title: title,
                          brand: brand,
                          size: int.tryParse(size),
                          color: color,
                          addtions: additions,
                          price: int.tryParse(price));
                      BlocProvider.of<ProductCubit>(context).addProduct(addPro, context);

                    },
                    style: ButtonStyle(
                        backgroundColor:
                        MaterialStateProperty.all<Color>(
                            Colors.black),
                        minimumSize:
                        MaterialStateProperty.all<Size>(
                            const Size(500, 60))),
                    child: const Text(
                      ' Add Product',
                      style: TextStyle(
                          color: Colors.white, fontSize: 25),
                    ),
                  ),
                  const SizedBox(
                    height: 10,
                  )
                ],
              ),
            )
          ],
        ),
      ),
    );
  }
}
