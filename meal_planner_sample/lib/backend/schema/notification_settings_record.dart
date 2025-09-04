import 'dart:async';

import 'package:collection/collection.dart';

import '/backend/schema/util/firestore_util.dart';

import 'index.dart';
import '/flutter_flow/flutter_flow_util.dart';

class NotificationSettingsRecord extends FirestoreRecord {
  NotificationSettingsRecord._(
    super.reference,
    super.data,
  ) {
    _initializeFields();
  }

  // "settings_id" field.
  String? _settingsId;
  String get settingsId => _settingsId ?? '';
  bool hasSettingsId() => _settingsId != null;

  // "user_id" field.
  String? _userId;
  String get userId => _userId ?? '';
  bool hasUserId() => _userId != null;

  // "nutrition_goal_alerts" field.
  bool? _nutritionGoalAlerts;
  bool get nutritionGoalAlerts => _nutritionGoalAlerts ?? false;
  bool hasNutritionGoalAlerts() => _nutritionGoalAlerts != null;

  // "meal_time_reminders" field.
  bool? _mealTimeReminders;
  bool get mealTimeReminders => _mealTimeReminders ?? false;
  bool hasMealTimeReminders() => _mealTimeReminders != null;

  // "calorie_excess_warnings" field.
  bool? _calorieExcessWarnings;
  bool get calorieExcessWarnings => _calorieExcessWarnings ?? false;
  bool hasCalorieExcessWarnings() => _calorieExcessWarnings != null;

  // "nutrient_deficiency_alerts" field.
  bool? _nutrientDeficiencyAlerts;
  bool get nutrientDeficiencyAlerts => _nutrientDeficiencyAlerts ?? false;
  bool hasNutrientDeficiencyAlerts() => _nutrientDeficiencyAlerts != null;

  // "meal_reminder_times" field.
  Map<String, dynamic>? _mealReminderTimes;
  Map<String, dynamic> get mealReminderTimes => _mealReminderTimes ?? const {};
  bool hasMealReminderTimes() => _mealReminderTimes != null;

  // "calorie_threshold" field.
  double? _calorieThreshold;
  double get calorieThreshold => _calorieThreshold ?? 0.0;
  bool hasCalorieThreshold() => _calorieThreshold != null;

  // "nutrient_thresholds" field.
  Map<String, dynamic>? _nutrientThresholds;
  Map<String, dynamic> get nutrientThresholds => _nutrientThresholds ?? const {};
  bool hasNutrientThresholds() => _nutrientThresholds != null;

  // "notification_frequency" field.
  String? _notificationFrequency;
  String get notificationFrequency => _notificationFrequency ?? '';
  bool hasNotificationFrequency() => _notificationFrequency != null;

  // "quiet_hours" field.
  Map<String, dynamic>? _quietHours;
  Map<String, dynamic> get quietHours => _quietHours ?? const {};
  bool hasQuietHours() => _quietHours != null;

  // "push_notifications" field.
  bool? _pushNotifications;
  bool get pushNotifications => _pushNotifications ?? true;
  bool hasPushNotifications() => _pushNotifications != null;

  // "email_notifications" field.
  bool? _emailNotifications;
  bool get emailNotifications => _emailNotifications ?? false;
  bool hasEmailNotifications() => _emailNotifications != null;

  // "created_at" field.
  DateTime? _createdAt;
  DateTime? get createdAt => _createdAt;
  bool hasCreatedAt() => _createdAt != null;

  // "updated_at" field.
  DateTime? _updatedAt;
  DateTime? get updatedAt => _updatedAt;
  bool hasUpdatedAt() => _updatedAt != null;

  void _initializeFields() {
    _settingsId = snapshotData['settings_id'] as String?;
    _userId = snapshotData['user_id'] as String?;
    _nutritionGoalAlerts = snapshotData['nutrition_goal_alerts'] as bool?;
    _mealTimeReminders = snapshotData['meal_time_reminders'] as bool?;
    _calorieExcessWarnings = snapshotData['calorie_excess_warnings'] as bool?;
    _nutrientDeficiencyAlerts = snapshotData['nutrient_deficiency_alerts'] as bool?;
    _mealReminderTimes = snapshotData['meal_reminder_times'] as Map<String, dynamic>?;
    _calorieThreshold = castToType<double>(snapshotData['calorie_threshold']);
    _nutrientThresholds = snapshotData['nutrient_thresholds'] as Map<String, dynamic>?;
    _notificationFrequency = snapshotData['notification_frequency'] as String?;
    _quietHours = snapshotData['quiet_hours'] as Map<String, dynamic>?;
    _pushNotifications = snapshotData['push_notifications'] as bool?;
    _emailNotifications = snapshotData['email_notifications'] as bool?;
    _createdAt = snapshotData['created_at'] as DateTime?;
    _updatedAt = snapshotData['updated_at'] as DateTime?;
  }

