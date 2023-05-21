import 'dart:async';
import 'dart:io';
import 'package:dio/dio.dart';
import '../config/app_build_config.dart';
import 'exceptions/api_exception.dart';
import 'exceptions/app_exception.dart';
import 'exceptions/bad_certificate_exception.dart';
import 'exceptions/forbidden_exception.dart';
import 'exceptions/network_exception.dart';
import 'exceptions/not_found_exception.dart';
import 'exceptions/service_unavailable_exception.dart';
import 'exceptions/unauthorized_exception.dart';

Exception handleError(String error) {
  final logger = APPBuildConfig.instance.config.logger;
  logger.e("Generic exception: $error");
  return AppException(message: error);
}

Exception handleDioError(DioError dioError) {
  switch (dioError.type) {
    case DioErrorType.cancel:
      return AppException(message: "Request to API server was cancelled");
    case DioErrorType.connectionTimeout:
      return AppException(message: "Connection timeout with API server");
    case DioErrorType.unknown:
      return NetworkException("There is no internet connection");
    case DioErrorType.receiveTimeout:
      return TimeoutException("Receive timeout in connection with API server");
    case DioErrorType.sendTimeout:
      return TimeoutException("Send timeout in connection with API server");
    case DioErrorType.badResponse:
      return _parseDioErrorResponse(dioError);
    case DioErrorType.badCertificate:
      return BadCertificateException("badCertificate error");
    case DioErrorType.connectionError:
      return TimeoutException("connectionError");
  }
}

Exception _parseDioErrorResponse(DioError dioError) {
  final logger = APPBuildConfig.instance.config.logger;

  int code = dioError.response?.statusCode ?? -1;
  String? status;
  String? serverMessage;
  try {
    if (code == -1 || code == HttpStatus.ok) {
      code = dioError.response?.data["statusCode"];
    }
    serverMessage = dioError.response?.data["message"];
  } catch (e, s) {
    logger.i("$e");
    logger.i(s.toString());

    serverMessage = "Something went wrong. Please try again later.";
  }

  switch (code) {
    case HttpStatus.serviceUnavailable:
      return ServiceUnavailableException("Service Temporarily Unavailable");
    case HttpStatus.notFound:
      return NotFoundException(serverMessage ?? "", status ?? "");
    case HttpStatus.unauthorized:
      return UnauthorizedException(serverMessage ?? "");
    case HttpStatus.forbidden:
      return ForbiddenException(serverMessage ?? "");
    default:
      return ApiException(code: code, message: serverMessage ?? "");
  }
}
