import '/flutter_flow/flutter_flow_util.dart';
import 'package:flutter/material.dart';

class HealthProfileModel extends FlutterFlowModel<HealthProfileWidget> {
  ///  State fields for stateful widgets in this page.

  final unfocusNode = FocusNode();
  // State field(s) for TextField widget.
  FocusNode? heightFocusNode;
  TextEditingController? heightController;
  String? Function(BuildContext, String?)? heightControllerValidator;
  // State field(s) for TextField widget.
  FocusNode? weightFocusNode;
  TextEditingController? weightController;
  String? Function(BuildContext, String?)? weightControllerValidator;
  // State field(s) for TextField widget.
  FocusNode? ageFocusNode;
  TextEditingController? ageController;
  String? Function(BuildContext, String?)? ageControllerValidator;
  // State field(s) for DropDown widget.
  String? genderValue;
  // State field(s) for DropDown widget.
  String? activityLevelValue;
  // State field(s) for DropDown widget.
  String? healthGoalValue;
  // State field(s) for MultiSelect widget.
  List<String> allergies = [];
  // State field(s) for MultiSelect widget.
  List<String> dietaryRestrictions = [];
  
  // Calculated values
  double bmr = 0.0;
  double dailyCalorieGoal = 0.0;
  bool isLoading = false;

  /// Initialization and disposal methods.

  @override
  void initState(BuildContext context) {}

  @override
  void dispose() {
    unfocusNode.dispose();
    heightFocusNode?.dispose();
    heightController?.dispose();

    weightFocusNode?.dispose();
    weightController?.dispose();

    ageFocusNode?.dispose();
    ageController?.dispose();
  }

  /// Action blocks are added here.

  /// Additional helper methods are added here.
}

