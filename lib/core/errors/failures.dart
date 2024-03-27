import 'package:dio/dio.dart';

abstract class Failures {
  final String errMessage;
  const Failures(
    this.errMessage,
  );
}

class ServerFailures extends Failures {
  ServerFailures(super.errMessage);
  factory ServerFailures.fromDioError(DioException dioError) {
    switch (dioError.type) {
      case DioExceptionType.connectionTimeout:
        return ServerFailures("Connection Timeout with Api Server");
      case DioExceptionType.sendTimeout:
        return ServerFailures("Send Timeout with Api Server");
      case DioExceptionType.receiveTimeout:
        return ServerFailures("Receive Timeout with Api Server");
      case DioExceptionType.badCertificate:
        return ServerFailures("Bad Certificate with Api Server");
      case DioExceptionType.badResponse:
        return ServerFailures.fromBadResponse(
            dioError.response!.statusCode!, dioError.response!.data);
      case DioExceptionType.cancel:
        return ServerFailures("CANCEL with Api Server");
      case DioExceptionType.connectionError:
        return ServerFailures(
            "No Internet Connection Error: SocketException 1 ");

      case DioExceptionType.unknown:
        if (dioError.message!.contains('Socket')) {
          return ServerFailures("No Internet Connection 2 ");
        } else {
          return ServerFailures("Try AGAIN");
        }
      default:
        return ServerFailures("DEFAULT ERROR TRY AGIAN LATER ");
    }
  }
  factory ServerFailures.fromBadResponse(int statusCode, dynamic response) {
    if (statusCode == 400 || statusCode == 401 || statusCode == 403) {
      return ServerFailures(response['error']['message']);
    } else if (statusCode == 404) {
      return ServerFailures('Your request not found, Please try later!');
    } else if (statusCode == 500) {
      return ServerFailures('Internal Server error, Please try later');
    } else {
      return ServerFailures('Opps There was an Error, Please try again');
    }
  }
}

class CachedFailures extends Failures {
  CachedFailures(super.errMessage);
}

class NetworkFailures extends Failures {
  NetworkFailures(super.errMessage);
}
