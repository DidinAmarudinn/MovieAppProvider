import 'package:flutter/material.dart';
import 'package:movie_app/configs/app_constants.dart';

class CustomTextFieldWidget extends StatelessWidget {

  final String? hintText;
  final String? icon;
  final Function(String)? onchanged;
  final bool? isObsured;
  final bool? isHaveMargin;
  final TextInputType? textInputType;
  final TextEditingController? controller;
  const CustomTextFieldWidget(
      {Key? key,
      this.hintText,
      this.icon,
      this.controller,
      this.isObsured = false,
      this.isHaveMargin = false,
      this.onchanged,
      this.textInputType = TextInputType.text})
      : super(key: key);

  @override
  Widget build(BuildContext context) {
    return SizedBox(
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Container(
            margin: isHaveMargin!
                ? EdgeInsets.symmetric(horizontal: defaultMargin)
                : EdgeInsets.zero,
            height: 50,
            padding: EdgeInsets.symmetric(horizontal: defaultMargin / 2),
            decoration: BoxDecoration(
              color: Colors.grey.shade400,),
            child: Center(
              child: Row(
                children: [
                   Icon(
                    Icons.search_outlined,
                    size: 25,
                    color: Colors.black.withOpacity(0.5),
                  ),
                  SizedBox(
                    width: defaultMargin / 2,
                  ),
                  Expanded(
                    child: TextFormField(
                      autofocus: true,
                      style: primaryTextStyle,
                      controller: controller!,
                      keyboardType: textInputType,
                      obscureText: isObsured!,
                      decoration: InputDecoration.collapsed(
                        hintText: hintText!,
                        hintStyle: secondaryTextStyle,
                      ),
                      onChanged: onchanged != null
                          ? (text) {
                              onchanged!(text);
                            }
                          : null,
                    ),
                  ),
                ],
              ),
            ),
          )
        ],
      ),
    );
  }
}
