import 'package:flutter/material.dart';
import '../../../utils/export_link.dart';

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
  ChooseCategoryModel(categoryIcon: AppIcons.grocery, categoryName: "grocery", categoryColor: AppColors.cC9CC41),
  ChooseCategoryModel(categoryIcon: AppIcons.work, categoryName: "gork", categoryColor: AppColors.cCC4173),
  ChooseCategoryModel(categoryIcon: AppIcons.sport, categoryName: "sport", categoryColor: AppColors.cCC8441),
  ChooseCategoryModel(categoryIcon: AppIcons.design, categoryName: "design", categoryColor: AppColors.c9741CC),
  ChooseCategoryModel(categoryIcon: AppIcons.university, categoryName: "university", categoryColor: AppColors.c8687E7),
  ChooseCategoryModel(categoryIcon: AppIcons.social, categoryName: "social", categoryColor: AppColors.c41CCA7),
  ChooseCategoryModel(categoryIcon: AppIcons.music, categoryName: "music", categoryColor: AppColors.c41A2CC),
  ChooseCategoryModel(categoryIcon: AppIcons.health, categoryName: "health", categoryColor: AppColors.c4181CC),
  ChooseCategoryModel(categoryIcon: AppIcons.movie, categoryName: "movie", categoryColor: AppColors.cC9CC41),
  ChooseCategoryModel(categoryIcon: AppIcons.home2, categoryName: "home", categoryColor: AppColors.cC9CC41),
  ChooseCategoryModel(categoryIcon: AppIcons.other, categoryName: "other", categoryColor: AppColors.c8687E7),
];
