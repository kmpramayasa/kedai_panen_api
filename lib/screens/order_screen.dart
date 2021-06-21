import 'package:flutter/material.dart';
import 'package:flutter/painting.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import 'package:layout/models/response_post.dart';
import 'package:layout/services/api.dart';
import 'package:toast/toast.dart';
import '../models/products_model.dart';
import '../models/orders_model.dart';
import 'package:intl/intl.dart';

class OrderScreen extends StatefulWidget {
  OrderScreen({Key key, this.productList }) 
  :super(key: key);

  final Products productList;

  @override
  _OrderScreenState createState() => _OrderScreenState();
}

class _OrderScreenState extends State<OrderScreen> {

  Order order;  

  final _formKey = GlobalKey<FormState>();
  int _qty;
  int _total = 0;
  String _address = '';
  String _notes = '';
  DateTime _date = DateTime.now();
  ResponsePost response;
  bool _success;

  final DateFormat dateFormatter = DateFormat("dd MM yyyy");
  
  TextEditingController orderQty = TextEditingController();
  TextEditingController orderAddress = TextEditingController();  
  TextEditingController orderNotes = TextEditingController();         

  _minus() {
    int currentValue = int.tryParse(orderQty.text) ?? 1;

    if(currentValue <= 1) {
      Toast.show("Jumlah Pesanan Minimal 1", context);
    } else {
      int newQty = currentValue - 1;
      orderQty.text = newQty.toString();
      setState(() {});
    }
    
  }

  _plus(){
    int currentValue = int.tryParse(orderQty.text) ?? 1;

      if(orderQty.text = null){        
        orderQty.text = 1.toString();
        setState(() {});
      } 

      int newQty = currentValue + 1;
      orderQty.text = newQty.toString();
      setState(() {});      
      
  }

  // Get Total Order price
  _totalOrder(){    
    if(orderQty.text != null){
      int price = widget.productList.price;
      int qty = int.tryParse(orderQty.text) ?? 0;

      _total = price*qty;
      return _total;
    }                
  }

  //Submit order procedure
  _submit() async {    

    // ResponsePost responsePost = null;    

    if(_formKey.currentState.validate()){
      _formKey.currentState.save();


      String productName = widget.productList.name;
      String weight = widget.productList.weight.toString();
      String unit = widget.productList.unit;
      String image = widget.productList.image;
      String category = widget.productList.category;
      String price = widget.productList.price.toString();
      String qty = _qty.toString();
      String total= _total.toString();
      String address = _address;
      String note = _notes;
      String date = DateFormat('dd MM yyyy').format(_date);
                 
      response = await ApiService.checkoutOrder(productName, weight, unit, image, category, price, qty, total, address, note, date);      

      _success = response.success;

      if(_success) {
        Navigator.pop(context);
        setState(() {});
        Toast.show(response.message, context);
      } else {
        Toast.show(response.message, context);
      }      

      print("Sukses Order");             
    }    
  }

