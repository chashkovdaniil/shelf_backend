import 'package:shelf_router/shelf_router.dart';

import 'api/routes/json_compress_route.dart';
import 'api/routes/json_example_route.dart';

class JsonService {
  final mainRouter = Router();
  final apiRouter = Router();

  JsonService() {
    _connect();
  }

  void _connect() {
    final jsonExampleRoute = JsonExampleRoute();
    final jsonCompressRoute = JsonCompressRoute();

    apiRouter.get(jsonExampleRoute.route, jsonExampleRoute.handler);
    apiRouter.post(jsonCompressRoute.route, jsonCompressRoute.handler);
    mainRouter.mount('/api/', apiRouter.call);
  }
}
