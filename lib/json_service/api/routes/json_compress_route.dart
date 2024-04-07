import 'dart:convert';

import 'package:shelf/shelf.dart';
import 'package:shelf_backend/models/route.dart';

class JsonCompressRoute implements Route {
  @override
  final route = '/json/compress';

  @override
  Function get handler => (Request request) async {
        try {
          final body = await request.readAsString();
          final bodyWithoutLineBreaks = body.replaceAll(r'\n', '');
          final result = {
            'new': bodyWithoutLineBreaks,
            'old': body,
          };

          return Response.ok(
            jsonEncode(result),
            headers: {
              'Content-Type': 'application/json',
            },
          );
        } catch (error, stackTrace) {
          print((error, stackTrace));

          return Response.internalServerError(
            body: error.toString(),
          );
        }
      };
}

///
///curl --header "Content-Type: application/json" --request POST --data '{"username":"xyz",\n"password":"xyz"}' http://localhost:8080/api/json/compress