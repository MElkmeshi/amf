import 'dart:collection';
import 'package:cached_network_image/cached_network_image.dart';
import 'package:flutter/material.dart';

class ImageCacheManager {
  static final ImageCacheManager _instance = ImageCacheManager._internal();
  final _imageCache = HashMap<String, CachedNetworkImage>();

  factory ImageCacheManager() {
    return _instance;
  }

  ImageCacheManager._internal();

  CachedNetworkImage getImage(String url) {
    if (_imageCache.containsKey(url)) {
      return _imageCache[url]!;
    } else {
      var image = CachedNetworkImage(
        imageUrl: url,
        fit: BoxFit.cover,
        width: double.infinity,
        height: double.infinity,
        placeholder: (context, url) =>
            Center(
              child: Container(),
            ),
        errorWidget: (context, url, error) => const Icon(Icons.error),
      );
      _imageCache[url] = image;
      return image;
    }
  }

  void removeImage(String url) {
      var image = CachedNetworkImage(
        imageUrl: url,
        fit: BoxFit.cover,
        width: double.infinity,
        height: double.infinity,
        placeholder: (context, url) =>
            Center(
              child: Container(),
            ),
        errorWidget: (context, url, error) => const Icon(Icons.error),
      );
      _imageCache[url] = image;
  }

}