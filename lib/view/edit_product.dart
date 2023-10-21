import 'dart:convert';

import 'package:amf/cubit/product_cubit.dart';
import 'package:amf/data/models/product.dart';
import 'package:amf/data/webserviecs/webservice.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:image_picker/image_picker.dart';

class EditProduct extends StatefulWidget {
  final Product product;

  const EditProduct({required this.product, super.key});

  @override
  State<EditProduct> createState() => _EditProductState();
}

class _EditProductState extends State<EditProduct> {
  late Product _product;

  @override
  void initState() {
    super.initState();
    _product = widget.product;
  }
 /* final ImagePicker _picker = ImagePicker();
  late String? _imageUrl;

  Future<void> _changeImage() async {
    final pickedFile = await _picker.pickImage(source: ImageSource.gallery);
    if (pickedFile != null) {
      final String base64Image = base64Encode(await pickedFile.readAsBytes());
       _imageUrl= 'data:image/png;base64,$base64Image';
      WebService().changeImage(_imageUrl!, _product.id!); // Replace 1 with the actual user ID
    }
  }*/


  @override
  Widget build(BuildContext context) {
    final titleController = TextEditingController(text: '${_product.title}');
    final brandController = TextEditingController(text: '${_product.brand}');
    final sizeController = TextEditingController(text: '${_product.size}');
    final colorController = TextEditingController(text: '${_product.color}');
    final additionsController =
        TextEditingController(text: '${_product.addtions}');
    final priceController = TextEditingController(text: '${_product.price}');
    double width = MediaQuery.of(context).size.width;
    double height = MediaQuery.of(context).size.height;


    return Scaffold(
        appBar: AppBar(
          centerTitle: true,
          title: const Text(
            "Edit Product",
            style: TextStyle(
                fontSize: 25, color: Colors.black, fontWeight: FontWeight.bold),
          ),
          elevation: 0,
          backgroundColor: Colors.white,
          leading: BackButton(
            color: Colors.black,
            onPressed: () {
               Navigator.of(context).pop();
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
                    top: height / 50, left: height / 28, right: height / 28),
                child: Column(
                  children: [
                    const SizedBox(
                      height: 15,
                    ),
                    const Row(
                      children: [
                        Text(
                          'Title',
                          style: TextStyle(color: Colors.black87, fontSize: 23),
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
                        labelStyle: const TextStyle(color: Colors.black54),
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
                          style: TextStyle(color: Colors.black87, fontSize: 23),
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
                          style: TextStyle(color: Colors.black87, fontSize: 23),
                        ),
                        SizedBox(
                          height: 5,
                        )
                      ],
                    ),
                    TextFormField(
                      autofocus: true,
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
                          style: TextStyle(color: Colors.black87, fontSize: 23),
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
                          style: TextStyle(color: Colors.black87, fontSize: 23),
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
                          style: TextStyle(color: Colors.black87, fontSize: 23),
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
                      height: 10,
                    ),
   /*                 Column(
                      children: [
                        TextButton(onPressed: (){
                          _changeImage();
                        }, child: Text('Edit Image',style: TextStyle(color: Colors.black,fontSize: 15),)),
                        if(_product.pictureLink != null)
                          Image.network('${_product.pictureLink}')

                      ],
                    ),
                    SizedBox(height: 10,),*/
                    ElevatedButton(
                      onPressed: () {
                        AlertDialog alertDialog = const AlertDialog(
                          backgroundColor: Colors.transparent,
                          elevation: 0,
                          content: Center(
                            child: CircularProgressIndicator(
                              valueColor:
                                  AlwaysStoppedAnimation<Color>(Colors.black),
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
                        final String additions = additionsController.text;
                        final String price = priceController.text;
                        final editedProduct = Product(
                            title: title,
                            brand: brand,
                            size: int.tryParse(size),
                            color: color,
                            addtions: additions,
                            price: int.tryParse(price));
                        BlocProvider.of<ProductCubit>(context)
                            .updatePro(editedProduct, context, _product.id!);
                        editedProduct.id = _product.id;
                        editedProduct.pictureLink = _product.pictureLink;
                          setState(() {
                            _product = editedProduct;
                          });

                      },
                      style: ButtonStyle(
                          backgroundColor:
                              MaterialStateProperty.all<Color>(Colors.black),
                          minimumSize: MaterialStateProperty.all<Size>(
                              const Size(500, 60))),
                      child: const Text(
                        'Edit Product',
                        style: TextStyle(color: Colors.white, fontSize: 25),
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
        ));

  }

}
