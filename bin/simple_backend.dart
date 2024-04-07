import 'package:shelf/shelf.dart';
import 'package:shelf/shelf_io.dart';
import 'package:shelf_backend/shelf.dart';

Future<void> startSimpleBackend() async {
  final handler = Pipeline()
      .addMiddleware(logRequests())
      .addMiddleware(logMiddleware())
      .addHandler((request) => Response.ok(request.requestedUri.toString()));

  await serve(handler, 'localhost', 8080);
}
