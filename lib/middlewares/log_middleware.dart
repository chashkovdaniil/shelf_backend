import 'dart:developer' as dev;
import 'package:shelf/shelf.dart';

Middleware logMiddleware() => (Handler innerHandler) {
      return (request) {
        dev.log(
          'Request to ${request.url}\n'
          'Method: ${request.method}\n'
          'Headers: ${request.headers}\n',
        );

        return innerHandler(request);
      };
    };
