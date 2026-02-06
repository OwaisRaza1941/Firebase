import 'package:firebase_auth/firebase_auth.dart';
import 'package:firebase_series/ui/dailogs/error_dailogs.dart';
import 'package:firebase_series/ui/dailogs/otp_dailoge.dart';
import 'package:firebase_series/ui/dailogs/success_dailoge.dart';
import 'package:firebase_series/ui/screens/home_page.dart';
import 'package:firebase_series/services/phone_auth_services.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

class PhoneAutController extends GetxController {
  final PhoneAuthServices _services = PhoneAuthServices();
  final TextEditingController otpController = TextEditingController();

  RxBool isLoading = false.obs;
  RxString verificationId = "".obs;

  Future<void> sendOtp(String phone) async {
    isLoading(true);

    await _services.phoneLogin(
      phoneNumber: phone,
      codeSent: (vid) {
        verificationId.value = vid;
        isLoading(false);

        showOtpDialog(
          otpController: otpController,
          onVerify: () {
            verifyOtp(otpController.text.trim());
          },
        );
      },
      onError: (e) {
        isLoading(false);
        showErrorDialog(e.message ?? "Phone auth failed");
      },
    );
  }

  Future<void> verifyOtp(String otp) async {
    try {
      isLoading(true);
      PhoneAuthCredential credential = PhoneAuthProvider.credential(
        verificationId: verificationId.value,
        smsCode: otp,
      );

      await FirebaseAuth.instance.signInWithCredential(credential);

      isLoading(false);

      // ✅ Success Popup
      showSuccessDialog("Logged in successfully 🎉");

      Get.offAll(HomePage());
    } catch (e) {
      isLoading(false);
      showErrorDialog("Invalid OTP");
    }
  }
}
