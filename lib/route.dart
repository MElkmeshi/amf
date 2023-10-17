import 'package:amf/cubit/product_cubit.dart';
import 'package:amf/data/webserviecs/webservice.dart';
import 'package:amf/view/add_product.dart';
import 'package:amf/view/edit_product.dart';
import 'package:amf/view/product_details.dart';
import 'package:amf/view/products_screen.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

import 'data/models/product.dart';

class AppRoute {
  static Route<dynamic>? generateRoute(RouteSettings settings) {
    switch (settings.name) {
      case '/':
        return MaterialPageRoute(
            builder: (context) => BlocProvider(
                  create: (_) => ProductCubit(WebService()),
                  child: const ProductScreen(),
                ));
      case '/details':
        final prod = settings.arguments as Product;

        return MaterialPageRoute(
            builder: (context) => BlocProvider(
                  create: (context) => ProductCubit(WebService()),
                  child: ProductDetail(
                    product: prod,
                  ),
                ));
      case 'edit':
        final p = settings.arguments as Product;
        return MaterialPageRoute(builder: (context)=>BlocProvider(create: (context)=> ProductCubit(WebService()),
        child:EditProduct(product: p,) ,
        ),
        );
      case 'add':
        final k = settings.arguments as Product;
        return MaterialPageRoute(builder: (context)=>BlocProvider(create: (context)=> ProductCubit(WebService()),
        child:AddProduct(product: k,) ,
        ),
        );
    }
    return null;
  }
}
