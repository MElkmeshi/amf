import 'package:amf/imagecachemanager.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

import '../cubit/product_cubit.dart';
import '../data/models/product.dart';

class ProductDetail extends StatefulWidget {
  final Product product;

  const ProductDetail({required this.product, super.key});

  @override
  State<ProductDetail> createState() => _ProductDetailState();
}

class _ProductDetailState extends State<ProductDetail> {
  late Product _product;

  @override
  void initState() {
    super.initState();
    _product = widget.product;
  }

  @override
  Widget build(BuildContext context) {
    final titleController = TextEditingController(text: '${_product.title}');
    final brandController = TextEditingController(text: '${_product.brand}');
    final sizeController = TextEditingController(text: '${_product.size}');
    final colorController = TextEditingController(text: '${_product.color}');
    final additionsController =
        TextEditingController(text: '${_product.addtions}');
    final priceController = TextEditingController(text: '${_product.price}');
    final proCu = context.read<ProductCubit>();
    double width = MediaQuery.of(context).size.width;
    double height = MediaQuery.of(context).size.height;

    return Scaffold(
      resizeToAvoidBottomInset: false,
      backgroundColor: const Color.fromRGBO(35, 52, 69, 10),
      floatingActionButton: FloatingActionButton(
          child: const Icon(Icons.edit),
          onPressed: () {
            showModalBottomSheet(
              isScrollControlled: true,
              context: context,
              builder: (context) {
                return SingleChildScrollView(
                  physics: const BouncingScrollPhysics(),
                  child: Padding(
                    padding: EdgeInsets.only(
                        bottom: MediaQuery.of(context).viewInsets.bottom),
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
                              const Text(
                                "Edit Product",
                                style: TextStyle(
                                    fontSize: 25,
                                    color: Colors.black,
                                    fontWeight: FontWeight.bold),
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
                                autofocus: true,
                                keyboardType: TextInputType.number,
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
                                keyboardType: TextInputType.number,
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
                                  final String title = titleController.text;
                                  final String brand = brandController.text;
                                  final String size = sizeController.text;
                                  final String color = colorController.text;
                                  final String additions =
                                      additionsController.text;
                                  final String price = priceController.text;
                                  final editedProduct = Product(
                                      title: title,
                                      brand: brand,
                                      size: int.tryParse(size),
                                      color: color,
                                      addtions: additions,
                                      price: int.tryParse(price));
                                  proCu.updatePro(
                                      editedProduct, context, _product.id!);
                                  editedProduct.id = _product.id;
                                  editedProduct.pictureLink =
                                      _product.pictureLink;
                                  setState(() {
                                    _product = editedProduct;
                                  });
                                },
                                style: ButtonStyle(
                                    backgroundColor:
                                        MaterialStateProperty.all<Color>(
                                            Colors.black),
                                    minimumSize:
                                        MaterialStateProperty.all<Size>(
                                            const Size(500, 60))),
                                child: const Text(
                                  'Edit Product',
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
              },
            );
          }),
      body: SafeArea(
        child: CustomScrollView(
          physics: const ClampingScrollPhysics(),

          //physics: NeverScrollableScrollPhysics(),
          slivers: [
            SliverAppBar(
              elevation: 0,
              title: Text(
                '${_product.title}',
                style: const TextStyle(
                    fontWeight: FontWeight.bold, color: Colors.blueGrey),
                textAlign: TextAlign.start,
              ),
              pinned: true,
              actions: [
                IconButton(
                    onPressed: () async {
                      await context
                          .read<ProductCubit>()
                          .deletePro(_product.id!, context);
                    },
                    icon: const Icon(
                      Icons.delete_forever_outlined,
                      color: Colors.red,
                    ))
              ],
              shape: const RoundedRectangleBorder(
                  borderRadius: BorderRadius.vertical(
                bottom: Radius.circular(10),
              )),
              expandedHeight: height / 2.7,
              flexibleSpace: FlexibleSpaceBar(
                background: Hero(
                  tag: _product.id ?? 0,
                  child: ImageCacheManager().getImage(
                    '${_product.pictureLink}',
                  ),
                ),
              ),
            ),
            SliverToBoxAdapter(
              child: Container(
                width: width,
                margin: const EdgeInsets.only(top: 10, left: 20, right: 20),
                child: Column(
                  children: [
                    const SizedBox(
                      height: 10,
                    ),
                    Row(
                      children: [
                        RichText(
                            text: const TextSpan(
                                text: 'Size : ',
                                style: TextStyle(
                                    fontSize: 25, fontWeight: FontWeight.w500)))
                      ],
                    ),
                    const SizedBox(
                      height: 5,
                    ),
                    Column(
                      children: [
                        Align(
                          alignment: Alignment.centerLeft,
                          child: RichText(
                              text: TextSpan(
                                  text: '${_product.size}',
                                  style: const TextStyle(
                                      fontSize: 20,
                                      fontWeight: FontWeight.w300))),
                        ),
                      ],
                    ),
                    const SizedBox(
                      height: 20,
                    ),
                    Row(
                      children: [
                        RichText(
                            text: const TextSpan(
                                text: 'Brand :',
                                style: TextStyle(
                                    fontSize: 25, fontWeight: FontWeight.w500)))
                      ],
                    ),
                    const SizedBox(
                      height: 5,
                    ),
                    Column(
                      children: [
                        Align(
                          alignment: Alignment.centerLeft,
                          child: RichText(
                              text: TextSpan(
                                  text: '${_product.brand}',
                                  style: const TextStyle(
                                      fontSize: 20,
                                      fontWeight: FontWeight.w300))),
                        ),
                      ],
                    ),
                    const SizedBox(
                      height: 20,
                    ),
                    Row(
                      children: [
                        RichText(
                            text: const TextSpan(
                                text: 'Color :',
                                style: TextStyle(
                                    fontSize: 25, fontWeight: FontWeight.w500)))
                      ],
                    ),
                    const SizedBox(
                      height: 5,
                    ),
                    Column(
                      children: [
                        Align(
                          alignment: Alignment.centerLeft,
                          child: RichText(
                              text: TextSpan(
                                  text: '${_product.color}',
                                  style: const TextStyle(
                                      fontSize: 20,
                                      fontWeight: FontWeight.w300))),
                        ),
                      ],
                    ),
                    const SizedBox(
                      height: 20,
                    ),
                    Row(
                      children: [
                        RichText(
                          textAlign: TextAlign.start,
                          text: const TextSpan(children: [
                            TextSpan(
                              text: 'Additions :  ',
                              style: TextStyle(
                                  fontWeight: FontWeight.w500, fontSize: 25),
                            ),
                          ]),
                        ),
                      ],
                    ),
                    const SizedBox(
                      height: 5,
                    ),
                    Column(
                      children: [
                        Align(
                          alignment: Alignment.centerLeft,
                          child: RichText(
                              textAlign: TextAlign.left,
                              text: TextSpan(
                                  text: '${_product.addtions}',
                                  style: const TextStyle(
                                      fontSize: 20,
                                      fontWeight: FontWeight.w300))),
                        ),
                      ],
                    ),
                  ],
                ),
              ),
            )
          ],
        ),
      ),
    );
  }
}
