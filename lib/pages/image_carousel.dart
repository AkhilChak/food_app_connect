import 'package:flutter/material.dart';

import '../utils.dart';

class ImageCarousel extends StatefulWidget {
  const ImageCarousel({
    Key? key,
  }) : super(key: key);

  @override
  State<ImageCarousel> createState() => _ImageCarouselState();
}

class _ImageCarouselState extends State<ImageCarousel> {
  int _currentPage=0;
  List<String> demoBigImages = ["assets/images/food (3).jpg","assets/images/food (4).jpg"];
  @override
  Widget build(BuildContext context) {
    return AspectRatio(
      aspectRatio: 1.81,
      child: Stack(
        alignment: Alignment.bottomRight,
        children: [
          PageView.builder(
            itemCount: demoBigImages.length,
            onPageChanged: (value){
              setState(() {
                _currentPage=value;
              });
            },
            itemBuilder: (context,index)=>ClipRRect(
              borderRadius: BorderRadius.all(Radius.circular(12)),
              child: Image.asset(
                demoBigImages[index],
              ),
            ),
          ),
          Positioned(
            bottom: ColorManager.defaultPadding,
            right: ColorManager.defaultPadding,
            child: Row(
              children: List.generate(
                demoBigImages.length,
                (index) => Padding(
                  padding: EdgeInsets.only(left: ColorManager.defaultPadding/4),
                  child: IndicatorDot(isActive: index == _currentPage),
                  )
              ),
            ),
          )
        ],
      ),
    );
  }
}

class IndicatorDot extends StatelessWidget {
  const IndicatorDot({ Key? key, required this.isActive }) : super(key: key);
  final bool isActive;

  @override
  Widget build(BuildContext context) {
    return Container(
      height: 4,
      width: 8,
      decoration: BoxDecoration(
        color: isActive ? Colors.white: Colors.white38,
        borderRadius: BorderRadius.all(Radius.circular(12)),
      ),
    );
  }
}