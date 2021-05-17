import 'dart:convert';

import 'package:http/http.dart' as http;
import 'package:layout/models/orders_model.dart';
import 'package:layout/models/response_post.dart';

class ApiService {
  static final _host = 'http://localhost:3000';

  static Future<List<Order>> getListOrder() async {
    List<Order> listOrders = [];
    final response = await http.get('$_host/db');

    try {
      if (response.statusCode == 200 || response.statusCode == 304) {
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

  static Future<ResponsePost> checkoutOrder(productName, weight, unit, image, category, price, qty, total, address, note, date) async {

    try {
      final response = await http.post(
        '$_host/orders', 
        body: {
          'products_name': productName,
          'weight': weight,
          'unit': unit,
          'image': image,
          'category': category,
          'price': price,
          'qty': qty,
          'total': total,
          'address': address,
          'note': note,
          'date': date   
        }
      );
      
      if(response.statusCode == 200 || response.statusCode == 201){
        ResponsePost responsePost = ResponsePost(success: true, message: "Checkout Success");
        return responsePost;
      } else {
        return ResponsePost(success: false, message: "Checkout Error", id: null);
      }     
      
    } catch (e){
      return ResponsePost(success: false, message:'error caught: $e',id: null );
    }        
  }

  static Future<ResponsePost> updateOrder(id, productName, weight, unit, image, category, price, qty, total, address, note, date) async {
    try {
      final response = await http.put(
        '$_host/orders/$id', 
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
        ResponsePost responsePost = ResponsePost(success: true, message: "Update Success", id: id);
        return responsePost;
      } else {
        return ResponsePost(success: false, message: "Update Error", id: null);
      }
    } catch (e) {
      return ResponsePost(success: false, message:'error caught: $e',id: null );
    }
  }

  static Future<ResponsePost> deleteOrder(int id) async {
    try {
      final response = await http.delete('$_host/orders/$id');

      if(response.statusCode == 200){
        ResponsePost responsePost = ResponsePost(success: true, message: "Delete Success", id: id);
        return responsePost;
      } else {
        return ResponsePost(success: false, message: response.statusCode.toString(), id: null);
      }

    } catch (e){
      return ResponsePost(success: false, message:'error caught: $e',id: null );
    }
  }

}