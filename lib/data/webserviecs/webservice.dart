

import 'dart:convert';
import 'dart:io';
import 'package:http_parser/http_parser.dart';
import 'package:amf/data/models/product.dart';
import 'package:http/http.dart' as http;
import 'package:http/http.dart';
import 'package:image_picker/image_picker.dart';

class WebService{


  Future<List<Product>> fetchList() async {
    var url = 'https://ez-libya.com/api/v1/amf';
    Response response = await http.get(Uri.parse(url));

    if (response.statusCode == 200) {
      final List<dynamic> responseData = json.decode(response.body);
      final List<Product> models = responseData.map((json) => Product.fromJson(json)).toList();
      return models;
    } else {
      throw Exception('Failed to fetch models');
    }
  }

  Future<void> deleteProduct(int id )async{
    var request = http.Request('DELETE', Uri.parse('https://ez-libya.com/api/v1/amf/${id}'));
    http.StreamedResponse response = await request.send();
    if (response.statusCode == 200) {
      print(await response.stream.bytesToString());
    }
    else {
    print(response.reasonPhrase);
    }
  }

  Future<void> updateProduct(Product updateProduct, int id)async {
    var headers = {
      'Content-Type': 'application/json'
    };
    var request = http.Request('POST', Uri.parse('https://ez-libya.com/api/v1/amf/${id}'));
    request.body = json.encode({
      "Title": updateProduct.title,
      "Color": updateProduct.color,
      "Addtions": updateProduct.addtions,
      "Brand": updateProduct.brand,
      "Size": updateProduct.size,
      "Price": updateProduct.price
    });
    request.headers.addAll(headers);

    http.StreamedResponse response = await request.send();

    if (response.statusCode == 200) {
      print(await response.stream.bytesToString());
    }
    else {
      print(response.reasonPhrase);
    }
  }
  Future<void> addProduct(Product addProduct)async{
    var request = http.MultipartRequest('POST', Uri.parse('http://ez-libya.com/api/v1/additem'));
    request.fields.addAll({
      'Title' : '${addProduct.title}',
      'Brand': '${addProduct.brand}',
      'Color':'${addProduct.color}',
      'Addtions': '${addProduct.addtions}',
      'Size': '${addProduct.size}',
      'Price': '${addProduct.price}'
    });
    final imageFile = await selectImage();
    if (imageFile == null) {
      return; // No image selected
    }
    request.files.add(
      http.MultipartFile.fromBytes(
        'Image',
        await imageFile.readAsBytes(),
        filename: 'image.jpg',
        contentType: MediaType('application', 'jpg'),),
    );



    http.StreamedResponse response = await request.send();

    if (response.statusCode == 200) {
    print(await response.stream.bytesToString());
    }
    else {
    print(response.reasonPhrase);
    }
  }
    Future<File?> selectImage() async {
    final pickedFile = await ImagePicker().pickImage(source: ImageSource.gallery);
    if (pickedFile != null) {
      return File(pickedFile.path);
    }
    return null;
  }

}