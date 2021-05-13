import 'package:flutter/material.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import '../models/products_model.dart';
import '../screens/product_detail_screen.dart';


class ProductScreen extends StatefulWidget {
  @override
  _ProductScreenState createState() => _ProductScreenState();
}

class _ProductScreenState extends State<ProductScreen> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(

      appBar: AppBar(
        title: Center(
          child: Text(
            "Produk Kedai Panen",
              style: TextStyle(color: Colors.white, fontSize: 18.0, fontWeight: FontWeight.w300),
          ),
        ),
        shape: RoundedRectangleBorder(borderRadius: BorderRadius.only(bottomRight: Radius.circular(16.0), bottomLeft: Radius.circular(16.0))),
        backgroundColor: Color(0xFF389048),
        elevation: 0,
      ),

      body: Container(
        padding: EdgeInsets.fromLTRB(36, 24, 36, 24),
        color: Colors.white,

        child: GridView.builder(
          itemCount: Product.length,
          gridDelegate: new SliverGridDelegateWithFixedCrossAxisCount(
            crossAxisCount: 2,
            crossAxisSpacing: 18,
            mainAxisSpacing: 18,
            childAspectRatio: 0.8,
          ),          
          primary: false,
          
          itemBuilder: (BuildContext context, int index){
            Products productList = Product[index];
            return GestureDetector(
              onTap: (){
                Navigator.push(
                  context, 
                  MaterialPageRoute(
                    builder: (BuildContext context) => ProductDetailScreen(productList: productList,),
                  )
                );
              },
              child: ProductWidget(
                productList: productList
              ),
            );
          },          
        ),                              
      )
    );    
  }
}

class ProductWidget extends StatelessWidget {

  ProductWidget({
    Key key, this.productList
  }): super(key: key);

  final Products productList;
  final star = <Widget>[];

  @override
  Widget build(BuildContext context) {
    
    for(var i = 0; i < productList.rating; i++){
      star.add(
        new Icon(Icons.star, size: 10, color: Colors.yellow)
      );
    }
    
    return Container(                   
      child: Stack(        
        children: <Widget>[         

          Container(            
            width: 200.0,                                                     
            decoration: BoxDecoration(              
              borderRadius: BorderRadius.circular(12),
              color: Colors.white,
              boxShadow: [
                BoxShadow(
                  color: Colors.grey.withOpacity(0.3),
                  spreadRadius: 3,
                  blurRadius: 7,
                  offset: Offset(0,3),
                )
              ],              
            ),
            child: Column(                                          
              children: <Widget>[
                Image(
                  height: 100.0,
                  width: 200.0,
                  image: AssetImage("assets/products/" +productList.image), 
                  fit: BoxFit.cover,
                ),

                Padding(
                  padding: EdgeInsets.symmetric(horizontal: 20, vertical: 12),
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: <Widget>[
                      Container(
                        margin: EdgeInsets.only(bottom: 6.0),
                        child: Row(
                          children: star,
                        ),
                      ) , 
                      Row(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        mainAxisAlignment: MainAxisAlignment.spaceBetween,
                        children: <Widget>[
                          Text(
                            '${productList.name}',
                            style: TextStyle(
                              fontSize: 16.0,
                              fontWeight: FontWeight.bold,
                              color: Color(0xFF389048),
                              fontFamily: 'Roboto',
                            ),
                          ),                          
                        ],
                      ),
                      

                      Text(
                        productList.weight.toString() + " " + productList.unit,
                        style: TextStyle(
                          color: Color(0xFFB2C2B9),
                        ),
                      ),
                      
                      Text(
                        "Rp. " + productList.price.toString(),
                        style: TextStyle(
                          color: Color(0xFFA2D463),
                          fontWeight: FontWeight.bold,
                          fontSize: 15,
                          fontFamily: 'Roboto'
                        ),
                      ),                                            
                    ],
                  ),  
                ),
                                                                    
              ],
            ),
          ),          
        ],
      ),
    );
  }
}