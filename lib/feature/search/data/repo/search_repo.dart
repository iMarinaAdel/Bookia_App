import 'dart:developer';

import 'package:bookia/core/services/api/api_endpoints.dart';
import 'package:bookia/core/services/api/dio_provider.dart';
import 'package:bookia/feature/home/data/models/response/book_list_respose/book_list_respose.dart';
import 'package:bookia/feature/search/data/models/request/search_request.dart';

class SearchRepo {
  static getSearch(SearchRequest params) async {
    try {
      var res = await DioProvider.get(
        endPoint: ApiEndpoints.search,
        queryParameters: params.toJson(),
      );
      if (res.statusCode == 200) {
        return BookListRespose.fromJson(res.data);
      } else {
        return null;
      }
    } on Exception catch (e) {
      log(e.toString());
      return null;
    }
  }
}
