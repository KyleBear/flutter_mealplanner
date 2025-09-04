import '/backend/backend.dart';
import '/flutter_flow/flutter_flow_util.dart';
import 'package:flutter/material.dart';

class HealthStatsModel extends FlutterFlowModel<HealthStatsWidget> {
  ///  State fields for stateful widgets in this page.

  final unfocusNode = FocusNode();
  
  // Today's health data
  double todayWeight = 0.0;
  int todaySteps = 0;
  int todayExerciseMinutes = 0;
  double todaySleepHours = 0.0;
  double todayHealthScore = 0.0;
  
  // Current health metrics
  double currentBmi = 0.0;
  double currentBodyFat = 0.0;
  double currentMuscleMass = 0.0;
  
  // Weekly averages
  double weeklyAvgSteps = 0.0;
  double weeklyAvgExerciseMinutes = 0.0;
  double weeklyAvgSleepHours = 0.0;
  double weeklyAvgWaterIntake = 0.0;
  
  // Weight history for chart
  List<double> weightHistory = [];
  
  // Recent records
  List<HealthStatsRecord> recentRecords = [];
  
  // Loading state
  bool isLoading = false;
  
  // Form controllers for adding new stats
  TextEditingController weightController = TextEditingController();
  TextEditingController bmiController = TextEditingController();
  TextEditingController bodyFatController = TextEditingController();
  TextEditingController stepsController = TextEditingController();
  TextEditingController exerciseController = TextEditingController();
  TextEditingController sleepController = TextEditingController();

  /// Initialization and disposal methods.

  @override
  void initState(BuildContext context) {}

  @override
  void dispose() {
    unfocusNode.dispose();
    weightController.dispose();
    bmiController.dispose();
    bodyFatController.dispose();
    stepsController.dispose();
    exerciseController.dispose();
    sleepController.dispose();
  }

  /// Action blocks are added here.

  /// Additional helper methods are added here.
}
