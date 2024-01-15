import 'dart:developer';

import 'package:flutter/material.dart';
import 'package:post_api/services/post_api_service.dart';
import 'package:post_api/models/sign_up_request_model.dart';
import 'package:post_api/widgets/text_field_widget.dart';

class MyHomePage extends StatefulWidget {
  const MyHomePage({super.key});

  @override
  State<MyHomePage> createState() => _MyWidgetState();
}

class _MyWidgetState extends State<MyHomePage> {
  @override
  Widget build(BuildContext context) {
    return buildBody();
  }

  TextEditingController nameController = TextEditingController();
  TextEditingController emailController = TextEditingController();
  String gender = "male";
  String status = "active";

  Widget buildBody() {
    return Scaffold(
      appBar: AppBar(
        centerTitle: true,
        title: const Text("SignUp Screen"),
      ),
      body: SingleChildScrollView(
        child: Container(
          margin: EdgeInsets.symmetric(vertical: 20, horizontal: 20),
          child: Form(
            child: Column(
              children: [
                TextFormFieldWidget(controller: nameController, text: "Name"),
                const SizedBox(
                  height: 30,
                ),
                TextFormFieldWidget(controller: emailController, text: "Email"),
                Container(
                  padding: EdgeInsets.symmetric(horizontal: 20),
                  decoration: BoxDecoration(
                      color: Colors.greenAccent,
                      borderRadius: BorderRadius.circular(10),
                      boxShadow: const [
                        BoxShadow(
                          color: Colors.black,
                          offset: Offset(2, 2),
                          blurRadius: 5,
                        ),
                      ]),
                  margin: const EdgeInsets.symmetric(vertical: 30),
                  child: Row(
                    mainAxisAlignment: MainAxisAlignment.start,
                    children: [
                      const Text("Gender",
                          style: TextStyle(
                              fontWeight: FontWeight.bold, fontSize: 18)),
                      Flexible(
                        child: ListTile(
                          contentPadding: EdgeInsets.zero,
                          leading: Radio(
                              value: "male",
                              groupValue: gender,
                              onChanged: (value) {
                                setState(() {
                                  gender = value ?? "";
                                });
                              }),
                          title: const Text("Male"),
                        ),
                      ),
                      Flexible(
                        child: ListTile(
                          contentPadding: EdgeInsets.zero,
                          leading: Radio(
                              value: "female",
                              groupValue: gender,
                              onChanged: (value) {
                                setState(() {
                                  gender = value ?? "";
                                });
                              }),
                          title: const Text("Female"),
                        ),
                      )
                    ],
                  ),
                ),
                Container(
                  padding: EdgeInsets.symmetric(horizontal: 20),
                  decoration: BoxDecoration(
                      color: Colors.greenAccent,
                      borderRadius: BorderRadius.circular(10),
                      boxShadow: const [
                        BoxShadow(
                          color: Colors.black,
                          offset: Offset(2, 2),
                          blurRadius: 5,
                        ),
                      ]),
                  child: Row(
                    children: [
                      const Text(
                        "Status",
                        style: TextStyle(
                            fontWeight: FontWeight.bold, fontSize: 18),
                      ),
                      Flexible(
                        child: ListTile(
                          contentPadding: EdgeInsets.zero,
                          leading: Radio(
                              value: "Active",
                              groupValue: status,
                              onChanged: (value) {
                                setState(() {
                                  status = value ?? "";
                                });
                              }),
                          title: const Text("Active"),
                        ),
                      ),
                      Flexible(
                        child: ListTile(
                          contentPadding: EdgeInsets.zero,
                          leading: Radio(
                              value: "inactive",
                              groupValue: status,
                              onChanged: (value) {
                                setState(() {
                                  status = value ?? "";
                                });
                              }),
                          title: const Text("Inactive"),
                        ),
                      )
                    ],
                  ),
                ),
                const SizedBox(
                  height: 30,
                ),
                Container(
                  child: ElevatedButton(
                    style: ElevatedButton.styleFrom(
                      backgroundColor: Colors.greenAccent,
                      shape: RoundedRectangleBorder(
                          borderRadius: BorderRadius.circular(10)),
                    ),
                    onPressed: () {
                      log(nameController.text);
                      log(emailController.text);
                      SignUpRequestModel signUpRequestModel =
                          SignUpRequestModel(
                              name: nameController.text,
                              email: emailController.text,
                              gender: gender,
                              status: status);
                      log("SignUpRequestModel is ${signUpRequestModel.toJson()}");
                      PostApiService.postData(signUpRequestModel);
                    },
                    child: const Text("SignUp",
                        style: TextStyle(color: Colors.black)),
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
