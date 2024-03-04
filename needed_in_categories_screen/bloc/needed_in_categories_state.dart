// ignore_for_file: must_be_immutable

part of 'needed_in_categories_bloc.dart';

/// Represents the state of NeededInCategories in the application.
class NeededInCategoriesState extends Equatable {
  NeededInCategoriesState({
    this.fruitsController,
    this.enterQuantityController,
    this.neededInCategoriesModelObj,
  });

  TextEditingController? fruitsController;

  TextEditingController? enterQuantityController;

  NeededInCategoriesModel? neededInCategoriesModelObj;

  @override
  List<Object?> get props => [
        fruitsController,
        enterQuantityController,
        neededInCategoriesModelObj,
      ];
  NeededInCategoriesState copyWith({
    TextEditingController? fruitsController,
    TextEditingController? enterQuantityController,
    NeededInCategoriesModel? neededInCategoriesModelObj,
  }) {
    return NeededInCategoriesState(
      fruitsController: fruitsController ?? this.fruitsController,
      enterQuantityController:
          enterQuantityController ?? this.enterQuantityController,
      neededInCategoriesModelObj:
          neededInCategoriesModelObj ?? this.neededInCategoriesModelObj,
    );
  }
}
