import 'package:amf/cubit/product_cubit.dart';
import 'package:amf/view/widget/products.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

import '../data/models/product.dart';

class ProductScreen extends StatefulWidget {
  const ProductScreen({super.key});

  @override
  State<ProductScreen> createState() => _ProductScreenState();
}

class _ProductScreenState extends State<ProductScreen> {
  late List<Product> prod ;
  late List<Product> searchedProduct;
  bool _isSearching = false;
  final _searchTextController = TextEditingController();

  Widget _buildSearchField() {
    return TextField(
      controller: _searchTextController,
      cursorColor: Colors.white,
      decoration: const InputDecoration(
        hintText: 'Find a product ...',
        border: InputBorder.none,
        hintStyle: TextStyle(color: Colors.black, fontSize: 18),
      ),
      style: const TextStyle(color: Colors.white, fontSize: 18),
      onChanged: (searchedPro) {
        addSearchedFOrItemsToSearchedList(searchedPro ,searchedPro,searchedPro);
      },
    );
  }

  void addSearchedFOrItemsToSearchedList(String t,String a,String c ) {
    searchedProduct = prod
        .where((product) =>
        product.title!.toLowerCase().startsWith(t))
        .toList();
    setState(() {});
    searchedProduct= prod.where((element) => element.addtions!.toLowerCase().startsWith(a)).toList();
    setState(() {

      });searchedProduct= prod.where((element) => element.brand!.toLowerCase().startsWith(c)).toList();
    setState(() {

      });
  }

  List<Widget> _buildAppBarActions() {
    if (_isSearching) {
      return [
        IconButton(
          onPressed: () {
            _clearSearch();
            Navigator.pop(context);
          },
          icon: const Icon(Icons.clear, color: Colors.white),
        ),
      ];
    } else {
      return [
        IconButton(
          onPressed: _startSearch,
          icon: const Icon(
            Icons.search,
            color: Colors.white,
          ),
        ),
      ];
    }
  }

  void _startSearch() {
    ModalRoute.of(context)!
        .addLocalHistoryEntry(LocalHistoryEntry(onRemove: _stopSearching));

    setState(() {
      _isSearching = true;
    });
  }

  void _stopSearching() {
    _clearSearch();

    setState(() {
      _isSearching = false;
    });
  }

  void _clearSearch() {
    setState(() {
      _searchTextController.clear();
    });
  }



  @override
  void initState() {
    // TODO: implement initState
    super.initState();
    BlocProvider.of<ProductCubit>(context).fetchModels();
  }

  @override
  Widget build(BuildContext context) {
    final titleController = TextEditingController();
    final brandController = TextEditingController();
    final sizeController = TextEditingController();
    final colorController = TextEditingController();
    final additionsController = TextEditingController();
    final priceController = TextEditingController();
    final proCub = context.read<ProductCubit>();

    return SafeArea(
        child: Scaffold(
      floatingActionButton: FloatingActionButton(
          child: const Icon(Icons.add),
          onPressed: () {
            showModalBottomSheet(
              showDragHandle: false,
              enableDrag: false,
              context: context,
              builder: (context) {
                return ListView(children: [
                  BottomSheet(
                    onClosing: () {},
                    builder: (context) {
                      return Container(
                        margin:
                            const EdgeInsets.only(top: 10, left: 20, right: 20),
                        child: Column(
                          children: [
                            const SizedBox(
                              height: 15,
                            ),
                            const Text(
                              "Add Product",
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
                              controller: titleController,
                              decoration: const InputDecoration(
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
                                  style: TextStyle(
                                      color: Colors.black87, fontSize: 23),
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
                                  style: TextStyle(
                                      color: Colors.black87, fontSize: 23),
                                ),
                                SizedBox(
                                  height: 5,
                                )
                              ],
                            ),
                            TextFormField(
                              controller: colorController,
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
                                  style: TextStyle(
                                      color: Colors.black87, fontSize: 23),
                                ),
                                SizedBox(
                                  height: 5,
                                )
                              ],
                            ),
                            TextFormField(
                              controller: additionsController,
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
                                proCub.AddProduct(addPro, context);

                              },
                              style: ButtonStyle(
                                  backgroundColor:
                                      MaterialStateProperty.all<Color>(
                                          Colors.black),
                                  minimumSize: MaterialStateProperty.all<Size>(
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
                      );
                    },
                  ),
                ]);
              },
            );
          }),
      appBar: AppBar(
        leading: _isSearching
            ? const BackButton(
          color: Colors.green,
        )
            : Container(),
        actions: _buildAppBarActions(),

            backgroundColor: const Color.fromRGBO(35, 52, 69, 10),
          title:  _isSearching ? _buildSearchField() :
          const Text(
            'Products',
            style: TextStyle(color: Colors.white, fontWeight: FontWeight.bold),
          ),
          shape: const RoundedRectangleBorder(
            borderRadius: BorderRadius.vertical(
              bottom: Radius.circular(10),
            ),
          )),
      body: BlocBuilder<ProductCubit, ProductState>(builder: (context, state) {
        if (state is ProductLoaded) {
           prod = state.product;
          return RefreshIndicator(
            onRefresh: () async {
              setState(() {
                BlocProvider.of<ProductCubit>(context).fetchModels();
              });
            },
            child: GridView.builder(
              itemBuilder: (context, index) {
                return Products(product: _searchTextController.text.isEmpty
                    ? prod[index]
                    : searchedProduct[index],
                );
              },
              itemCount:  _searchTextController.text.isEmpty
                  ? prod.length
                  : searchedProduct.length,
              gridDelegate: const SliverGridDelegateWithFixedCrossAxisCount(
                crossAxisCount: 2,
                childAspectRatio: 2 / 3,
                crossAxisSpacing: 1,
                mainAxisSpacing: 1,
              ),
              shrinkWrap: true,
              physics: const ClampingScrollPhysics(),
              padding: EdgeInsets.zero,
            ),
          );
        } else {
          return const Center(child: CircularProgressIndicator());
        }
      }),
    ));
  }
}
