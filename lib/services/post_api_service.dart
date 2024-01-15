import 'dart:developer';

import 'package:post_api/models/sign_up_request_model.dart';
import 'package:http/http.dart' as http;

class PostApiService {
  static Future<void> postData(SignUpRequestModel signUpRequestModel) async {
    try {
      var response =
          await http.post(Uri.parse("https://gorest.co.in/public/v2/users"),
              headers: {
                'Content-type': 'application/json',
                "Authorization":
                    "Bearer 4886dfcfd3d0dd22cba3a9d2d0aac01a0c43e93259141dc48ba45a5c56f7272b"
              },
              body: signUpModelToJson(signUpRequestModel)
              //jsonEncode(signUpRequestModel.toJson()),
              );

      if (response.statusCode == 201) {
        log("response.body is ${response.body}");
      } else {
        throw Exception('Failed to post data');
      }
    } catch (e) {
      log("Failed to Load $e");
    }
  }
}