  static CollectionReference get collection =>
      FirebaseFirestore.instance.collection('notification_settings');

  static Stream<NotificationSettingsRecord> getDocument(DocumentReference ref) =>
      ref.snapshots().map((s) => NotificationSettingsRecord.fromSnapshot(s));

  static Future<NotificationSettingsRecord> getDocumentOnce(DocumentReference ref) =>
      ref.get().then((s) => NotificationSettingsRecord.fromSnapshot(s));

  static NotificationSettingsRecord fromSnapshot(DocumentSnapshot snapshot) => NotificationSettingsRecord._(
        snapshot.reference,
        mapFromFirestore(snapshot.data() as Map<String, dynamic>),
      );

  static NotificationSettingsRecord getDocumentFromData(
    Map<String, dynamic> data,
    DocumentReference reference,
  ) =>
      NotificationSettingsRecord._(reference, mapFromFirestore(data));

  @override
  String toString() =>
      'NotificationSettingsRecord(reference: ${reference.path}, data: $snapshotData)';

  @override
  int get hashCode => reference.path.hashCode;

  @override
  bool operator ==(other) =>
      other is NotificationSettingsRecord &&
      reference.path.hashCode == other.reference.path.hashCode;
}

Map<String, dynamic> createNotificationSettingsRecordData({
  String? settingsId,
  String? userId,
  bool? nutritionGoalAlerts,
  bool? mealTimeReminders,
  bool? calorieExcessWarnings,
  bool? nutrientDeficiencyAlerts,
  Map<String, dynamic>? mealReminderTimes,
  double? calorieThreshold,
  Map<String, dynamic>? nutrientThresholds,
  String? notificationFrequency,
  Map<String, dynamic>? quietHours,
  bool? pushNotifications,
  bool? emailNotifications,
  DateTime? createdAt,
  DateTime? updatedAt,
}) {
  final firestoreData = mapToFirestore(
    <String, dynamic>{
      'settings_id': settingsId,
      'user_id': userId,
      'nutrition_goal_alerts': nutritionGoalAlerts,
      'meal_time_reminders': mealTimeReminders,
      'calorie_excess_warnings': calorieExcessWarnings,
      'nutrient_deficiency_alerts': nutrientDeficiencyAlerts,
      'meal_reminder_times': mealReminderTimes,
      'calorie_threshold': calorieThreshold,
      'nutrient_thresholds': nutrientThresholds,
      'notification_frequency': notificationFrequency,
      'quiet_hours': quietHours,
      'push_notifications': pushNotifications,
      'email_notifications': emailNotifications,
      'created_at': createdAt,
      'updated_at': updatedAt,
    }.withoutNulls,
  );

  return firestoreData;
}

class NotificationSettingsRecordDocumentEquality implements Equality<NotificationSettingsRecord> {
  const NotificationSettingsRecordDocumentEquality();

  @override
  bool equals(NotificationSettingsRecord? e1, NotificationSettingsRecord? e2) {
    const mapEquality = MapEquality();
    return e1?.settingsId == e2?.settingsId &&
        e1?.userId == e2?.userId &&
        e1?.nutritionGoalAlerts == e2?.nutritionGoalAlerts &&
        e1?.mealTimeReminders == e2?.mealTimeReminders &&
        e1?.calorieExcessWarnings == e2?.calorieExcessWarnings &&
        e1?.nutrientDeficiencyAlerts == e2?.nutrientDeficiencyAlerts &&
        mapEquality.equals(e1?.mealReminderTimes, e2?.mealReminderTimes) &&
        e1?.calorieThreshold == e2?.calorieThreshold &&
        mapEquality.equals(e1?.nutrientThresholds, e2?.nutrientThresholds) &&
        e1?.notificationFrequency == e2?.notificationFrequency &&
        mapEquality.equals(e1?.quietHours, e2?.quietHours) &&
        e1?.pushNotifications == e2?.pushNotifications &&
        e1?.emailNotifications == e2?.emailNotifications &&
        e1?.createdAt == e2?.createdAt &&
        e1?.updatedAt == e2?.updatedAt;
  }

  @override
  int hash(NotificationSettingsRecord? e) => const ListEquality().hash([
        e?.settingsId,
        e?.userId,
        e?.nutritionGoalAlerts,
        e?.mealTimeReminders,
        e?.calorieExcessWarnings,
        e?.nutrientDeficiencyAlerts,
        e?.mealReminderTimes,
        e?.calorieThreshold,
        e?.nutrientThresholds,
        e?.notificationFrequency,
        e?.quietHours,
        e?.pushNotifications,
        e?.emailNotifications,
        e?.createdAt,
        e?.updatedAt
      ]);

  @override
  bool isValidKey(Object? o) => o is NotificationSettingsRecord;
}
