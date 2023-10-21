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
    BlocProvider.of<ProductCubit>(context).fetchProduct(_product.id!);
  }
  @override
  void setState(VoidCallback fn) {
    // TODO: implement setState
    super.setState(fn);
    BlocProvider.of<ProductCubit>(context).fetchProduct(_product.id!);

  }

  @override
  Widget build(BuildContext context) {

    double width = MediaQuery.of(context).size.width;
    double height = MediaQuery.of(context).size.height;


    return SafeArea(
      child: Scaffold(
        resizeToAvoidBottomInset: false,
        backgroundColor: Colors.white,
        floatingActionButton: FloatingActionButton(
            child: const Icon(Icons.edit),
            onPressed: () async{
            await  Navigator.pushNamed(context, 'edit',arguments: _product ).then((value) => setState((){
              BlocProvider.of<ProductCubit>(context).fetchProduct(_product.id!);

            }));
            }),
        body: BlocBuilder<ProductCubit, ProductState>(
  builder: (context, state) {
    if(state is OneProductAdded){
      final p = state.product;
    return CustomScrollView(
          physics: const ClampingScrollPhysics(),

          //physics: NeverScrollableScrollPhysics(),
          slivers: [
            SliverAppBar(
              elevation: 0,
              title: Text(
                '${p.title}',
                style: const TextStyle(
                    fontWeight: FontWeight.bold, color: Colors.blueGrey),
                textAlign: TextAlign.start,
              ),
              pinned: true,
              actions: [
                IconButton(
                    onPressed: () async {
                      showDialog(
                        context: context,
                        builder: (ctx) => AlertDialog(
                          icon: const Icon(Icons.add_alert),
                          title: const Text("Delete!"),
                          content: const Text("Do you want to Delete this product?",style: TextStyle(fontWeight: FontWeight.bold),),
                          actions: <Widget>[
                            TextButton(
                              child: const Text('Undo'),
                              onPressed: () {
                                Navigator.pop(context);
                              },
                            ),
                            TextButton(
                              child: const Text('Delete'),
                              onPressed: () async{
                                await BlocProvider.of<ProductCubit>(context).deletePro(_product.id!, context);
                                Navigator.pop(context);
                                setState(() {});
                              },
                            ),
                          ],
                        ),
                      );
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
                    '${p.pictureLink}',
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
                                style: TextStyle(color: Colors.black,
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
                                  text: '${p.size}',
                                  style: const TextStyle(
                                      color: Colors.black,
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
                                style: TextStyle(color: Colors.black,
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
                                  text: '${p.brand}',
                                  style: const TextStyle(color: Colors.black,
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
                                style: TextStyle(color: Colors.black,
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
                                  style: const TextStyle(color: Colors.black,
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
                              style: TextStyle(color: Colors.black,
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
                                  text: '${p.addtions}',
                                  style: const TextStyle(color: Colors.black,
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
        );
  }
    return const Center(child: CircularProgressIndicator());
    },
),
      ),
    );
  }
}
