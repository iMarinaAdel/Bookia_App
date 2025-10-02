import 'package:bookia/core/components/bottoms/app_main_bottom.dart';
import 'package:bookia/core/components/inputs/app_text_form_field.dart';
import 'package:bookia/core/extentions/app_regex.dart';
import 'package:bookia/core/utils/app_color.dart';
import 'package:bookia/core/utils/text_style.dart';
import 'package:bookia/feature/auth/presentation/widgets/arrow_back.dart';
import 'package:bookia/feature/cart/presentation/cubit/cart_cubit.dart';
import 'package:bookia/feature/cart/presentation/widgets/gov_bottom_sheet.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_gap/flutter_gap.dart';

class PalceOrderScreen extends StatelessWidget {
  const PalceOrderScreen({super.key, required this.totalAmount});
  final String totalAmount;
  @override
  Widget build(BuildContext context) {
    var cubit = context.read<CartCubit>();
    return Scaffold(
      appBar: AppBar(title: ArrowBack(), automaticallyImplyLeading: false),
      body: SingleChildScrollView(
        child: Form(
          autovalidateMode: AutovalidateMode.onUserInteraction,
          key: cubit.formKey,
          child: Padding(
            padding: const EdgeInsets.all(25),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Text(
                  "Place Your Order",
                  style: TextStyles.getText26(color: Colors.black),
                ),
                Gap(10),
                Text(
                  "Don't worry! It occurs. Please enter the email address linked with your account.",
                  style: TextStyles.getText16(color: AppColor.grayColor),
                ),
                Gap(30),
                AppTextFormField(
                  isPassword: false,
                  labelText: "Full Name",
                  controller: cubit.namecontroller,
                  validator: (String? value) {
                    if (value == null || value.isEmpty) {
                      return 'Please enter your name';
                    }
                    return null;
                  },
                ),
                Gap(20),
                AppTextFormField(
                  validator: (String? value) {
                    if (value == null || value.isEmpty) {
                      return 'Please enter your email';
                    }
                    if (!AppRegex.isValidEmail(cubit.emailcontroller.text)) {
                      return 'Please enter a valid email';
                    }
                    return null;
                  },
                  isPassword: false,
                  labelText: "Email",
                  controller: cubit.emailcontroller,
                ),
                Gap(20),
                AppTextFormField(
                  validator: (String? value) {
                    if (value == null || value.isEmpty) {
                      return 'Please enter your phone number';
                    }
                    if (!AppRegex.isValidPhone(cubit.phonecontroller.text)) {
                      return 'Please enter a valid phone number';
                    }
                    return null;
                  },
                  inputFormatters: [
                    LengthLimitingTextInputFormatter(11),
                    FilteringTextInputFormatter.digitsOnly,
                  ],
                  isPassword: false,
                  labelText: "Phone",
                  controller: cubit.phonecontroller,
                ),
                Gap(20),
                AppTextFormField(
                  validator: (String? value) {
                    if (value == null || value.isEmpty) {
                      return 'Please enter your address';
                    }
                    return null;
                  },
                  isPassword: false,
                  labelText: "Address",
                  controller: cubit.addresscontroller,
                ),
                Gap(20),
                AppTextFormField(
                  validator: (String? value) {
                    if (value == null || value.isEmpty) {
                      return 'Please enter your address';
                    }
                    return null;
                  },
                  onTap: () {
                    showGovList(context, cubit);
                  },
                  controller: cubit.governoratecontroller,
                  readOnly: true,
                  isPassword: false,
                  labelText: "Governorate",
                  suffixIcon: Icon(Icons.keyboard_arrow_down),
                ),
                const Gap(80),
                Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    Text(
                      "Total:",
                      style: TextStyles.getText20(color: AppColor.darkColor),
                    ),
                    Text(
                      "\$$totalAmount",
                      style: TextStyles.getText20(
                        color: AppColor.primaryColor,
                        fontWeight: FontWeight.bold,
                      ),
                    ),
                  ],
                ),
                Gap(10),
                Center(
                  child: AppMainBottom(
                    onPressed: () {
                      if (cubit.formKey.currentState!.validate()) {
                        //  cubit.placeOrder(totalAmount, context);
                      }
                    },
                    text: "submit Order",
                  ),
                ),
              ],
            ),
          ),
        ),
      ),
    );
  }
}
