import 'package:bookia/core/utils/app_color.dart';
import 'package:bookia/core/utils/text_style.dart';
import 'package:bookia/feature/home/data/models/response/book_list_respose/product.dart';
import 'package:bookia/feature/home/presentation/widgets/book_card_widget.dart';
import 'package:flutter/material.dart';
import 'package:flutter_gap/flutter_gap.dart';

class BestSellersList extends StatelessWidget {
  const BestSellersList({super.key, required this.products});
final List<Product> products;
  @override
  Widget build(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Text(
          'Best Sellers',
          style: TextStyles.getText24(color: AppColor.darkColor),
        ),
        Gap(10),
        SizedBox(
          height: 280,
          child: ListView.separated(
            scrollDirection: Axis.horizontal,
            itemCount: 5,
            itemBuilder: (context, index) {
              return BookCardWidget(product: products[index],);
            },
            separatorBuilder: (BuildContext context, int index) {
              return Gap(10);
            },
          ),
        ),
      ],
    );
  }
}
