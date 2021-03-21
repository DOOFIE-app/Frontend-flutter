import 'package:dio/dio.dart';

import 'commons.dart';

BaseOptions options = BaseOptions(
  baseUrl: Commons.baseURL,
  connectTimeout: 5000,
  receiveTimeout: 3000,
);
Dio dio = Dio(options);
