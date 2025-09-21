import 'package:bookia/feature/home/data/models/response/book_list_respose/book_list_respose.dart';
import 'package:bookia/feature/home/data/models/response/book_list_respose/product.dart';
import 'package:bookia/feature/search/data/models/request/search_request.dart';
import 'package:bookia/feature/search/data/repo/search_repo.dart';
import 'package:bookia/feature/search/presentation/cubit/search_states.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

class SearchCubit extends Cubit<SearchStates> {
  SearchCubit() : super(SearchInitial());
  var searchNameControllar = TextEditingController();

  List<Product> products = [];

  Future<void> getSearch() async {
    var params = SearchRequest(name: searchNameControllar.text);
    emit(SearchLoading());
    var response = await SearchRepo.getSearch(params);

    products = (response as BookListRespose).data?.products ?? [];
    // success
    emit(SearchSuccess());
  }
}
