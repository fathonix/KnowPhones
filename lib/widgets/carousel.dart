import 'package:carousel_slider/carousel_slider.dart';
import 'package:flutter/material.dart';

class CarouselWidget extends StatefulWidget {
  const CarouselWidget({
    Key? key,
    required this.images,
  }) : super(key: key);

  final List<String> images;

  @override
  State<CarouselWidget> createState() => _CarouselWidgetState();
}

class _CarouselWidgetState extends State<CarouselWidget> {
  late List<Widget> imageSlider;

  @override
  void initState() {
    imageSlider = widget.images.map((image) => Image.network(image)).toList();
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return CarouselSlider(
      items: imageSlider,
      options: CarouselOptions(
        autoPlay: widget.images.length > 1 ? true : false,
        viewportFraction: 1.0,
      ),
    );
  }
}
