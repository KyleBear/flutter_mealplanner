import '/flutter_flow/flutter_flow_util.dart';
import 'package:flutter/material.dart';

class NutritionGoalsModel extends FlutterFlowModel<NutritionGoalsWidget> {
  ///  State fields for stateful widgets in this page.

  final unfocusNode = FocusNode();
  
  // State field(s) for TextField widget.
  FocusNode? dailyCaloriesFocusNode;
  TextEditingController? dailyCaloriesController;
  String? Function(BuildContext, String?)? dailyCaloriesControllerValidator;
  
  // State field(s) for TextField widget.
  FocusNode? weeklyCaloriesFocusNode;
  TextEditingController? weeklyCaloriesController;
  String? Function(BuildContext, String?)? weeklyCaloriesControllerValidator;
  
  // State field(s) for TextField widget.
  FocusNode? monthlyCaloriesFocusNode;
  TextEditingController? monthlyCaloriesController;
  String? Function(BuildContext, String?)? monthlyCaloriesControllerValidator;
  
  // State field(s) for TextField widget.
  FocusNode? vitaminCFocusNode;
  TextEditingController? vitaminCController;
  String? Function(BuildContext, String?)? vitaminCControllerValidator;
  
  // State field(s) for TextField widget.
  FocusNode? calciumFocusNode;
  TextEditingController? calciumController;
  String? Function(BuildContext, String?)? calciumControllerValidator;
  
  // State field(s) for TextField widget.
  FocusNode? ironFocusNode;
  TextEditingController? ironController;
  String? Function(BuildContext, String?)? ironControllerValidator;
  
  // State field(s) for TextField widget.
  FocusNode? magnesiumFocusNode;
  TextEditingController? magnesiumController;
  String? Function(BuildContext, String?)? magnesiumControllerValidator;
  
  // Macro ratio values
  double carbohydrateRatio = 50.0;
  double proteinRatio = 25.0;
  double fatRatio = 25.0;
  
  // Calculated values
  double dailyCalories = 0.0;
  double currentDailyCalories = 0.0;
  double currentCarbs = 0.0;
  double currentProtein = 0.0;
  double currentFat = 0.0;
  
  // Loading state
  bool isLoading = false;

  /// Initialization and disposal methods.

  @override
  void initState(BuildContext context) {}

  @override
  void dispose() {
    unfocusNode.dispose();
    dailyCaloriesFocusNode?.dispose();
    dailyCaloriesController?.dispose();
    weeklyCaloriesFocusNode?.dispose();
    weeklyCaloriesController?.dispose();
    monthlyCaloriesFocusNode?.dispose();
    monthlyCaloriesController?.dispose();
    vitaminCFocusNode?.dispose();
    vitaminCController?.dispose();
    calciumFocusNode?.dispose();
    calciumController?.dispose();
    ironFocusNode?.dispose();
    ironController?.dispose();
    magnesiumFocusNode?.dispose();
    magnesiumController?.dispose();
  }

  /// Action blocks are added here.

  /// Additional helper methods are added here.
}
