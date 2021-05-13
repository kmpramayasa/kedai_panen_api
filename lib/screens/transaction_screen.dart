import 'package:flutter/material.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
// import 'package:layout/helpers/database_helper.dart';
import 'package:layout/models/orders_model.dart';
import 'package:intl/intl.dart';
import 'package:layout/models/response_post.dart';
import 'package:layout/screens/transaction_detail_screen.dart';
import 'package:layout/services/api.dart';
import 'package:toast/toast.dart';
// import 'package:sqflite/sqflite.dart';

class TransactionScreen extends StatefulWidget {
  @override
  _TransactionScreenState createState() => _TransactionScreenState();
}

class _TransactionScreenState extends State<TransactionScreen> {

  Future<List<Order>> _orderList;
  final DateFormat dateFormatter = DateFormat("dd MM yyyy");

  @override
  void initState() {
    super.initState();
    _updateOrderList();
  }

  _updateOrderList(){
    setState(() {
      _orderList = ApiService.getListOrder();
    });
  }

  _deleteOrderList(int id, BuildContext context) async{

    ResponsePost response;
    response = await ApiService.deleteOrder(id);
    Navigator.pop(context);
    _updateOrderList();

    Toast.show(response.message, context);

    // bool _success = false;
    // _success = response.success;

    //   if(_success){
        
    //   } else {
    //     Toast.show('Gagal Hapus Data Order', context);
    //     _updateOrderList();
    //   }    
  }

  Widget _buildOrders(Order order, context){
    return Card(             
      margin: EdgeInsets.only(bottom: 24.0),
      color: Color(0xFF389048),
      child: Container(
        padding: EdgeInsets.all(16.0),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: <Widget>[
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: <Widget>[
                Row(
                  children: <Widget>[
                    Container(
                      margin: EdgeInsets.only(right: 12.0),
                      child: Image(
                        image: AssetImage("../../assets/products/" + order.image),
                        width: 60.0,
                        height: 60.0,
                        fit: BoxFit.cover,
                      ),
                    ),
                    Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: <Widget>[
                        Text(
                          order.productsName??'Nama Barang',
                          style: TextStyle(
                            color: Colors.white,
                            fontSize: 18,
                            fontFamily: 'Roboto',
                            fontWeight: FontWeight.bold
                          ),  
                        ),
                        SizedBox(height: 6.0),
                        Text(
                          order.weight.toString() + order.unit??'Berat Brang',
                          style: TextStyle(
                            fontFamily: 'Roboto',
                            fontWeight: FontWeight.w300,
                            fontSize: 14.0,
                            color: Color(0xFFAFD9BA),
                          ),
                        ),
                        SizedBox(height: 6.0),
                        Text(
                          order.qty.toString() + " Barang" ?? "0 Barang",
                          style: TextStyle(
                            fontFamily: 'Roboto',
                            fontWeight: FontWeight.w300,
                            fontSize: 14.0,
                            color: Color(0xFFDEDEDE),
                          ),
                        ),
                      ],
                    )

                  ],
                ),
                Row(                                            
                  children: <Widget>[
                    Icon(FontAwesomeIcons.calendarAlt, color: Color(0xFFAFD9BA), size: 12.0,),
                    SizedBox(width: 8.0),
                    Text(
                      order.date, 
                      style: TextStyle(
                        fontSize: 12.0,
                        color: Color(0xFFAFD9BA)
                      ),
                    )
                  ],
                )
              ],
            ),
            SizedBox(height: 10.0,),
            Divider(color: Color(0xFFB2C2B9)),
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: <Widget>[
                Column(
                  children: <Widget>[
                    Text(
                      "Total Belanja:",
                      style: TextStyle(
                        color: Color(0xFFAFD9BA),
                        fontSize: 12.0,
                        fontWeight: FontWeight.w300,
                        fontFamily: 'Roboto',
                      ),
                    ),
                    Text(
                      "Rp. " + order.total.toString() ?? "Rp. 0",
                      style: TextStyle(
                        color: Colors.white,
                        fontSize: 14,
                        fontFamily: 'Roboto',
                        fontWeight: FontWeight.bold
                      ),
                    )
                  ],
                ),
                Container(
                  height: 20.0,
                  // width: double.infinity,
                  decoration: BoxDecoration(
                    color: Colors.red[600],
                    borderRadius: BorderRadius.circular(6.0),
                  ),
                  child: FlatButton(
                    child: Text(
                      "Batalkan Pesanan",
                      style: TextStyle(
                        color: Colors.white,
                        fontSize: 13.0
                      ),
                    ),
                    onPressed: () => _deleteOrderList(order.id, context),
                  ),
                ),
              ],
            )
          ],
        ),
      ),
    );
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text(
          "Daftar Pesanan",
            style: TextStyle(color: Colors.white, fontSize: 18.0, fontWeight: FontWeight.w300),
        ),
        shape: RoundedRectangleBorder(borderRadius: BorderRadius.only(bottomRight: Radius.circular(16.0), bottomLeft: Radius.circular(16.0))),
        backgroundColor: Color(0xFF389048),
        elevation: 0,
      ),
      body: Container(

        margin: EdgeInsets.only(top: 24.0),
        padding: EdgeInsets.symmetric(horizontal: 36.0),
        child: FutureBuilder <List<Order>>(
          future: ApiService.getListOrder(),
          builder: (context, snapshot){

            // Kondisi ketika tidak terdapat data order
            if(snapshot.connectionState == ConnectionState.waiting){
              return Center(child: CircularProgressIndicator(),);
            } else {

              List<Order> listOrder = snapshot.data;

              return ListView.builder(              
              // shrinkWrap: true,
              scrollDirection: Axis.vertical,
              itemCount: listOrder.length,
              itemBuilder: (BuildContext context, int index){    

                return GestureDetector(
                  onTap: () => Navigator.push(
                    context, 
                    MaterialPageRoute(
                      builder: (BuildContext context) => TransactionDetailScreen(orders: listOrder[index])
                    )
                  ),
                  child: _buildOrders(listOrder[index], context),
                  );
                }
              );
            }            
          }        
        )            
      ),  
    );
  }
}