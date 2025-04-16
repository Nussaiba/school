import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:school/controller/auth/login_screen_controller.dart';
import 'package:school/core/class/handlingdataview.dart';
import 'package:school/core/functions/vaild.dart';
import 'package:school/view/widgets/general/custom_container.dart';
import 'package:school/view/widgets/general/sized_box.dart';
import 'package:school/view/widgets/login_screen_widget/button.dart';
import 'package:school/view/widgets/login_screen_widget/forget_password.dart';
import 'package:school/view/widgets/login_screen_widget/logo.dart';
import 'package:school/view/widgets/login_screen_widget/test_text_form.dart';

class LoginScreen extends StatelessWidget {
  const LoginScreen({super.key});

  @override
  Widget build(BuildContext context) {
    Get.put(LoginController());
    return Scaffold(
        body: GetBuilder<LoginController>(
            builder: (controller) => ListView(
                  children: [
                    LoginSectionOne(),
                    CustomBackgroundContainer(
                        widget: Column(children: [
                     HandlingDataRequest(
                    statusRequest: controller.statusRequest,
                    widget:
                        Form(
                          //  key: controller.formstate,
                          child: Column(
                            children: [
                              CustomSizedBox(),
                              CustomField(
                                labeltext: 'البريد اللإلكتروني',
                                valid: (value) {
                                  return valid(value!, 10, 25);
                                },
                                mycontroller: controller.email,
                              ),
                              CustomSizedBox(),
                              CustomField(
                                mycontroller: controller.password,
                                labeltext: 'كلمة المرور',
                                iconData: controller.passwordVissible
                                    ? Icons.visibility_off_outlined
                                    : Icons.visibility_off_outlined,
                                obscureText: controller.passwordVissible,
                                onTapIcon: () {
                                  controller.showPassword();
                                },
                                valid: (value) {
                                  return valid(value!, 8, 12);
                                },
                              ),
                              CustomSizedBox(),
                              InkWell(
                                  onTap: () {
                                    controller.gologin();
                                  },
                                  child: CustomButton(
                                    title: 'تسجيل الدخول ',
                                    icon: Icons.arrow_forward_outlined,
                                  )),
                              CustomSizedBox(),
                              CustomForgetPasswod(),
                            ],
                          ),
                        ),
                      ),
                    ])),
                  ],
                )));
  }
}
