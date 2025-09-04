import 'dart:async';

import 'package:collection/collection.dart';

import '/backend/schema/util/firestore_util.dart';

import 'index.dart';
import '/flutter_flow/flutter_flow_util.dart';

class NutritionGoalsRecord extends FirestoreRecord {
  NutritionGoalsRecord._(
    super.reference,
    super.data,
  ) {
    _initializeFields();
  }

  // "goal_id" field.
  String? _goalId;
  String get goalId => _goalId ?? '';
  bool hasGoalId() => _goalId != null;

  // "user_id" field.
  String? _userId;
  String get userId => _userId ?? '';
  bool hasUserId() => _userId != null;

  // "target_date" field.
  DateTime? _targetDate;
  DateTime? get targetDate => _targetDate;
  bool hasTargetDate() => _targetDate != null;

  // "daily_calories" field.
  double? _dailyCalories;
  double get dailyCalories => _dailyCalories ?? 0.0;
  bool hasDailyCalories() => _dailyCalories != null;

  // "macro_ratios" field.
  Map<String, dynamic>? _macroRatios;
  Map<String, dynamic> get macroRatios => _macroRatios ?? const {};
  bool hasMacroRatios() => _macroRatios != null;

  // "micro_nutrients" field.
  Map<String, dynamic>? _microNutrients;
  Map<String, dynamic> get microNutrients => _microNutrients ?? const {};
  bool hasMicroNutrients() => _microNutrients != null;

  // "is_active" field.
  bool? _isActive;
  bool get isActive => _isActive ?? true;
  bool hasIsActive() => _isActive != null;

  // "created_at" field.
  DateTime? _createdAt;
  DateTime? get createdAt => _createdAt;
  bool hasCreatedAt() => _createdAt != null;

  // "updated_at" field.
  DateTime? _updatedAt;
  DateTime? get updatedAt => _updatedAt;
  bool hasUpdatedAt() => _updatedAt != null;

  void _initializeFields() {
    _goalId = snapshotData['goal_id'] as String?;
    _userId = snapshotData['user_id'] as String?;
    _targetDate = snapshotData['target_date'] as DateTime?;
    _dailyCalories = castToType<double>(snapshotData['daily_calories']);
    _macroRatios = snapshotData['macro_ratios'] as Map<String, dynamic>?;
    _microNutrients = snapshotData['micro_nutrients'] as Map<String, dynamic>?;
    _isActive = snapshotData['is_active'] as bool?;
    _createdAt = snapshotData['created_at'] as DateTime?;
    _updatedAt = snapshotData['updated_at'] as DateTime?;
  }

  static CollectionReference get collection =>
      FirebaseFirestore.instance.collection('nutrition_goals');

  static Stream<NutritionGoalsRecord> getDocument(DocumentReference ref) =>
      ref.snapshots().map((s) => NutritionGoalsRecord.fromSnapshot(s));

  static Future<NutritionGoalsRecord> getDocumentOnce(DocumentReference ref) =>
      ref.get().then((s) => NutritionGoalsRecord.fromSnapshot(s));

  static NutritionGoalsRecord fromSnapshot(DocumentSnapshot snapshot) => NutritionGoalsRecord._(
        snapshot.reference,
        mapFromFirestore(snapshot.data() as Map<String, dynamic>),
      );

  static NutritionGoalsRecord getDocumentFromData(
    Map<String, dynamic> data,
    DocumentReference reference,
  ) =>
      NutritionGoalsRecord._(reference, mapFromFirestore(data));

  @override
  String toString() =>
      'NutritionGoalsRecord(reference: ${reference.path}, data: $snapshotData)';

  @override
  int get hashCode => reference.path.hashCode;

  @override
  bool operator ==(other) =>
      other is NutritionGoalsRecord &&
      reference.path.hashCode == other.reference.path.hashCode;
}

Map<String, dynamic> createNutritionGoalsRecordData({
  String? goalId,
  String? userId,
  DateTime? targetDate,
  double? dailyCalories,
  Map<String, dynamic>? macroRatios,
  Map<String, dynamic>? microNutrients,
  bool? isActive,
  DateTime? createdAt,
  DateTime? updatedAt,
}) {
  final firestoreData = mapToFirestore(
    <String, dynamic>{
      'goal_id': goalId,
      'user_id': userId,
      'target_date': targetDate,
      'daily_calories': dailyCalories,
      'macro_ratios': macroRatios,
      'micro_nutrients': microNutrients,
      'is_active': isActive,
      'created_at': createdAt,
      'updated_at': updatedAt,
    }.withoutNulls,
  );

  return firestoreData;
}

class NutritionGoalsRecordDocumentEquality implements Equality<NutritionGoalsRecord> {
  const NutritionGoalsRecordDocumentEquality();

  @override
  bool equals(NutritionGoalsRecord? e1, NutritionGoalsRecord? e2) {
    const mapEquality = MapEquality();
    return e1?.goalId == e2?.goalId &&
        e1?.userId == e2?.userId &&
        e1?.targetDate == e2?.targetDate &&
        e1?.dailyCalories == e2?.dailyCalories &&
        mapEquality.equals(e1?.macroRatios, e2?.macroRatios) &&
        mapEquality.equals(e1?.microNutrients, e2?.microNutrients) &&
        e1?.isActive == e2?.isActive &&
        e1?.createdAt == e2?.createdAt &&
        e1?.updatedAt == e2?.updatedAt;
  }

  @override
  int hash(NutritionGoalsRecord? e) => const ListEquality().hash([
        e?.goalId,
        e?.userId,
        e?.targetDate,
        e?.dailyCalories,
        e?.macroRatios,
        e?.microNutrients,
        e?.isActive,
        e?.createdAt,
        e?.updatedAt
      ]);

  @override
  bool isValidKey(Object? o) => o is NutritionGoalsRecord;
}
