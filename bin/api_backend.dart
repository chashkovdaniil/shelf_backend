import 'package:shelf/shelf.dart';
import 'package:shelf/shelf_io.dart';
import 'package:shelf_backend/datetime_service/datetime_service.dart';
import 'package:shelf_backend/json_service/json_service.dart';
import 'package:shelf_backend/shelf.dart';

Future<void> startApiBackend() async {
  final jsonService = JsonService();
  final dateTimeService = DateTimeService();
  final cascade = Cascade()
      .add(jsonService.mainRouter.call)
      .add(dateTimeService.router.call);
  final handler = Pipeline()
      .addMiddleware(logRequests())
      .addMiddleware(logMiddleware())
      .addHandler(cascade.handler);

  await serve(handler, 'localhost', 8080);
}
