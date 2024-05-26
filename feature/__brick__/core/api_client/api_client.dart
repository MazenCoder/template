import 'package:riverpod_annotation/riverpod_annotation.dart';
import 'package:http/http.dart' as http;
import '../usecases/constants.dart';
import '../error/failures.dart';
import 'dart:developer';
import 'dart:convert';

part 'api_client.g.dart';


abstract class IApiClient {

  // Future<String?> getIdToken();
  Future<void> updateHeader();
  Future<http.Response> getData({
    required String url,
    Map<String, String>? headers,
  });

  Future<http.Response> putData({
    required String url,
    Map<String, dynamic>? data,
    Map<String, String>? headers,
  });

  Future<http.Response> postData({
    required String url,
    Map<String, dynamic>? data,
    Map<String, String>? headers,
  });

  Future<http.Response> deleteData({
    required String url,
    Map<String, dynamic>? data,
    Map<String, String>? headers,
  });

}

@Riverpod(keepAlive: true)
ApiClient apiClient(ApiClientRef ref) {
  return ApiClient();
}

class ApiClient implements IApiClient {


  Map<String, String> _headers = {
    'Accept': 'application/json',
    'Content-Type': 'application/json',
  };


  @override
  Future<http.Response> getData({
    required String url,
    Map<String, String>? headers,
  }) async {
    try {
      if (headers == null) await updateHeader();
      final response = await http.get(
        Uri.parse(url), headers: headers ?? _headers,
      );
      log('getData url: $url\n response: ${response.body}');
      return response;
    } catch(e) {
      logger.e(e);
      throw ServerFailure(
        type: ServerExceptionType.general,
        message: '$e',
      );
    }
  }

  @override
  Future<http.Response> putData({
    required String url,
    Map<String, dynamic>? data,
    Map<String, String>? headers,
  }) async {
    try {
      if (headers == null) await updateHeader();
      final response = await http.put(
        Uri.parse(url), headers: headers ?? _headers,
        body: data != null ? jsonEncode(data) : null,
      );
      log('putData url: $url\n response: ${response.body}');
      return response;
    } catch(e) {
      logger.e(e);
      throw ServerFailure(
        type: ServerExceptionType.general,
        message: '$e',
      );
    }
  }

  @override
  Future<http.Response> postData({
    required String url,
    Map<String, dynamic>? data,
    Map<String, String>? headers,
  }) async {
    try {
      if (headers == null) await updateHeader();
      final response = await http.post(
        Uri.parse(url), headers: headers ?? _headers,
        body: data != null ? jsonEncode(data) : null,
      );
      log('postData url: $url\n response: ${response.body}');
      return response;
    } catch(e) {
      logger.e(e);
      throw ServerFailure(
        type: ServerExceptionType.general,
        message: '$e',
      );
    }
  }

  @override
  Future<http.Response> deleteData({
    required String url,
    Map<String, dynamic>? data,
    Map<String, String>? headers,
  }) async {
    try {
      if (headers == null) await updateHeader();
      final response = await http.delete(
        Uri.parse(url), headers: headers ?? _headers,
        body: data != null ? jsonEncode(data) : null,
      );
      log('deleteData url: $url\n response: ${response.body}');
      return response;
    } catch(e) {
      logger.e(e);
      throw ServerFailure(
        type: ServerExceptionType.general,
        message: '$e',
      );
    }
  }

  @override
  Future<void> updateHeader() async {
    try {
      //! TODO: Fix this
      /*
      String? idToken = await getIdToken();
      if (idToken != null) {
        _headers = {
          'authorization': idToken,
          'Accept': 'application/json',
          'Content-Type': 'application/json',
        };
      }
      */
    } catch(e) {
      logger.e(e);
      throw ServerFailure(
        type: ServerExceptionType.general,
        message: '$e',
      );
    }
  }


  /*
  @override
  Future<String?> getIdToken() async {
    return await auth.currentUser?.getIdToken();
  }
  */

}
