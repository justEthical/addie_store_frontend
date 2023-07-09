import 'package:addie_store/Constants/app_assets.dart';
import 'package:addie_store/Constants/color_constants.dart';
import 'package:addie_store/Controllers/login_signup_ctrl.dart';
import 'package:addie_store/Screens/LoginAndSignup/Widgets/signup_form.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:flutter/src/widgets/framework.dart';
import 'package:flutter/src/widgets/placeholder.dart';
import 'package:flutter_svg/svg.dart';
import 'package:get/get.dart';

class CustomTextField extends StatefulWidget {
  final TextEditingController textCtrl;
  final String hintText;
  final String leadingIcon;
  final String title;
  final bool isPassword;
  final TextInputType? keyBoardType;
  const CustomTextField(
      {super.key,
      required this.textCtrl,
      required this.hintText,
      required this.leadingIcon,
      required this.title,
      required this.isPassword,
      this.keyBoardType});

  @override
  State<CustomTextField> createState() => _CustomTextFieldState();
}

class _CustomTextFieldState extends State<CustomTextField> {
  var isObscure = false;
  final LoginSignUpController c = Get.find();

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
            style: const TextStyle(fontSize: 14, fontWeight: FontWeight.w400),
          ),
        ),
        Container(
          padding: const EdgeInsets.symmetric(horizontal: 10),
          decoration: BoxDecoration(
              // color: Colors.grey.withOpacity(0.1),
              borderRadius: BorderRadius.circular(30)),
          child: TextFormField(
            
            obscureText: isObscure,
            controller: widget.textCtrl,
            keyboardType: widget.keyBoardType,
            autovalidateMode: AutovalidateMode.onUserInteraction,
            inputFormatters: [LengthLimitingTextInputFormatter(widget.hintText == "Phone number"? 10: 50),],
            validator: (val) {
              if(val == ""){
                return "This field cannot be empty";
              }
              if (widget.textCtrl == c.loginEmail ||
                  widget.textCtrl == c.registerEmail) {
                final bool emailValid = RegExp(
                        r"^[a-zA-Z0-9.a-zA-Z0-9.!#$%&'*+-/=?^_`{|}~]+@[a-zA-Z0-9]+\.[a-zA-Z]+")
                    .hasMatch(val!);
                if(!emailValid){
                  return "Email format is not valid";
                }
              }

              if(widget.textCtrl == c.registerPassword){
                if(val!.length < 8){
                  return "Password must be of 8 characters";
                }
                if(!val.contains(RegExp(r'[!@#$%^&*(),.?":{}|<>]'))){
                  return "Password must contain a special Character";
                }
                if(!val.contains(RegExp(r'[0-9]'))){
                  return "Password must contain a number";
                }
              }

              if(widget.textCtrl == c.registerConfirmPassword){
                if(c.registerConfirmPassword.text != c.registerPassword.text){
                  return "Password does not match";
                }
              }

              if(widget.textCtrl == c.registerPhoneNo){
                if(c.registerPhoneNo.text.length != 10){
                  return "Phone number not valid";
                }
              }

            },
            decoration: InputDecoration(
              filled: true,
              fillColor: Colors.grey.withOpacity(0.1),
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
                      onTap: () {
                        isObscure = !isObscure;
                        setState(() {});
                      },
                      child: Container(
                          padding: const EdgeInsets.all(12),
                          width: 10,
                          height: 10,
                          child: SvgPicture.asset(
                            isObscure ? AppAssets.eyeClosed : AppAssets.eyeIcon,
                            fit: BoxFit.contain,
                            color: isObscure
                                ? Colors.black
                                : ColorConstants.primaryText,
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
              errorBorder: OutlineInputBorder(
                  borderRadius: BorderRadius.circular(30),
                  borderSide: const BorderSide(color: Colors.red)),
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
