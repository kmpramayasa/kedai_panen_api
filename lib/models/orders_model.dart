// To parse this JSON data, do
//
//     final responeOrders = responeOrdersFromJson(jsonString);

import 'dart:convert';

ResponseOrders responeOrdersFromJson(String str) => ResponseOrders.fromJson(json.decode(str));

String responeOrdersToJson(ResponseOrders data) => json.encode(data.toJson());

class ResponseOrders {
    ResponseOrders({
        this.orders,
    });

    final List<Order> orders;

    factory ResponseOrders.fromJson(Map<String, dynamic> json) => ResponseOrders(
        orders: List<Order>.from(json["orders"].map((x) => Order.fromJson(x))),
    );

    Map<String, dynamic> toJson() => {
        "orders": List<dynamic>.from(orders.map((x) => x.toJson())),
    };
}

class Order {
    Order({
        this.id,
        this.productsName,
        this.weight,
        this.unit,
        this.image,
        this.category,
        this.price,
        this.qty,
        this.total,
        this.address,
        this.note,
        this.date,
    });

    final int id;
    final String productsName;
    final int weight;
    final String unit;
    final String image;
    final String category;
    final int price;
    final int qty;
    final int total;
    final String address;
    final String note;
    final String date;

    factory Order.fromJson(Map<String, dynamic> json) => Order(
        id: json["id"],
        productsName: json["products_name"],
        weight: json["weight"],
        unit: json["unit"],
        image: json["image"],
        category: json["category"],
        price: json["price"],
        qty: json["qty"],
        total: json["total"],
        address: json["address"],
        note: json["note"],
        date: json["date"],
    );

    Map<String, dynamic> toJson() => {
        "id": id,
        "products_name": productsName,
        "weight": weight,
        "unit": unit,
        "image": image,
        "category": category,
        "price": price,
        "qty": qty,
        "total": total,
        "address": address,
        "note": note,
        "date": date,
    };
}
