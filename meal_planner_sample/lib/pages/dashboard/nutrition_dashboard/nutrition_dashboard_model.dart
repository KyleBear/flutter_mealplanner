import '/flutter_flow/flutter_flow_util.dart';
import 'package:flutter/material.dart';

class NutritionDashboardModel extends FlutterFlowModel<NutritionDashboardWidget> {
  ///  State fields for stateful widgets in this page.

  final unfocusNode = FocusNode();
  
  // Date selection
  DateTime selectedDate = DateTime.now();
  
  // Calorie data
  double totalCalories = 0.0;
  double targetCalories = 2000.0;
  
  // Macro nutrients
  double carbsConsumed = 0.0;
  double proteinConsumed = 0.0;
  double fatConsumed = 0.0;
  double carbsTarget = 250.0;
  double proteinTarget = 125.0;
  double fatTarget = 56.0;
  
  // Meal breakdown
  double breakfastCalories = 0.0;
  double lunchCalories = 0.0;
  double dinnerCalories = 0.0;
  double snackCalories = 0.0;
  
  // Micro nutrients
  double vitaminC = 0.0;
  double calcium = 0.0;
  double iron = 0.0;
  double magnesium = 0.0;
  
  // Achievements
  double calorieAchievement = 0.0;
  double carbsAchievement = 0.0;
  double proteinAchievement = 0.0;
  double fatAchievement = 0.0;
  
  // Health score
  double healthScore = 0.0;
  
  // Weekly data
  List<double> weeklyCalories = [];
  
  // Loading state
  bool isLoading = false;

  /// Initialization and disposal methods.

  @override
  void initState(BuildContext context) {}

  @override
  void dispose() {
    unfocusNode.dispose();
  }

  /// Action blocks are added here.

  /// Additional helper methods are added here.
}
