import 'package:addie_store/Constants/app_assets.dart';
import 'package:addie_store/Constants/color_constants.dart';
import 'package:flutter/material.dart';
import 'package:flutter/src/widgets/framework.dart';
import 'package:flutter/src/widgets/placeholder.dart';
import 'package:flutter_svg/svg.dart';

class CustomTextField extends StatefulWidget {
  final TextEditingController textCtrl;
  final String hintText;
  final String leadingIcon;
  final String title;
  final bool isPassword;
  const CustomTextField({
    super.key,
    required this.textCtrl,
    required this.hintText,
    required this.leadingIcon,
    required this.title,
    required this.isPassword,
  });

  @override
  State<CustomTextField> createState() => _CustomTextFieldState();
}

class _CustomTextFieldState extends State<CustomTextField> {
  var isObscure = false;

  @override
  void initState() {
    // TODO: implement initState
    super.initState();
    isObscure = widget.isPassword ? true : false;
  }

  @override
  Widget build(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Padding(
          padding: const EdgeInsets.symmetric(horizontal: 12, vertical: 5),
          child: Text(
            widget.title,
            style: const TextStyle(fontSize: 14, fontWeight: FontWeight.w600),
          ),
        ),
        Container(
          padding: const EdgeInsets.symmetric(horizontal: 10),
          decoration: BoxDecoration(
              color: Colors.grey.withOpacity(0.1),
              borderRadius: BorderRadius.circular(30)),
          child: TextFormField(
            obscureText: isObscure,
            controller: widget.textCtrl,
            decoration: InputDecoration(
              prefixIcon: Container(
                  padding: const EdgeInsets.all(15),
                  width: 10,
                  height: 10,
                  child: SvgPicture.asset(
                    widget.leadingIcon,
                    fit: BoxFit.contain,
                    color: ColorConstants.primaryText,
                  )),
              suffixIcon: widget.isPassword
                  ? InkWell(
                    onTap: (){
                      isObscure = !isObscure;
                      setState(() {
                        
                      });
                    },
                    child: Container(
                        padding: const EdgeInsets.all(12),
                        width: 10,
                        height: 10,
                        child: SvgPicture.asset(
                          isObscure ? AppAssets.eyeClosed : AppAssets.eyeIcon,
                          fit: BoxFit.contain,
                          color: isObscure? Colors.black: ColorConstants.primaryText,
                        )),
                  )
                  : null,
              isDense: true,
              enabledBorder: OutlineInputBorder(
                  borderRadius: BorderRadius.circular(30),
                  borderSide: const BorderSide(color: Colors.transparent)),
              focusedBorder: OutlineInputBorder(
                  borderRadius: BorderRadius.circular(30),
                  borderSide: const BorderSide(color: Colors.transparent)),
              focusedErrorBorder: OutlineInputBorder(
                  borderRadius: BorderRadius.circular(30),
                  borderSide: const BorderSide(color: Colors.transparent)),
            ),
          ),
        ),
      ],
    );
  }
}
