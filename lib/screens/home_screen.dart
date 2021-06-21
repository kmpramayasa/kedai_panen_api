import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
// import 'package:flutter/services.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import 'package:layout/constants.dart';
import '../models/products_model.dart';

import './product_detail_screen.dart';

class HomeScreen extends StatefulWidget {
  @override
  _HomeScreenState createState() => _HomeScreenState();
}

class _HomeScreenState extends State<HomeScreen> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(

      backgroundColor: Colors.white,

      body: new ListView(

        children: <Widget>[

          Container(
            decoration: BoxDecoration(
              color: Color(0xFF389048),
              borderRadius: BorderRadius.only(bottomRight: Radius.circular(24), bottomLeft: Radius.circular(24))
            ),
            padding: EdgeInsets.only(top: 28, right: 48, left: 48, bottom: 12),                          

            child: Column(   
              crossAxisAlignment: CrossAxisAlignment.start,              
              children: <Widget>[    


                Column(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: <Widget>[
                    Text(
                      "Kedai Panen",
                      style: TextStyle(
                        fontFamily: 'Roboto',
                        fontSize: 22.0,
                        fontWeight: FontWeight.bold,
                        color: Color(0xFFAFD9BA),
                        fontStyle: FontStyle.italic,
                      ),
                    )
                  ],
                ),

                //Header
                Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: <Widget>[
                      Text("Hallo, \nSelamat Datang",
                        style: TextStyle(
                          color: Colors.white,
                          fontSize: 16.0,
                          fontWeight: FontWeight.bold,
                          letterSpacing: 1.2,
                          fontFamily: 'Roboto',
                        ),
                      ),  
                      
                      //Profile photo
                      CircleAvatar(
                        backgroundImage: AssetImage(ProfileImage),
                        maxRadius: 25.0,
                      )                      
                    ],
                ),          
                
                SizedBox(height: 40,),
                
                //Category
                Row(
                  mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                  children: <Widget>[
                    
                    Column(
                      mainAxisSize: MainAxisSize.min,
                      mainAxisAlignment: MainAxisAlignment.center,
                      children: <Widget>[
                        Container(
                          decoration: BoxDecoration(
                            color: Colors.white,  
                            borderRadius: BorderRadius.circular(6)                        
                          ),
                          padding: EdgeInsets.all(12),  
                          margin: EdgeInsets.only(bottom: 12.0), 
                          child: Icon(
                            FontAwesomeIcons.leaf,
                            color: Color(0xFF389048),
                          ),                   
                        ),  
                        Text('Sayur', style: TextStyle(color: Colors.white))                    
                      ],
                    ),

                    Column(
                      mainAxisSize: MainAxisSize.min,
                      mainAxisAlignment: MainAxisAlignment.center,
                      children: <Widget>[
                        Container(
                          decoration: BoxDecoration(
                            color: Colors.white,  
                            borderRadius: BorderRadius.circular(6)                        
                          ),
                          padding: EdgeInsets.all(12),  
                          margin: EdgeInsets.only(bottom: 12.0),  
                          child: Icon(
                            FontAwesomeIcons.appleAlt,
                            color: Color(0xFF389048),
                          ),                   
                        ),
                        Text('Buah', style: TextStyle(color: Colors.white))                      
                      ],
                    ),

                    Column(
                      mainAxisSize: MainAxisSize.min,
                      mainAxisAlignment: MainAxisAlignment.center,
                      children: <Widget>[
                        Container(
                          decoration: BoxDecoration(
                            color: Colors.white,  
                            borderRadius: BorderRadius.circular(6)                        
                          ),
                          padding: EdgeInsets.all(12),   
                          margin: EdgeInsets.only(bottom: 12.0), 
                          child: Icon(
                            FontAwesomeIcons.seedling,
                            color: Color(0xFF389048),
                          ),                   
                        ),
                        Text('Bibit', style: TextStyle(color: Colors.white))                      
                      ],
                    ),

                    Column(
                      mainAxisSize: MainAxisSize.min,
                      mainAxisAlignment: MainAxisAlignment.center,
                      children: <Widget>[
                        Container(
                          decoration: BoxDecoration(
                            color: Colors.white,  
                            borderRadius: BorderRadius.circular(6)                        
                          ),
                          padding: EdgeInsets.all(12),   
                          margin: EdgeInsets.only(bottom: 12.0), 
                          child: Icon(
                            FontAwesomeIcons.th,
                            color: Color(0xFF389048),
                          ),                   
                        ),  
                        Text('Lainnya', style: TextStyle(color: Colors.white))                    
                      ],
                    ),

                  ],
                ),

                SizedBox(height: 40),                                                
              ],
            ),                   
          ),

          Container(
            padding: EdgeInsets.fromLTRB(36.0, 24.0, 36.0, 24.0),              
            child: Column(
              children: <Widget>[
                
                Row(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: <Widget>[
                    Text('Produk Terlaris',
                      style: TextStyle(
                        fontSize: 16,
                        fontFamily: 'Roboto',
                        fontWeight: FontWeight.bold,
                      ),
                    ),
                    Text('Lihat Selengkapnya',
                      style: TextStyle(
                        fontWeight: FontWeight.w300,
                        fontFamily: 'Roboto',
                        color: Color(0xFF389048),
                      ),
                    ),
                  ],
                ),

                SizedBox(height: 10),

                ProductCarousel(),
                
              ],
            ),
          ),
        ],

      ),
    );
  }
}

