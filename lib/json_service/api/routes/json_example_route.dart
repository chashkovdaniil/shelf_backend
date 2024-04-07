import 'dart:convert';

import 'package:shelf/shelf.dart';

import '../../../models/route.dart';

class JsonExampleRoute implements Route {
  @override
  final route = '/json/example';

  @override
  Function get handler => (Request request) {
        return Response.ok(
          jsonEncode(
            {
              'name': 'Maria',
              'age': 18,
            },
          ),
          headers: {'Content-Type': 'application/json'},
        );
      };
}
