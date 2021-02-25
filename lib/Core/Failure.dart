import 'package:flutter/material.dart';

@immutable
class Failure {}
class NoDataFailure extends Failure{
  final String message;

  NoDataFailure({this.message});
}
class ServerFailure extends Failure{
  final String message;

  ServerFailure({this.message});
}