import 'package:flutter/material.dart';
import 'package:Thrift/Pages/Detail_Screen.dart';
import 'package:Thrift/Component/Color.dart';
import 'package:Thrift/Component/Category.dart';
import 'package:animate_do/animate_do.dart';

class HomePage extends StatefulWidget {


  @override
  State<HomePage> createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Row(
          mainAxisAlignment: MainAxisAlignment.center,
          children: <Widget>[
            Text(
              "Thrift",
              style:
                  TextStyle(color: black, fontWeight: FontWeight.w600),
            ),
            Text(
              " E-commerce",
              style:
                  TextStyle(color: teal, fontWeight: FontWeight.w600),
            )
          ],
        ),
        backgroundColor: Colors.transparent,
        elevation: 0.0,
      ),
      backgroundColor: white,
      body: getBody(),
    );
  }

  Widget getBody() {
    return ListView(
      children: <Widget>[
        Column(
            children: List.generate(products.length, (index) {
          return FadeInDown(
            duration: Duration(milliseconds: 350 * index),
            child: Padding(
              padding: const EdgeInsets.all(6.0),
              child: InkWell(
                onTap: () {
                  Navigator.push(
                      context,
                      MaterialPageRoute(
                          builder: (_) => DetailScreen(
                                id: products[index]['id'].toString(),
                                name: products[index]['name'],
                                img: products[index]['img'],
                                price: products[index]['price'],
                                deskripsi: products[index]['deskripsi'],
                                mulImg: products[index]['mul_img'],
                                sizes: products[index]['sizes'],
                              )));
                },
                child: Container(
                    child: Stack(
                  children: <Widget>[
                    Container(
                      width: 280,
                      height: 200,
                      decoration: BoxDecoration(
                          color:
                            teal.withOpacity(1),
                          borderRadius: BorderRadius.circular(30),
                          boxShadow: [
                            BoxShadow(
                                spreadRadius: 2,
                                color: black.withOpacity(0.3),
                                blurRadius: 4)
                          ]),
                      child: Column(
                        children: <Widget>[
                          Center(
                            child: Container(
                              width: 230,
                              height: 129,
                              decoration: BoxDecoration(
                                  borderRadius: BorderRadius.circular(30),
                                  image: DecorationImage(
                                      image: AssetImage("asset/image/" +
                                          products[index]['img']),
                                      fit: BoxFit.cover)),
                            ),
                          ),
                          SizedBox(
                            height: 10,
                          ),
                          Text(
                            products[index]['name'],
                            style: TextStyle(
                                fontSize: 17, fontWeight: FontWeight.w600),
                          ),
                          Text(
                            "\Rp " + products[index]['price'],
                            style: TextStyle(
                                fontSize: 17, fontWeight: FontWeight.w200),
                          ),
                        ],
                      ),
                    ),
                  ],
                )),
              ),
            ),
          );
        }))
      ],
    );
  }
}
