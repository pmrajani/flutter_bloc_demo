import 'dart:async';

import 'package:dio/dio.dart';
import 'package:flutter/material.dart';

class NetworkClient {
  Dio dio;
  NetworkClient({@required this.dio});

  Future<dynamic> postWithDio(
      {String url,
      Map<String, dynamic> body,
      Map<String, dynamic> addHeaders}) {
    print(" POST URL      ==================  : $url");
    print(" POST BODY     ==================  : $body");
    print(" POST HEADERS     ==================  : $addHeaders");

    return dio
        .post(
      url,
      data: FormData.fromMap(body),
      options: Options(headers: addHeaders),
    )
        .then(
      (Response response) {
        int code = response.statusCode;
        print("RESPONSE : $code...${response.data}");

        if (code < 200 || code > 400) {
          throw new Exception("Error While Posting Data");
        }
        return response.data;
      },
    );
  }

  Future<dynamic> getWithDio({String url, Map body, Map addHeaders}) {
    print(" GET URL      ==================  : $url");
    print(" GET BODY     ==================  : $body");
    print(" GET HEADERS  ==================  : $addHeaders");

    return dio
        .get(url, queryParameters: body, options: Options(headers: addHeaders))
        .then(
      (Response response) {
        int code = response.statusCode;
        print("RESPONSE : $code...${response.data}");

        if (code < 200 || code > 400) {
          throw new Exception("Error While Posting Data");
        }
        return response.data;
      },
    );
  }
}
