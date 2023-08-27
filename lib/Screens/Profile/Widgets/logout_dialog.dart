import 'package:addie_store/CommonWidgets/custom_loader.dart';
import 'package:addie_store/Services/auth_service.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

class LogoutDialog extends StatelessWidget {
  const LogoutDialog({super.key});

  @override
  Widget build(BuildContext context) {
    return Container(
      padding: const EdgeInsets.symmetric(horizontal: 20),
      decoration: BoxDecoration(
          color: Colors.white, borderRadius: BorderRadius.circular(20)),
      child: Column(
        children: [
          const Text(
            "Are you sure, you want to logout?",
            style: TextStyle(
                fontSize: 20, fontWeight: FontWeight.w600, color: Colors.black),
          ),
          const SizedBox(
            height: 12,
          ),
          Row(
            children: [
              ElevatedButton(
                  style: ElevatedButton.styleFrom(
                      shape: RoundedRectangleBorder(
                          borderRadius: BorderRadius.circular(40)),
                      primary: Colors.grey.shade100,
                      fixedSize: const Size(
                        80,
                        40,
                      )),
                  onPressed: () async {
                    CustomLoader.showLoader();
                    await AuthService.logout();
                    CustomLoader.hideLoader();
                  },
                  child: const Text(
                    "Yes",
                    style: TextStyle(
                        fontSize: 15,
                        fontWeight: FontWeight.w600,
                        color: Colors.grey),
                  )),
              const Spacer(),
              ElevatedButton(
                  style: ElevatedButton.styleFrom(
                      shape: RoundedRectangleBorder(
                          borderRadius: BorderRadius.circular(40)),
                      // primary: Colors.grey.shade100,
                      fixedSize: const Size(
                        80,
                        40,
                      )),
                  onPressed: () => Get.back(),
                  child: const Text(
                    "NO",
                    style: TextStyle(
                        fontSize: 15,
                        fontWeight: FontWeight.w600,
                        color: Colors.black),
                  )),
            ],
          ),
        ],
      ),
    );
  }
}
