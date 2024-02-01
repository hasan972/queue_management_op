import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:queue_management_op/theme/color/my_colors.dart';

class DefaultTextFormField extends StatelessWidget {
  final String text;
  final String imageUrl;
  final bool isvisibleicon;
  TextEditingController controller;
  TextInputType inputType;
  final String emptyMessage;
  final bool obscure;
  VoidCallback obsState;

  DefaultTextFormField(
      {super.key,
      required this.text,
      required this.imageUrl,
      required this.isvisibleicon,
      required this.controller,
      required this.emptyMessage,
      required this.inputType,
      required this.obscure,
      required this.obsState});

  @override
  Widget build(BuildContext context) {
    return TextFormField(
      controller: controller,
      scrollPadding: const EdgeInsets.all(40),
      obscureText: obscure,
      textInputAction: TextInputAction.next,
      decoration: InputDecoration(
        hintText: text,
        hintStyle: TextStyle(
            color: MyColors().white,
            fontSize: 14,
            fontWeight: FontWeight.w400),
        filled: true,
        fillColor: MyColors().mainShade,
        border: outlineInputBorder,
        enabledBorder: outlineInputBorder,
        focusedBorder: outlineInputBorder,
        suffixIcon: isvisibleicon
            ? obscure
                ? InkWell(
                    onTap: obsState,
                    child: SizedBox(
                      height: 18,
                      width: 18,
                      child: Padding(
                        padding: const EdgeInsets.all(15),
                        child: SvgPicture.asset(
                          'assets/images/eye-crossed.svg',
                          fit: BoxFit.cover,
                          color: MyColors().white,
                        ),
                      ),
                    ),
                  )
                : IconButton(
                    onPressed: obsState,
                    icon: Icon(Icons.remove_red_eye_outlined,
                        size: 22, color: MyColors().white
                        ))
            : null,
        prefixIcon: SizedBox(
          height: 18,
          width: 18,
          child: Padding(
            padding: const EdgeInsets.all(16),
            child: SvgPicture.asset(
              imageUrl,
              fit: BoxFit.cover,
              color: MyColors().black,
            ),
          ),
        ),
      ),
      keyboardType: inputType,
      validator: (value) {
        if (value!.isEmpty) {
          return emptyMessage;
        }
        return null;
      },
    );
  }
}

const OutlineInputBorder outlineInputBorder = OutlineInputBorder(
  borderRadius: BorderRadius.all(Radius.circular(20)),
  borderSide: BorderSide.none,
);