class ProductCarousel extends StatelessWidget {
  
  @override
  Widget build(BuildContext context) {
    
    return Container(
      height: 300.0,
      child: ListView.builder(
        scrollDirection: Axis.horizontal,
        itemCount: Product.length,
        itemBuilder: (BuildContext context, int index){
          Products productList = Product[index];

          return GestureDetector(
            onTap: () => Navigator.push(
              context, 
              MaterialPageRoute(
                builder: (BuildContext context) => ProductDetailScreen(productList:productList)
              )
            ),
            child: Container(
              margin: EdgeInsets.all(10),
              width: 200.0,
              child: Stack(
                alignment: Alignment.topCenter,
                children: <Widget>[

                  Positioned(
                    bottom: 10.0,
                    child: Container(
                      height: 120.0,
                      width: 200.0,
                      padding: EdgeInsets.all(16.0),
                      decoration: BoxDecoration(
                        color: Colors.white,
                        borderRadius: BorderRadius.circular(18.0),
                        boxShadow: [
                          BoxShadow(
                            color: Colors.grey.withOpacity(0.3),
                            spreadRadius: 3,
                            blurRadius: 7,
                            offset: Offset(0,3),
                          )
                        ]
                      ),
                      child: Column(
                        mainAxisAlignment: MainAxisAlignment.end,
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: <Widget>[
                          Row( 
                            crossAxisAlignment: CrossAxisAlignment.start,
                            mainAxisAlignment: MainAxisAlignment.spaceBetween,
                            children: <Widget>[
                              Text(
                                '${productList.name}',
                                style: TextStyle(
                                  fontSize: 16.0,
                                  fontWeight: FontWeight.bold,
                                  color: Color(0xFF389048) 
                                ),
                              ),  
                              Container(
                                padding: EdgeInsets.fromLTRB(6, 4, 6, 4),
                                decoration: BoxDecoration(
                                  color: Color(0xFFAFD9BA),
                                  borderRadius: BorderRadius.circular(20)
                                ),
                                child: Text(
                                  productList.weight.toString() + " "+ productList.unit,
                                  style: TextStyle(
                                  fontSize: 10,
                                  fontWeight: FontWeight.w500,
                                  color: Colors.white
                                  ),
                                ),
                              )                        
                              
                            ],
                          ),
                          
                          SizedBox(height: 6),
                          Text(
                            "Rp. " + productList.price.toString(),
                            style: TextStyle(
                              color: Color(0xFFA2D463),
                              fontWeight: FontWeight.bold,
                              fontSize: 15,
                              fontFamily: 'Roboto'
                            ),
                          )
                        ],
                      ),
                    ),
                  ),

                  Container(
                    decoration: BoxDecoration(                      
                      borderRadius: BorderRadius.circular(18.0)
                    ),
                    child: Stack(
                      children: <Widget>[
                        Image(
                          height: 180.0,
                          width: 200.0,
                          image: AssetImage("assets/products/" + productList.image),
                          fit: BoxFit.cover,                          
                        ),
                        Container(                                                   
                          padding: EdgeInsets.fromLTRB(8, 6, 8, 6),
                          color: Color(0xFF389048),
                          child: Text(
                            productList.category,
                            style: TextStyle(
                              fontWeight: FontWeight.bold,                              
                              color: Colors.white
                            ),
                          ),
                        )
                      ],
                    ),
                  )
                ],
              ),
            ),
          );
        }
      ),
    );

  }
}