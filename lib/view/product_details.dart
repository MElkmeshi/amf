import 'package:amf/data/webserviecs/webservice.dart';
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

    double width = MediaQuery.of(context).size.width;
    double height = MediaQuery.of(context).size.height;


    return Scaffold(
      resizeToAvoidBottomInset: false,
      backgroundColor: const Color.fromRGBO(35, 52, 69, 10),
      floatingActionButton: FloatingActionButton(
          child: const Icon(Icons.edit),
          onPressed: () {
            Navigator.pushNamed(context, 'edit',arguments: _product ).then((value) => setState((){
              _product;
            }));
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
                      await BlocProvider.of<ProductCubit>(context).deletePro(_product.id!, context);
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
