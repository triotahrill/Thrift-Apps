import 'package:flutter/material.dart';
import 'package:carousel_slider/carousel_slider.dart';
import 'package:Thrift/Component/Color.dart';
import 'package:animate_do/animate_do.dart';

class ProductSlider extends StatefulWidget {
  final List<String> items;

  const ProductSlider({required this.items});

  @override
  _ProductSliderState createState() => _ProductSliderState();
}

class _ProductSliderState extends State<ProductSlider> {
  int activeIndex = 0;
  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.only(bottom: 30),
      child: Column(
        children: <Widget>[
          Container(
            height: 200,
            width: MediaQuery.of(context).size.width,
            child: CarouselSlider(
              options: CarouselOptions(
                  autoPlayCurve: Curves.fastLinearToSlowEaseIn,
                  autoPlayAnimationDuration: Duration(seconds: 2),
                  autoPlay: true,
                  scrollDirection: Axis.vertical,
                  viewportFraction: 1.0,
                  onPageChanged: (int, index) {
                    dynamic setActiveDot;
                    (index);
                  }),
              items: widget.items.map((item) {
                return Builder(
                  builder: (BuildContext context) {
                    return Stack(
                      children: <Widget>[
                        Container(
                          width: MediaQuery.of(context).size.width,
                          child: Image(
                            image: AssetImage("asset/image/" + item),
                            fit: BoxFit.cover,
                          ),
                        ),
                      ],
                    );
                  },
                );
              }).toList(),
            ),
          ),
        ],
      ),
    );
  }
}
