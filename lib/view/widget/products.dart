import 'package:amf/data/models/product.dart';
import 'package:flutter/material.dart';

class Products extends StatelessWidget {
  final Product product;

  const Products({ required this.product ,super.key});

  @override
  Widget build(BuildContext context) {
    return Container(
      width: double.infinity,
      margin: const EdgeInsetsDirectional.fromSTEB(8, 8, 8, 8),
      padding: const EdgeInsetsDirectional.all(4),
      decoration: BoxDecoration(
        color: Colors.white,
        borderRadius: BorderRadius.circular(8),
      ),
      child: InkWell(
        onTap: () async{ await Navigator.pushNamed(context,'/details' , arguments: product);},
        child: GridTile(
          child: Container(
            color: Colors.grey,
            child: FadeInImage.assetNetwork(
              width: double.infinity,
              height: double.infinity,
              placeholder: 'assets/images/loading.gif',
              image: '${product.pictureLink}',
              fit: BoxFit.cover,
            )
          ),
          footer: Container(
            width: double.infinity,
            padding: const EdgeInsets.symmetric(horizontal: 15, vertical: 10),
            color: Colors.black54,
            alignment: Alignment.bottomCenter,
            child: Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                Text(
                  '${product.title}',
                  style: const TextStyle(
                    height: 1.3,
                    fontSize: 16,
                    color: Colors.white,
                    fontWeight: FontWeight.bold,
                  ),
                  overflow: TextOverflow.ellipsis,
                  maxLines: 2,
                 // textAlign: TextAlign.center,
                ),
                Text('  د ${product.price} ',style: const TextStyle(
                  height: 1.3,
                  fontSize: 16,
                  color: Colors.white,
                  fontWeight: FontWeight.bold,
                ),)
              ],
            ),
          ),
        ),
      ),
    );
  }
}
