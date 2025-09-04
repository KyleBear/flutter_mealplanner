import '/flutter_flow/flutter_flow_util.dart';
import 'package:flutter/material.dart';

class CalorieRecommendationModel extends FlutterFlowModel<CalorieRecommendationWidget> {
  ///  State fields for stateful widgets in this page.

  final unfocusNode = FocusNode();
  
  // User data
  double dailyCalorieGoal = 2000.0;
  double carbRatio = 50.0;
  double proteinRatio = 25.0;
  double fatRatio = 25.0;
  String healthGoal = '체중유지';
  
  // Selected options
  String selectedMealType = '';
  bool calorieBasedRecommendation = true;
  bool nutritionBasedRecommendation = true;
  bool healthGoalRecommendation = true;
  bool allergyConsideration = true;
  
  // Recommendations
  List<Map<String, dynamic>> recommendations = [];
  
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
