part of 'user_bloc.dart';

abstract class UserEvent {}

class UserLoadEvent extends UserEvent {}

class UserClearEvent extends UserEvent {}
