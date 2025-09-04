import '/flutter_flow/flutter_flow_util.dart';
import 'package:flutter/material.dart';

class NotificationSettingsModel extends FlutterFlowModel<NotificationSettingsWidget> {
  ///  State fields for stateful widgets in this page.

  final unfocusNode = FocusNode();
  
  // Notification types
  bool nutritionGoalAlerts = true;
  bool mealTimeReminders = true;
  bool calorieExcessWarnings = true;
  bool nutrientDeficiencyAlerts = true;
  
  // Meal reminder times
  TimeOfDay? breakfastTime;
  TimeOfDay? lunchTime;
  TimeOfDay? dinnerTime;
  TimeOfDay? snackTime;
  
  // Thresholds
  double calorieThreshold = 20.0; // 20% 초과 시 알림
  double nutrientThreshold = 20.0; // 20% 부족 시 알림
  
  // Notification frequency
  String notificationFrequency = 'immediate';
  
  // Quiet hours
  bool quietHoursEnabled = false;
  TimeOfDay? quietStartTime;
  TimeOfDay? quietEndTime;
  
  // Notification methods
  bool pushNotifications = true;
  bool emailNotifications = false;
  
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
