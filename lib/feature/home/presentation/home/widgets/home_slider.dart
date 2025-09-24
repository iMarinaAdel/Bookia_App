import 'package:bookia/core/utils/app_color.dart';
import 'package:bookia/feature/home/data/models/response/slider_response/slider.dart';
import 'package:carousel_slider/carousel_slider.dart';
import 'package:flutter/material.dart';
import 'package:flutter_gap/flutter_gap.dart';
import 'package:smooth_page_indicator/smooth_page_indicator.dart';

class HomeSlider extends StatefulWidget {
  const HomeSlider({super.key, required this.sliders});
  final List<SliderModel> sliders;
  @override
  State<HomeSlider> createState() => HomeSliderState();
}

class HomeSliderState extends State<HomeSlider> {
  int currentIndex = 0;
  @override
  Widget build(BuildContext context) {
    return Column(children: [buildSlider(), Gap(14), buildIndicator()]);
  }

  CarouselSlider buildSlider() {
    return CarouselSlider.builder(
      itemCount: widget.sliders.length,
      itemBuilder: (BuildContext context, int itemIndex, int pageViewIndex) =>
          ClipRRect(
            borderRadius: BorderRadius.circular(10),
            child: Image.network(
              widget.sliders[itemIndex].image ?? "",
              fit: BoxFit.cover,
              width: double.infinity,
            ),
          ),
      options: CarouselOptions(
        height: 150,
        viewportFraction: 1,
        initialPage: 0,
        // autoPlay: true,
        enlargeCenterPage: true,
        onPageChanged: (int index, CarouselPageChangedReason reason) {
          setState(() {
            currentIndex = index;
          });
        },
      ),
    );
  }

  SmoothPageIndicator buildIndicator() {
    return SmoothPageIndicator(
      controller: PageController(initialPage: currentIndex),
      count: 3,
      effect: ExpandingDotsEffect(
        dotColor: AppColor.borderColor,
        dotHeight: 7,
        dotWidth: 7,
        activeDotColor: AppColor.primaryColor,
        expansionFactor: 5,
      ),
      onDotClicked: (index) {},
    );
  }
}
