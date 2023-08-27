import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:flutter/src/widgets/framework.dart';
import 'package:flutter/src/widgets/placeholder.dart';
import 'package:fluttertoast/fluttertoast.dart';
import 'package:get/get.dart';

import '../../../Constants/color_constants.dart';

class PhoneNumberTextField extends StatefulWidget {
  const PhoneNumberTextField({super.key});

  @override
  State<PhoneNumberTextField> createState() => _PhoneNumberTextFieldState();
}

class _PhoneNumberTextFieldState extends State<PhoneNumberTextField> {
  var isPhoneNumberValid = true.obs;
  var errorMessage = "".obs;
  @override
  Widget build(BuildContext context) {
    return SizedBox(
      width: Get.width - 120,
      // height: 32,
      child: Obx(() => Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              SizedBox(
                width: Get.width - 120,
                height: 20,
                child: TextFormField(
                  inputFormatters: [LengthLimitingTextInputFormatter(10)],
                  onFieldSubmitted: (val) {
                    if (val.length < 10) {
                      isPhoneNumberValid.value = false;
                      errorMessage.value = "Invalid phone number";
                      Fluttertoast.showToast(msg: "Invalid phone number");
                    } else {
                      isPhoneNumberValid.value = true;
                      errorMessage.value = "";
                    }
                  },
                  keyboardType: TextInputType.phone,
                  decoration: InputDecoration(
                      enabledBorder: UnderlineInputBorder(
                        borderSide: BorderSide(
                            color: isPhoneNumberValid.value
                                ? ColorConstants.primaryText
                                : Colors.red),
                      ),
                      focusedBorder: UnderlineInputBorder(
                        borderSide: BorderSide(
                            color: isPhoneNumberValid.value
                                ? ColorConstants.primaryText
                                : Colors.red),
                      ),
                      prefixIcon: const Text(
                        "+91 ",
                        style: TextStyle(
                            fontSize: 16, fontWeight: FontWeight.w500),
                      ),
                      prefixIconConstraints: const BoxConstraints(maxWidth: 40),
                      contentPadding: const EdgeInsets.only(bottom: 10),
                      hintText: "Enter your phone number"),
                ),
              ),
              Obx(() => errorMessage.value == ""
                  ? const SizedBox()
                  : Text(
                      errorMessage.value,
                      style: const TextStyle(fontSize: 10, color: Colors.red),
                    ))
            ],
          )),
    );
  }
}
