import 'package:bookia/core/services/api/api_endpoints.dart';
import 'package:bookia/core/services/api/dio_provider.dart';
import 'package:bookia/feature/home/data/models/response/book_list_respose/book_list_respose.dart';
import 'package:bookia/feature/home/data/models/response/slider_response/slider_response.dart';

class HomeRepo {
  static Future<SliderResponse?> getSlider() async {
    var res = await DioProvider.get(endPoint: ApiEndpoints.slider);
    if (res.statusCode == 200) {
      // succses
      return SliderResponse.fromJson(res.data);
    } else {
      return null;
    }
  }

  static Future<BookListRespose?> getBestSeller() async {
    var res = await DioProvider.get(endPoint: ApiEndpoints.bsetSeller);
    if (res.statusCode == 200) {
      // succses
      return BookListRespose.fromJson(res.data);
    } else {
      return null;
    }
  }

  static Future<BookListRespose?> getNewArrivals() async {
    var res = await DioProvider.get(endPoint: ApiEndpoints.newArrivals);
    if (res.statusCode == 200) {
      // succses
      return BookListRespose.fromJson(res.data);
    } else {
      return null;
    }
  }

  static Future<BookListRespose?> getAllProduct([int pageIndex = 1]) async {
    var res = await DioProvider.get(
      endPoint: ApiEndpoints.allProducts,
      queryParameters: {'page': pageIndex},
    );
    if (res.statusCode == 200) {
      // succses
      return BookListRespose.fromJson(res.data);
    } else {
      return null;
    }
  }
}
