import 'package:flutter/material.dart';
import 'package:Thrift/Component/Color.dart';
import 'package:animate_do/animate_do.dart';
import 'package:Thrift/Component/Slider.dart';
import 'package:Thrift/Component/Category.dart';

class DetailScreen extends StatefulWidget {
  final String id;
  final String name;
  final String img;
  final String price;
  final String deskripsi;
  final List<String> mulImg;
  final List<dynamic> sizes;

  DetailScreen(
      {Key? key,
      required String this.id,
      required String this.name,
      required String this.img,
      required String this.price,
      required String this.deskripsi,
      required List<String> this.mulImg,
      required List<dynamic> this.sizes})
      : super(key: key);
  @override
  _ProductDetailPageState createState() => _ProductDetailPageState();
}

class _ProductDetailPageState extends State<DetailScreen> {
  int activeSize = 0;
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: white,
      body: getBody(),
    );
  }

  Widget getBody() {
    return SingleChildScrollView(
      child: Column(
        children: <Widget>[
          Container(
      
            width: MediaQuery.of(context).size.width,
            decoration: BoxDecoration(boxShadow: [
              
              BoxShadow(
                blurRadius: 2,
                color: black.withOpacity(0.8),
                spreadRadius: 1,
              )
            ], borderRadius: BorderRadius.circular(30), color: teal),
            child: Stack(
              children: <Widget>[
                FadeInDown(
                  child: ProductSlider(
                    items: widget.mulImg,
                  ),
                ),
                SafeArea(
                  child: IconButton(
                      icon: Icon(
                        Icons.arrow_back_ios_new_outlined,
                        color: white,
                      ),
                      onPressed: () {
                        Navigator.pop(context);
                      }),
                )
              ],
            ),
          ),
          SizedBox(
            height: 20,
          ),
          FadeInDown(
            delay: Duration(milliseconds: 350),
            child: Padding(
              padding: const EdgeInsets.only(left: 25, right: 25),
              child: Text(
                widget.name,
                style: TextStyle(
                    fontSize: 25, fontWeight: FontWeight.w600, height: 1.5),
                textAlign: TextAlign.center,
              ),
            ),
          ),
          SizedBox(
            height: 10,
          ),
          FadeInDown(
            delay: Duration(milliseconds: 400),
            child: Padding(
              padding: const EdgeInsets.only(left: 25, right: 25),
              child: Text(
                widget.deskripsi,
                style: TextStyle(
                    fontSize: 15, fontWeight: FontWeight.w300, height: 1.5),
                textAlign: TextAlign.center,
              ),
            ),
          ),
          SizedBox(
            height: 10,
          ),
          FadeInDown(
            delay: Duration(milliseconds: 400),
            child: Padding(
              padding: const EdgeInsets.only(left: 25, right: 25),
              child: Text(
                "\Rp " + widget.price,
                style: TextStyle(
                    fontSize: 25, fontWeight: FontWeight.w400, height: 1.5),
                textAlign: TextAlign.center,
              ),
            ),
          ),
          SizedBox(
            height: 25,
          ),
          Padding(
              padding: EdgeInsets.only(left: 25, right: 25),
              child: Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: <Widget>[
                  FadeInDown(
                    delay: Duration(milliseconds: 450),
                    child: Text(
                      "Ukuran",
                      style:
                          TextStyle(fontSize: 15, fontWeight: FontWeight.w600),
                    ),
                  ),
                  FadeInDown(
                    delay: Duration(milliseconds: 450),
                    child: Text(
                      "-",
                      style: TextStyle(
                          fontSize: 15, color: black.withOpacity(0.7)),
                    ),
                  )
                ],
              )),
          SizedBox(
            height: 30,
          ),
          FadeInDown(
            delay: Duration(milliseconds: 500),
            child: Padding(
                padding: EdgeInsets.only(left: 20, right: 25),
                child: SingleChildScrollView(
                  scrollDirection: Axis.horizontal,
                  child: Row(
                    children: List.generate(widget.sizes.length, (index) {
                      return GestureDetector(
                        onTap: () {
                          setState(() {
                            activeSize = index;
                          });
                        },
                        child: Padding(
                          padding: const EdgeInsets.only(
                              right: 15, bottom: 5, left: 5, top: 5),
                          child: Container(
                            width: 50,
                            height: 40,
                            decoration: BoxDecoration(
                                color: activeSize == index ? teal : black,
                                borderRadius: BorderRadius.circular(10),
                                boxShadow: [
                                  BoxShadow(
                                      spreadRadius: 0.5,
                                      blurRadius: 1,
                                      color: black.withOpacity(0.1))
                                ]),
                            child: Center(
                              child: Text(
                                widget.sizes[index],
                                style: TextStyle(
                                    fontSize: 22,
                                    color: activeSize == index ? black : white),
                              ),
                            ),
                          ),
                        ),
                      );
                    }),
                  ),
                )),
          ),
          SizedBox(
            height: 30,
          ),
          FadeInDown(
            delay: Duration(milliseconds: 550),
            child: Padding(
              padding: EdgeInsets.only(left: 25, right: 25),
              child: Row(
                children: <Widget>[
                  SizedBox(
                    width: 15,
                  ),
                  Flexible(
                      child: FlatButton(
                          shape: RoundedRectangleBorder(
                              borderRadius: BorderRadius.circular(30)),
                          color: black,
                          onPressed: () {},
                          child: Container(
                            height: 50,
                            child: Center(
                              child: Text(
                                "ADD TO CART",
                                style: TextStyle(
                                    color: white,
                                    fontSize: 15,
                                    fontWeight: FontWeight.w600),
                              ),
                            ),
                          )))
                ],
              ),
            ),
          ),
          SizedBox(
            height: 70,
          ),
        ],
      ),
    );
  }
}
