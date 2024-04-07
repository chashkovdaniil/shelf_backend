import 'dart:async';

import 'package:shelf/shelf.dart';
import 'package:shelf_router/shelf_router.dart';

part 'datetime_service.g.dart';

/// Так как кодген умеет монтировать только через геттеры, то необходимо
/// выделить под апи отдельный сервис. Чтобы все так же осталось красивым.
class DateTimeApiService {
  @Route.get('/datetime/current')
  @Route.get('/datetime/current/')
  FutureOr<Response> currentDateTime(Request request) =>
      Response.ok(DateTime.now().toIso8601String());

  Router get router => _$DateTimeApiServiceRouter(this);
}

class DateTimeService {
  final _apiService = DateTimeApiService();

  @Route.mount('/api/')
  Router get _apiRouter => _apiService.router;

  Router get router => _$DateTimeServiceRouter(this);
}
