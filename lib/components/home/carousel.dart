import 'package:carousel_slider/carousel_slider.dart';
import 'package:flutter/material.dart';
import 'package:temple_on_wheel/constants/theme.dart';

final List<String> imgList = [
  'assets/images/home/siem-reap-cycling-tours.jpg',
  'assets/images/home/siem-reap-cycling-tours-v2.jpg',
  'assets/images/home/siem-reap-cycling-tours-v3.jpg',
];

class Carousel extends StatefulWidget {
  const Carousel({super.key});

  @override
  State<Carousel> createState() => _CarouselState();
}

class _CarouselState extends State<Carousel> {
  int _current = 0;
  final CarouselSliderController _controller = CarouselSliderController();

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        CarouselSlider(
          carouselController: _controller,
          items:
              imgList.map((e) {
                return SizedBox(
                  height: 200,
                  child: ClipRRect(
                    borderRadius: BorderRadius.circular(10.0),
                    child: Image.asset(
                      e,
                      fit: BoxFit.cover,
                      width: double.infinity,
                    ),
                  ),
                );
              }).toList(),
          options: CarouselOptions(
            autoPlay: true,
            autoPlayInterval: Duration(seconds: 5),
            autoPlayAnimationDuration: Duration(seconds: 2),
            enlargeCenterPage: true,
            viewportFraction: .8,
            aspectRatio: 2,
            padEnds: true,
            onPageChanged: (index, reason) {
              setState(() {
                _current = index;
              });
            },
          ),
        ),
        SizedBox(height: 10),
        Container(
          margin: EdgeInsets.only(right: 10),
          child: Row(
            mainAxisAlignment: MainAxisAlignment.end,
            children: [
              for (int i = 0; i < 3; i++)
                GestureDetector(
                  onTap: () => _controller.animateToPage(i),
                  child: Container(
                    margin: EdgeInsets.only(left: 10),
                    width: 20,
                    height: 5,
                    decoration: BoxDecoration(
                      color:
                          _current == i
                              ? kMainThemeColor
                              : const Color(0x629E9E9E),
                      borderRadius: BorderRadius.circular(20),
                    ),
                  ),
                ),
            ],
          ),
        ),
      ],
    );
  }
}
