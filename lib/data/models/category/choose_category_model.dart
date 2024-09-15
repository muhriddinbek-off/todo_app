import 'package:flutter/material.dart';
import 'package:todo_app/utils/app_colors.dart';
import 'package:todo_app/utils/app_icons.dart';

class ChooseCategoryModel {
  final String categoryIcon;
  final String categoryName;
  final Color categoryColor;
  ChooseCategoryModel({
    required this.categoryIcon,
    required this.categoryName,
    required this.categoryColor,
  });
}

List<ChooseCategoryModel> categories = [
  ChooseCategoryModel(categoryIcon: AppIcons.grocery, categoryName: "Grocery", categoryColor: AppColors.cC9CC41),
  ChooseCategoryModel(categoryIcon: AppIcons.work, categoryName: "Work", categoryColor: AppColors.cCC4173),
  ChooseCategoryModel(categoryIcon: AppIcons.sport, categoryName: "Sport", categoryColor: AppColors.cCC8441),
  ChooseCategoryModel(categoryIcon: AppIcons.design, categoryName: "Design", categoryColor: AppColors.c9741CC),
  ChooseCategoryModel(categoryIcon: AppIcons.university, categoryName: "University", categoryColor: AppColors.c8687E7),
  ChooseCategoryModel(categoryIcon: AppIcons.social, categoryName: "Social", categoryColor: AppColors.c41CCA7),
  ChooseCategoryModel(categoryIcon: AppIcons.music, categoryName: "Music", categoryColor: AppColors.c41A2CC),
  ChooseCategoryModel(categoryIcon: AppIcons.health, categoryName: "Health", categoryColor: AppColors.c4181CC),
  ChooseCategoryModel(categoryIcon: AppIcons.movie, categoryName: "Movie", categoryColor: AppColors.cC9CC41),
  ChooseCategoryModel(categoryIcon: AppIcons.home2, categoryName: "Home", categoryColor: AppColors.cC9CC41),
  ChooseCategoryModel(categoryIcon: AppIcons.other, categoryName: "Other", categoryColor: AppColors.c8687E7),
];
