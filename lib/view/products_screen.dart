import 'package:amf/cubit/product_cubit.dart';
import 'package:amf/observer_utils.dart';
import 'package:amf/view/widget/products.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

import '../data/models/product.dart';

class ProductScreen extends StatefulWidget {
  const ProductScreen({super.key});

  @override
  State<ProductScreen> createState() => _ProductScreenState();
}

class _ProductScreenState extends State<ProductScreen> with RouteAware {
  late Product product;
  late List<Product> prod;
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
        addSearchedFOrItemsToSearchedList(
            searchedPro, searchedPro, searchedPro);
      },
    );
  }

  void addSearchedFOrItemsToSearchedList(String t, String a, String c) {
    searchedProduct = prod
        .where((product) => product.title!.toLowerCase().startsWith(t))
        .toList();
    setState(() {});
    searchedProduct = prod
        .where((element) => element.addtions!.toLowerCase().startsWith(a))
        .toList();
    setState(() {});
    searchedProduct = prod
        .where((element) => element.brand!.toLowerCase().startsWith(c))
        .toList();
    setState(() {});
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

  bool isGet = false;

  @override
  void initState() {
    super.initState();
    if (!isGet) {
      BlocProvider.of<ProductCubit>(context).fetchModels();
      isGet = true;
    }
  }

  @override
  void didPopNext() {
    setState(() {
      BlocProvider.of<ProductCubit>(context).fetchModels();
    });
  }

  @override
  void didChangeDependencies() {
    super.didChangeDependencies();
    ObserverUtils.routeObserver.subscribe(this, ModalRoute.of(context)!);
  }

  @override
  Widget build(BuildContext context) {


    double width = MediaQuery.of(context).size.width;
    double height = MediaQuery.of(context).size.height;

    return SafeArea(
        child: Scaffold(
      resizeToAvoidBottomInset: false,
      floatingActionButton: FloatingActionButton(
          child: const Icon(Icons.add),
          onPressed: () {
            Navigator.pushNamed(context, 'add',arguments: Product());
          }),
      appBar: AppBar(
        elevation: 0,
          leading: _isSearching
              ? const BackButton(
                  color: Colors.green,
                )
              : Container(),
          actions: _buildAppBarActions(),
          backgroundColor: const Color.fromRGBO(35, 52, 69, 10),
          title: _isSearching
              ? _buildSearchField()
              : const Text(
                  'Products',
                  style: TextStyle(
                      color: Colors.white, fontWeight: FontWeight.bold),
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
              // setState(() {
              //   BlocProvider.of<ProductCubit>(context).fetchModels();
              // });
            },
            child: GridView.builder(
              cacheExtent: 99999999,
              itemBuilder: (context, index) {
                return Products(
                  product: _searchTextController.text.isEmpty
                      ? prod[index]
                      : searchedProduct[index],
                );
              },
              itemCount: _searchTextController.text.isEmpty
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
