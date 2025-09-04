import '/flutter_flow/flutter_flow_util.dart';
import 'package:flutter/material.dart';
import 'package:table_calendar/table_calendar.dart';

class EnhancedDashboardModel extends FlutterFlowModel<EnhancedDashboardWidget> {
  ///  State fields for stateful widgets in this page.

  final unfocusNode = FocusNode();
  
  // Calendar
  DateTime focusedDay = DateTime.now();
  DateTime selectedDay = DateTime.now();
  CalendarFormat calendarFormat = CalendarFormat.month;
  
  // Today's data
  double todayCalories = 0.0;
  double dailyCalorieGoal = 2000.0;
  double todayHealthScore = 0.0;
  
  // Meal data
  List<MealRecord> allMeals = [];
  List<MealRecord> selectedDateMeals = [];
  
  // Weekly data
  List<double> weeklyCalories = [];
  
  // Add meal
  String selectedMealType = '';
  DateTime? selectedMealTime;
  
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
