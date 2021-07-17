// Copyright 2020, the Flutter project authors. Please see the AUTHORS file
// for details. All rights reserved. Use of this source code is governed by a
// BSD-style license that can be found in the LICENSE file.

import 'dart:convert';

import 'package:http/http.dart' as http;
import 'package:mockito/mockito.dart';

class MockClient extends Mock implements http.Client {
  MockClient() {
    var url1 = Uri.parse('https://example.com/signin');
    when(post(url1, body: anyNamed('body'))).thenAnswer((answering) {
      dynamic body = answering.namedArguments[const Symbol('body')];

      if (body != null && body is String) {
        var decodedJson = json.decode(body) as Map<String, String>;

        if (decodedJson['email'] == 'root' &&
            decodedJson['password'] == 'password') {
          return Future.value(http.Response('', 200));
        }
      }

      return Future.value(http.Response('', 401));
    });

    var url = Uri.parse('https://example.com/signout');
    when(post(url)).thenAnswer((_) => Future.value(http.Response('', 401)));
  }
}
