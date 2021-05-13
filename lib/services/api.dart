import 'dart:convert';

import 'package:http/http.dart' as http;
import 'package:layout/models/orders_model.dart';
import 'package:layout/models/response_post.dart';

class ApiService {
  static final _host = 'http://localhost:3000/db';
  static final _baseUrl = 'http://localhost:3000';

  static Future<List<Order>> getListOrder() async {
    List<Order> listOrders = [];
    final response = await http.get('$_host');

    try {
      if (response.statusCode == 200) {
        final json = jsonDecode(response.body);
        ResponseOrders responeOrders = ResponseOrders.fromJson(json);
        responeOrders.orders.forEach((element) {
          listOrders.add(element);
        });
        return listOrders;
      } else {
        return [];
      }
    } catch (e) {
      return [];
    }
  }

  static baseUrl(){
    return _baseUrl;
  }

  static Future<ResponsePost> checkoutOrder(productName, weight, unit, image, category, price, qty, total, address, note, date ) async {

    try {
      final response = await http.post(
        '$_baseUrl/orders', 
        body: {
          "products_name": productName,
          "weight": weight,
          "unit": unit,
          "image": image,
          "category": category,
          "price": price,                                      
          "qty": qty,
          "total": total,
          "address": address,
          "note": note,
          "date": date     
        }
      );

      if(response.statusCode == 200) {
        ResponsePost responsePost = ResponsePost.fromJson(jsonDecode(response.body));
        return responsePost;
      } else {
        return ResponsePost(success: false, message: response.statusCode.toString(), id: null);
      }
    } catch (e){
      return ResponsePost(success: false, message:'error caught: $e',id: null );
    }        
  }

  static Future<ResponsePost> updateOrder(int id, String productName, int weight, String unit, String image, String category, int price, int qty, int total, String address, String note, String date) async {
    try {
      final response = await http.post(
        '$_baseUrl/orders/$id', 
        body: {
          "products_name": productName,
          "weight": weight,
          "unit": unit,
          "image": image,
          "category": category,
          "price": price,                                      
          "qty": qty,
          "total": total,
          "address": address,
          "note": note,
          "date": date   
        }
      );

      if(response.statusCode == 200){
        ResponsePost responsePost = ResponsePost.fromJson(jsonDecode(response.body));
        return responsePost;
      } else {
        return ResponsePost(success: false, message: response.statusCode.toString(), id: null);
      }
    } catch (e) {
      return ResponsePost(success: false, message:'error caught: $e',id: null );
    }
  }

  static Future<ResponsePost> deleteOrder(int id) async {
    try {
      final response = await http.delete('$_baseUrl/orders/$id');

      if(response.statusCode == 200){
        ResponsePost responsePost = ResponsePost.fromJson(jsonDecode(response.body));
        return responsePost;
      } else {
        return ResponsePost(success: false, message: response.statusCode.toString(), id: null);
      }

    } catch (e){
      return ResponsePost(success: false, message:'error caught: $e',id: null );
    }
  }

}