  @override
  Widget build(BuildContext context) {    

    return Scaffold(
     
      body: GestureDetector(
        onTap: () => FocusScope.of(context).unfocus(),
        child: Container(
          // padding: EdgeInsets.symmetric(horizontal: 36.0),
          color: Colors.white,

          child: ListView(
            children: <Widget>[

              //Checkout header
              Container(
                decoration: BoxDecoration(
                  color: Color(0xFF389048),
                  borderRadius: BorderRadius.only(bottomRight: Radius.circular(16), bottomLeft: Radius.circular(16))
                ),
                padding: EdgeInsets.all(28.0), 
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: <Widget>[
                    Row(
                      children: <Widget>[
                        GestureDetector(
                          onTap: () {
                            Navigator.pop(context);
                          },
                          child: Icon(FontAwesomeIcons.arrowLeft, color: Colors.white, size: 16.0,)
                        ),
                        SizedBox(width: 16.0,),
                        Text(
                          "Checkout Barang",
                          style: TextStyle(color: Colors.white, fontSize: 18.0, fontWeight: FontWeight.w300),
                        ),                        
                      ],
                    ),
                    
                    SizedBox(height: 24.0,),

                    //Prouct Info
                    Container(                      
                      child: Column(                    
                        children: <Widget>[                                                    

                          Row(
                            crossAxisAlignment: CrossAxisAlignment.center,  
                            children: <Widget>[
                              ClipRRect(
                                borderRadius: BorderRadius.circular(10.0),
                                child: Image(
                                  image: AssetImage("../../assets/products/" + widget.productList.image),
                                  width: 100,
                                  height: 100,
                                  fit: BoxFit.cover,                        
                                ),
                              ),
                              Padding(
                                padding: EdgeInsets.only(left: 12.0),
                                child: Column(     
                                  crossAxisAlignment: CrossAxisAlignment.start,                  
                                  children: <Widget>[
                                    Text(
                                      "${widget.productList.name}",
                                      style: TextStyle(
                                        color: Colors.white,
                                        fontSize: 18,
                                        fontFamily: 'Roboto',
                                        fontWeight: FontWeight.bold
                                      ),                            
                                    ),
                                    SizedBox(height: 8.0,),
                                    Text(
                                      widget.productList.weight.toString() + " " + widget.productList.unit,
                                      style: TextStyle(
                                        fontFamily: 'Roboto',
                                        fontWeight: FontWeight.w300,
                                        fontSize: 14.0,
                                        color: Color(0xFFAFD9BA),
                                      ),
                                    ),
                                    SizedBox(height: 8.0,),
                                    Text(
                                      "Rp. " + widget.productList.price.toString(),
                                      style: TextStyle(
                                        fontFamily: 'Roboto',
                                        fontWeight: FontWeight.bold,
                                        fontSize: 17.0,
                                        color: Colors.white,
                                      ),
                                    ),                                    
                                  ],
                                ),
                              ),
                            ],
                          ),
                        ],
                      ),
                    )
                  ],
                ),
              ),

              SizedBox(height: 28.0,),

              //Orders Info
              Container(
                padding: EdgeInsets.symmetric(horizontal: 28.0),
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: <Widget>[

                    Text(
                      "Info Pesanan",
                      style: TextStyle(
                        color: Color(0xFF389048),
                        fontSize: 18.0,
                        fontWeight: FontWeight.w300,
                      ),
                    ),
                    SizedBox(height: 14.0,),

                    //Order Forms
                    Form(
                      key: _formKey,
                      child: Column(
                        children: <Widget>[
                          Row(                            
                            children: <Widget>[

                              Container(
                                height: 50.0,
                                width: 50.0,
                                decoration: BoxDecoration(
                                  color: Color(0xFF389048),
                                  borderRadius: BorderRadius.circular(10.0),
                                ),
                                child: FlatButton(
                                  child: Icon(
                                    FontAwesomeIcons.minus,
                                    color: Colors.white,
                                  ), 
                                  onPressed: _minus,
                                ),
                              ), 

                              SizedBox(width: 16.0,), 

                              Expanded(
                                child: TextFormField(                                
                                  style: TextStyle(fontSize: 16.0),
                                  decoration: InputDecoration(
                                    hintText: 'Jumlah Pesanan',
                                    labelStyle: TextStyle(fontSize: 16.0),
                                    border: OutlineInputBorder(borderRadius: BorderRadius.circular(10.0)),
                                  ),
                                  keyboardType: TextInputType.number,                                
                                  validator: (input) => input.trim().isEmpty 
                                  ? 'Mohon masukkan jumlah pesanan' : null,                          
                                  controller: orderQty,
                                  onSaved: (input) => _qty = int.parse(input),
                                  onChanged: (value){},                                  
                                ),
                              ),

                              SizedBox(width: 16.0,),

                              Container(
                                height: 50.0,
                                width: 50.0,
                                decoration: BoxDecoration(
                                  color: Color(0xFF389048),
                                  borderRadius: BorderRadius.circular(10.0),
                                ),
                                child: FlatButton(
                                  child: Icon(
                                    FontAwesomeIcons.plus,
                                    color: Colors.white,
                                  ), 
                                  onPressed: _plus,
                                ),
                              ), 

                            ],
                          ),
                          
                          SizedBox(height: 12.0),
                          TextFormField(
                            style: TextStyle(fontSize: 16.0),
                            decoration: InputDecoration(
                              hintText: 'Alamat Pesanan',
                              labelStyle: TextStyle(fontSize: 16.0),
                              border: OutlineInputBorder(borderRadius: BorderRadius.circular(10.0),),
                            ),
                            keyboardType: TextInputType.multiline,
                            minLines: 1,
                            maxLines: 5,
                            validator: (input) => input.trim().isEmpty 
                            ? 'Mohon masukkan alamat pesanan' : null,                          
                            controller: orderAddress,
                            onSaved: (input) => _address = input,
                          ),
                          SizedBox(height: 12.0),
                          TextFormField(
                            style: TextStyle(fontSize: 16.0),
                            decoration: InputDecoration(
                              hintText: 'Note Pesanan',
                              labelStyle: TextStyle(fontSize: 16.0),
                              border: OutlineInputBorder(borderRadius: BorderRadius.circular(10.0)),
                            ),
                            keyboardType: TextInputType.multiline,
                            maxLines: null,                                                     
                            controller: orderNotes,
                            onSaved: (input) => _notes = input,
                          ),
                          SizedBox(height: 24),

                          // _totalOrder(),
                          //Total Orders
                          Row(                            
                            mainAxisAlignment: MainAxisAlignment.spaceBetween,
                            children: <Widget>[
                              Text(
                                'Total Pesanan',
                                style: TextStyle(
                                  color: Colors.black,
                                  fontSize: 18.0,
                                  fontWeight: FontWeight.bold,
                                ),                                
                              ),
                              Text(
                                "Rp. " + _totalOrder().toString(),
                                style: TextStyle(
                                  color: Color(0xFF389048),
                                  fontSize: 18.0,
                                  fontWeight: FontWeight.bold,
                                ),                         
                              ),
                            ],
                          ),

                          SizedBox(height: 16.0,),

                          Container(
                            height: 50.0,
                            width: double.infinity,
                            decoration: BoxDecoration(
                              color: Color(0xFF389048),
                              borderRadius: BorderRadius.circular(10.0),
                            ),
                            child: FlatButton(
                              child: Text(
                                "Buat Pesanan",
                                style: TextStyle(
                                  color: Colors.white,
                                  fontSize: 16.0
                                ),
                              ),
                              onPressed: _submit,
                            ),
                          ),
                        ],
                      )
                    )
                  ],
                ),
              ),              
            ],
          ),
        ),
      )
    );
  }
}
