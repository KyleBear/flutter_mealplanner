import 'dart:async';

import 'package:collection/collection.dart';

import '/backend/schema/util/firestore_util.dart';

import 'index.dart';
import '/flutter_flow/flutter_flow_util.dart';

class HealthStatsRecord extends FirestoreRecord {
  HealthStatsRecord._(
    super.reference,
    super.data,
  ) {
    _initializeFields();
  }

  // "stats_id" field.
  String? _statsId;
  String get statsId => _statsId ?? '';
  bool hasStatsId() => _statsId != null;

  // "user_id" field.
  String? _userId;
  String get userId => _userId ?? '';
  bool hasUserId() => _userId != null;

  // "record_date" field.
  DateTime? _recordDate;
  DateTime? get recordDate => _recordDate;
  bool hasRecordDate() => _recordDate != null;

  // "weight" field.
  double? _weight;
  double get weight => _weight ?? 0.0;
  bool hasWeight() => _weight != null;

  // "body_fat_percentage" field.
  double? _bodyFatPercentage;
  double get bodyFatPercentage => _bodyFatPercentage ?? 0.0;
  bool hasBodyFatPercentage() => _bodyFatPercentage != null;

  // "muscle_mass" field.
  double? _muscleMass;
  double get muscleMass => _muscleMass ?? 0.0;
  bool hasMuscleMass() => _muscleMass != null;

  // "bmi" field.
  double? _bmi;
  double get bmi => _bmi ?? 0.0;
  bool hasBmi() => _bmi != null;

  // "daily_steps" field.
  int? _dailySteps;
  int get dailySteps => _dailySteps ?? 0;
  bool hasDailySteps() => _dailySteps != null;

  // "calories_burned" field.
  double? _caloriesBurned;
  double get caloriesBurned => _caloriesBurned ?? 0.0;
  bool hasCaloriesBurned() => _caloriesBurned != null;

  // "exercise_minutes" field.
  int? _exerciseMinutes;
  int get exerciseMinutes => _exerciseMinutes ?? 0;
  bool hasExerciseMinutes() => _exerciseMinutes != null;

  // "sleep_hours" field.
  double? _sleepHours;
  double get sleepHours => _sleepHours ?? 0.0;
  bool hasSleepHours() => _sleepHours != null;

  // "water_intake" field.
  double? _waterIntake;
  double get waterIntake => _waterIntake ?? 0.0;
  bool hasWaterIntake() => _waterIntake != null;

  // "mood_score" field.
  int? _moodScore;
  int get moodScore => _moodScore ?? 0;
  bool hasMoodScore() => _moodScore != null;

  // "stress_level" field.
  int? _stressLevel;
  int get stressLevel => _stressLevel ?? 0;
  bool hasStressLevel() => _stressLevel != null;

  // "notes" field.
  String? _notes;
  String get notes => _notes ?? '';
  bool hasNotes() => _notes != null;

  // "created_at" field.
  DateTime? _createdAt;
  DateTime? get createdAt => _createdAt;
  bool hasCreatedAt() => _createdAt != null;

  // "updated_at" field.
  DateTime? _updatedAt;
  DateTime? get updatedAt => _updatedAt;
  bool hasUpdatedAt() => _updatedAt != null;

  void _initializeFields() {
    _statsId = snapshotData['stats_id'] as String?;
    _userId = snapshotData['user_id'] as String?;
    _recordDate = snapshotData['record_date'] as DateTime?;
    _weight = castToType<double>(snapshotData['weight']);
    _bodyFatPercentage = castToType<double>(snapshotData['body_fat_percentage']);
    _muscleMass = castToType<double>(snapshotData['muscle_mass']);
    _bmi = castToType<double>(snapshotData['bmi']);
    _dailySteps = castToType<int>(snapshotData['daily_steps']);
    _caloriesBurned = castToType<double>(snapshotData['calories_burned']);
    _exerciseMinutes = castToType<int>(snapshotData['exercise_minutes']);
    _sleepHours = castToType<double>(snapshotData['sleep_hours']);
    _waterIntake = castToType<double>(snapshotData['water_intake']);
    _moodScore = castToType<int>(snapshotData['mood_score']);
    _stressLevel = castToType<int>(snapshotData['stress_level']);
    _notes = snapshotData['notes'] as String?;
    _createdAt = snapshotData['created_at'] as DateTime?;
    _updatedAt = snapshotData['updated_at'] as DateTime?;
  }

