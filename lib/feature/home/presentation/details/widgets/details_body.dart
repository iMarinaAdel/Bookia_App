import 'package:bookia/core/utils/app_color.dart';
import 'package:bookia/core/utils/text_style.dart';
import 'package:bookia/feature/home/data/models/response/book_list_respose/product.dart';
import 'package:cached_network_image/cached_network_image.dart';
import 'package:flutter/material.dart';
import 'package:flutter_gap/flutter_gap.dart';

class DetailsBody extends StatelessWidget {
  const DetailsBody({
    super.key,
    required this.products,
  });

  final Product products;

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.all(20),
      child: SingleChildScrollView(
        child: Center(
          child: Column(
            children: [
              Hero(
                tag: products.key ?? "",
                child: ClipRRect(
                  borderRadius: BorderRadius.circular(10),
                  child: CachedNetworkImage(
                    imageUrl: products.image ?? "",
                    height: 271,
                  ),
                ),
              ),
              Gap(20),
              Text(
                products.name ?? "",
                style: TextStyles.getText26(color: AppColor.darkColor),
              ),
              Gap(10),
              Text(
                products.category ?? "",
                style: TextStyles.getText20(color: AppColor.primaryColor),
              ),
              Gap(20),
              Text(
                textAlign: TextAlign.justify,
                products.description ?? "",
                style: TextStyles.getText16(color: AppColor.darkColor),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
