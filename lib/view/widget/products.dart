import 'package:amf/data/models/product.dart';
import 'package:amf/imagecachemanager.dart';
import 'package:flutter/material.dart';
// import 'package:cached_network_image/cached_network_image.dart';

class Products extends StatelessWidget {
  final Product product;

  const Products({required this.product, super.key});

  @override
  Widget build(BuildContext context) {
    // double width = MediaQuery.of(context).size.width;
    // ignore: avoid_print
    // print("Build Product ${product.id}");
    return Container(
      width: double.infinity,
      margin: const EdgeInsetsDirectional.fromSTEB(8, 8, 8, 8),
      padding: const EdgeInsetsDirectional.all(4),
      decoration: BoxDecoration(
        color: Colors.white,
        borderRadius: BorderRadius.circular(8),
      ),
      child: InkWell(
        onTap: () {
          Navigator.pushNamed(context, '/details', arguments: product);
        },
        child: GridTile(
          footer: Container(
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
                    fontSize: 12,
                    color: Colors.white,
                    fontWeight: FontWeight.bold,
                  ),
                  overflow: TextOverflow.ellipsis,
                  maxLines: 2,
                  // textAlign: TextAlign.center,
                ),
                Text(
                  '  د ${product.price} ',
                  style: const TextStyle(
                    height: 1.3,
                    fontSize: 10,
                    color: Colors.white,
                    fontWeight: FontWeight.bold,
                  ),
                )
              ],
            ),
          ),
          child: Hero(
            tag: product.id ?? 0,
            child: Container(
              color: Colors.grey,
              child: ImageCacheManager().getImage(
                '${product.pictureLink}',
              ),
              // child: CachedNetworkImage(
              //   imageUrl: '${product.pictureLink}',
              //   fit: BoxFit.cover,
              //   width: double.infinity,
              //   height: double.infinity,
              //   placeholder: (context, url) => const Center(
              //     child: CircularProgressIndicator(),
              //   ),
              //   errorWidget: (context, url, error) => const Icon(Icons.error),
              // ),
            ),
          ),
        ),
      ),
    );
  }
}
