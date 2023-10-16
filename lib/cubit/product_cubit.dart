import 'package:amf/data/webserviecs/webservice.dart';
import 'package:bloc/bloc.dart';
import 'package:flutter/material.dart';

import '../data/models/product.dart';

part 'product_state.dart';

class ProductCubit extends Cubit<ProductState> {
  final WebService apiService;

  ProductCubit(this.apiService) : super(ProductInitial());

  Future<void> fetchModels() async {
    final models = await apiService.fetchList();
    emit(ProductLoaded(models));
  }

  Future<void> deletePro(int id, BuildContext context) async {
    await apiService.deleteProduct(id);
    emit(ProductDeleted());
    if (!context.mounted) return;
    ScaffoldMessenger.of(context).showSnackBar(
        const SnackBar(content: Text('Product deleted successfully')));
    Navigator.pop(context);
  }

  Future<void> updatePro(Product upDate, BuildContext context, int id) async {
    apiService.updateProduct(upDate, id);
    emit(ProductUpdated());
    Navigator.of(context).pop();
    ScaffoldMessenger.of(context)
        .showSnackBar(const SnackBar(content: Text('Product Updated ')));
  }

  Future<void> addProduct(Product addPro, BuildContext context) async {
    await apiService.addProduct(addPro);
    emit(ProductAdded());
    if (!context.mounted) return;
    Navigator.of(context).pop();
    ScaffoldMessenger.of(context)
        .showSnackBar(const SnackBar(content: Text('Product Added ')));
  }
}
