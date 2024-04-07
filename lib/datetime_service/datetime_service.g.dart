// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'datetime_service.dart';

// **************************************************************************
// ShelfRouterGenerator
// **************************************************************************

Router _$DateTimeApiServiceRouter(DateTimeApiService service) {
  final router = Router();
  router.add(
    'GET',
    r'/datetime/current',
    service.currentDateTime,
  );
  router.add(
    'GET',
    r'/datetime/current/',
    service.currentDateTime,
  );
  return router;
}

Router _$DateTimeServiceRouter(DateTimeService service) {
  final router = Router();
  router.mount(
    r'/api/',
    service._apiRouter.call,
  );
  return router;
}
