
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



  @override



  @override
  Widget build(BuildContext context) {
    final titleController = TextEditingController(text: '${widget.product.title}');
    final brandController = TextEditingController(text: '${widget.product.brand}');
    final sizeController = TextEditingController(text: '${widget.product.size}');
    final colorFeeController = TextEditingController(text: '${widget.product.color}');
    final additionsController = TextEditingController(text: '${widget.product.addtions}');
    final priceController = TextEditingController(text: '${widget.product.price}');
    final proCu = context.read<ProductCubit>();

    return Scaffold(
      backgroundColor: const Color.fromRGBO(35, 52, 69, 10),
      floatingActionButton: FloatingActionButton(
        onPressed: () {
          showModalBottomSheet(
            showDragHandle: false,
            enableDrag: false,
            context: context,
            builder: (context) {
              return ListView(children: [
                BottomSheet(
                  onClosing: (){},
                  builder: (BuildContext context) {
                    return Container(
                      margin: const EdgeInsets.only(top: 10, left: 20, right: 20),
                      child: Column(
                        children: [
                          const SizedBox(
                            height: 15,
                          ),
                          const Text(
                            "UpDate Product",
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
                                style: TextStyle(color: Colors.black87, fontSize: 23),
                              ),
                              SizedBox(
                                height: 5,
                              )
                            ],
                          ),
                          TextFormField(
                              controller: titleController,
                              decoration:  const InputDecoration(
                                labelStyle: TextStyle(color: Colors.black),
                                // border: InputBorder.none,
                                border: OutlineInputBorder(),
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
                            controller: brandController,
                            decoration: const InputDecoration(
                              // border: InputBorder.none,
                              border: OutlineInputBorder(),
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
                            controller: sizeController,
                            style: const TextStyle(color: Colors.black),
                            decoration: const InputDecoration(
                              border: OutlineInputBorder(),
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
                            controller: colorFeeController,
                            style: const TextStyle(color: Colors.black),
                            decoration: const InputDecoration(
                              // border: InputBorder.none,
                              border: OutlineInputBorder(),
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
                            controller: additionsController,
                            decoration:  const InputDecoration(

                              border: OutlineInputBorder(),
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
                            controller: priceController,
                            style: const TextStyle(color: Colors.black),
                            decoration: const InputDecoration(
                              border: OutlineInputBorder(),
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
                              final String color = colorFeeController.text;
                              final String additions = additionsController.text;
                              final String price = priceController.text;
                              final newpro = Product(
                                id: widget.product.id,
                                  title: title,
                                brand: brand,
                                size: int.tryParse(size),
                                color: color,
                                addtions: additions,
                                price: int.tryParse(price)

                              );
                              proCu.updatePro(newpro, context, widget.product.id!);

                            },
                            style: ButtonStyle(
                                backgroundColor:
                                MaterialStateProperty.all<Color>(Colors.black),
                                minimumSize: MaterialStateProperty.all<Size>(
                                    const Size(500, 60))),
                            child: const Text(
                              ' UPDATE Product',
                              style: TextStyle(color: Colors.white, fontSize: 25),
                            ),
                          ),
                          SizedBox(height: 10,)
                        ],
                      ),
                    );
                  },
                ),
              ]);
            },
          );
        },
        child: const Icon(Icons.edit),
      ),
      body: SafeArea(
        child: CustomScrollView(
          slivers: [
            SliverAppBar(
              elevation: 0,
              title: Text(
                '${widget.product.title}',
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
                          .deletePro(widget.product.id!, context);
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
              expandedHeight: 390,
              flexibleSpace: FlexibleSpaceBar(
                background: FadeInImage.assetNetwork(
                  placeholder: 'assets/images/loading.gif',
                  image: '${widget.product.pictureLink}',
                  fit: BoxFit.cover,
                ),
              ),
            ),
            SliverToBoxAdapter(
              child: Container(
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
                    Row(
                      children: [
                        RichText(
                            text: TextSpan(
                                text: '${widget.product.size}',
                                style: const TextStyle(
                                    fontSize: 20,
                                    fontWeight: FontWeight.w500))),
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
                    Row(
                      children: [
                        RichText(
                            text: TextSpan(
                                text: '${widget.product.brand}',
                                style: const TextStyle(
                                    fontSize: 20,
                                    fontWeight: FontWeight.w500))),
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
                    Row(
                      children: [
                        RichText(
                            text: TextSpan(
                                text: '${widget.product.color}',
                                style: const TextStyle(
                                    fontSize: 20,
                                    fontWeight: FontWeight.w500))),
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
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        RichText(
                            textAlign: TextAlign.left,
                            text: TextSpan(
                                text:
                                    '${widget.product.addtions}              ',
                                style: const TextStyle(
                                    fontSize: 20,
                                    fontWeight: FontWeight.w500))),
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

