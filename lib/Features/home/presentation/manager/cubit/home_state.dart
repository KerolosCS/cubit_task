part of 'home_cubit.dart';

sealed class HomeState {}

final class HomeInitial extends HomeState {}

final class BottomNavChange extends HomeState {}

final class AddItemSuccess extends HomeState {
  final String productName;

  AddItemSuccess(this.productName);
}

final class AddItemFailure extends HomeState {}

final class RemoveItemSuccess extends HomeState {}

final class PlusSuccess extends HomeState {}

final class PlusFailure extends HomeState {}

final class MinusFailure extends HomeState {}

final class MinusSuccess extends HomeState {}