  static CollectionReference get collection =>
      FirebaseFirestore.instance.collection('health_stats');

  static Stream<HealthStatsRecord> getDocument(DocumentReference ref) =>
      ref.snapshots().map((s) => HealthStatsRecord.fromSnapshot(s));

  static Future<HealthStatsRecord> getDocumentOnce(DocumentReference ref) =>
      ref.get().then((s) => HealthStatsRecord.fromSnapshot(s));

  static HealthStatsRecord fromSnapshot(DocumentSnapshot snapshot) => HealthStatsRecord._(
        snapshot.reference,
        mapFromFirestore(snapshot.data() as Map<String, dynamic>),
      );

  static HealthStatsRecord getDocumentFromData(
    Map<String, dynamic> data,
    DocumentReference reference,
  ) =>
      HealthStatsRecord._(reference, mapFromFirestore(data));

  @override
  String toString() =>
      'HealthStatsRecord(reference: ${reference.path}, data: $snapshotData)';

  @override
  int get hashCode => reference.path.hashCode;

  @override
  bool operator ==(other) =>
      other is HealthStatsRecord &&
      reference.path.hashCode == other.reference.path.hashCode;
}

Map<String, dynamic> createHealthStatsRecordData({
  String? statsId,
  String? userId,
  DateTime? recordDate,
  double? weight,
  double? bodyFatPercentage,
  double? muscleMass,
  double? bmi,
  int? dailySteps,
  double? caloriesBurned,
  int? exerciseMinutes,
  double? sleepHours,
  double? waterIntake,
  int? moodScore,
  int? stressLevel,
  String? notes,
  DateTime? createdAt,
  DateTime? updatedAt,
}) {
  final firestoreData = mapToFirestore(
    <String, dynamic>{
      'stats_id': statsId,
      'user_id': userId,
      'record_date': recordDate,
      'weight': weight,
      'body_fat_percentage': bodyFatPercentage,
      'muscle_mass': muscleMass,
      'bmi': bmi,
      'daily_steps': dailySteps,
      'calories_burned': caloriesBurned,
      'exercise_minutes': exerciseMinutes,
      'sleep_hours': sleepHours,
      'water_intake': waterIntake,
      'mood_score': moodScore,
      'stress_level': stressLevel,
      'notes': notes,
      'created_at': createdAt,
      'updated_at': updatedAt,
    }.withoutNulls,
  );

  return firestoreData;
}

class HealthStatsRecordDocumentEquality implements Equality<HealthStatsRecord> {
  const HealthStatsRecordDocumentEquality();

  @override
  bool equals(HealthStatsRecord? e1, HealthStatsRecord? e2) {
    return e1?.statsId == e2?.statsId &&
        e1?.userId == e2?.userId &&
        e1?.recordDate == e2?.recordDate &&
        e1?.weight == e2?.weight &&
        e1?.bodyFatPercentage == e2?.bodyFatPercentage &&
        e1?.muscleMass == e2?.muscleMass &&
        e1?.bmi == e2?.bmi &&
        e1?.dailySteps == e2?.dailySteps &&
        e1?.caloriesBurned == e2?.caloriesBurned &&
        e1?.exerciseMinutes == e2?.exerciseMinutes &&
        e1?.sleepHours == e2?.sleepHours &&
        e1?.waterIntake == e2?.waterIntake &&
        e1?.moodScore == e2?.moodScore &&
        e1?.stressLevel == e2?.stressLevel &&
        e1?.notes == e2?.notes &&
        e1?.createdAt == e2?.createdAt &&
        e1?.updatedAt == e2?.updatedAt;
  }

  @override
  int hash(HealthStatsRecord? e) => const ListEquality().hash([
        e?.statsId,
        e?.userId,
        e?.recordDate,
        e?.weight,
        e?.bodyFatPercentage,
        e?.muscleMass,
        e?.bmi,
        e?.dailySteps,
        e?.caloriesBurned,
        e?.exerciseMinutes,
        e?.sleepHours,
        e?.waterIntake,
        e?.moodScore,
        e?.stressLevel,
        e?.notes,
        e?.createdAt,
        e?.updatedAt
      ]);

  @override
  bool isValidKey(Object? o) => o is HealthStatsRecord;
}
