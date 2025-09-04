import 'dart:async';

import 'package:collection/collection.dart';

import '/backend/schema/util/firestore_util.dart';

import 'index.dart';
import '/flutter_flow/flutter_flow_util.dart';

class NutritionAnalysisRecord extends FirestoreRecord {
  NutritionAnalysisRecord._(
    super.reference,
    super.data,
  ) {
    _initializeFields();
  }

  // "analysis_id" field.
  String? _analysisId;
  String get analysisId => _analysisId ?? '';
  bool hasAnalysisId() => _analysisId != null;

  // "user_id" field.
  String? _userId;
  String get userId => _userId ?? '';
  bool hasUserId() => _userId != null;

  // "analysis_date" field.
  DateTime? _analysisDate;
  DateTime? get analysisDate => _analysisDate;
  bool hasAnalysisDate() => _analysisDate != null;

  // "total_calories" field.
  double? _totalCalories;
  double get totalCalories => _totalCalories ?? 0.0;
  bool hasTotalCalories() => _totalCalories != null;

  // "target_calories" field.
  double? _targetCalories;
  double get targetCalories => _targetCalories ?? 0.0;
  bool hasTargetCalories() => _targetCalories != null;

  // "macro_nutrients" field.
  Map<String, dynamic>? _macroNutrients;
  Map<String, dynamic> get macroNutrients => _macroNutrients ?? const {};
  bool hasMacroNutrients() => _macroNutrients != null;

  // "micro_nutrients" field.
  Map<String, dynamic>? _microNutrients;
  Map<String, dynamic> get microNutrients => _microNutrients ?? const {};
  bool hasMicroNutrients() => _microNutrients != null;

  // "meal_breakdown" field.
  Map<String, dynamic>? _mealBreakdown;
  Map<String, dynamic> get mealBreakdown => _mealBreakdown ?? const {};
  bool hasMealBreakdown() => _mealBreakdown != null;

  // "goal_achievement" field.
  Map<String, dynamic>? _goalAchievement;
  Map<String, dynamic> get goalAchievement => _goalAchievement ?? const {};
  bool hasGoalAchievement() => _goalAchievement != null;

  // "health_score" field.
  double? _healthScore;
  double get healthScore => _healthScore ?? 0.0;
  bool hasHealthScore() => _healthScore != null;

  // "created_at" field.
  DateTime? _createdAt;
  DateTime? get createdAt => _createdAt;
  bool hasCreatedAt() => _createdAt != null;

  // "updated_at" field.
  DateTime? _updatedAt;
  DateTime? get updatedAt => _updatedAt;
  bool hasUpdatedAt() => _updatedAt != null;

  void _initializeFields() {
    _analysisId = snapshotData['analysis_id'] as String?;
    _userId = snapshotData['user_id'] as String?;
    _analysisDate = snapshotData['analysis_date'] as DateTime?;
    _totalCalories = castToType<double>(snapshotData['total_calories']);
    _targetCalories = castToType<double>(snapshotData['target_calories']);
    _macroNutrients = snapshotData['macro_nutrients'] as Map<String, dynamic>?;
    _microNutrients = snapshotData['micro_nutrients'] as Map<String, dynamic>?;
    _mealBreakdown = snapshotData['meal_breakdown'] as Map<String, dynamic>?;
    _goalAchievement = snapshotData['goal_achievement'] as Map<String, dynamic>?;
    _healthScore = castToType<double>(snapshotData['health_score']);
    _createdAt = snapshotData['created_at'] as DateTime?;
    _updatedAt = snapshotData['updated_at'] as DateTime?;
  }

  static CollectionReference get collection =>
      FirebaseFirestore.instance.collection('nutrition_analysis');

  static Stream<NutritionAnalysisRecord> getDocument(DocumentReference ref) =>
      ref.snapshots().map((s) => NutritionAnalysisRecord.fromSnapshot(s));

  static Future<NutritionAnalysisRecord> getDocumentOnce(DocumentReference ref) =>
      ref.get().then((s) => NutritionAnalysisRecord.fromSnapshot(s));

  static NutritionAnalysisRecord fromSnapshot(DocumentSnapshot snapshot) => NutritionAnalysisRecord._(
        snapshot.reference,
        mapFromFirestore(snapshot.data() as Map<String, dynamic>),
      );

  static NutritionAnalysisRecord getDocumentFromData(
    Map<String, dynamic> data,
    DocumentReference reference,
  ) =>
      NutritionAnalysisRecord._(reference, mapFromFirestore(data));

  @override
  String toString() =>
      'NutritionAnalysisRecord(reference: ${reference.path}, data: $snapshotData)';

  @override
  int get hashCode => reference.path.hashCode;

  @override
  bool operator ==(other) =>
      other is NutritionAnalysisRecord &&
      reference.path.hashCode == other.reference.path.hashCode;
}

Map<String, dynamic> createNutritionAnalysisRecordData({
  String? analysisId,
  String? userId,
  DateTime? analysisDate,
  double? totalCalories,
  double? targetCalories,
  Map<String, dynamic>? macroNutrients,
  Map<String, dynamic>? microNutrients,
  Map<String, dynamic>? mealBreakdown,
  Map<String, dynamic>? goalAchievement,
  double? healthScore,
  DateTime? createdAt,
  DateTime? updatedAt,
}) {
  final firestoreData = mapToFirestore(
    <String, dynamic>{
      'analysis_id': analysisId,
      'user_id': userId,
      'analysis_date': analysisDate,
      'total_calories': totalCalories,
      'target_calories': targetCalories,
      'macro_nutrients': macroNutrients,
      'micro_nutrients': microNutrients,
      'meal_breakdown': mealBreakdown,
      'goal_achievement': goalAchievement,
      'health_score': healthScore,
      'created_at': createdAt,
      'updated_at': updatedAt,
    }.withoutNulls,
  );

  return firestoreData;
}

class NutritionAnalysisRecordDocumentEquality implements Equality<NutritionAnalysisRecord> {
  const NutritionAnalysisRecordDocumentEquality();

  @override
  bool equals(NutritionAnalysisRecord? e1, NutritionAnalysisRecord? e2) {
    const mapEquality = MapEquality();
    return e1?.analysisId == e2?.analysisId &&
        e1?.userId == e2?.userId &&
        e1?.analysisDate == e2?.analysisDate &&
        e1?.totalCalories == e2?.totalCalories &&
        e1?.targetCalories == e2?.targetCalories &&
        mapEquality.equals(e1?.macroNutrients, e2?.macroNutrients) &&
        mapEquality.equals(e1?.microNutrients, e2?.microNutrients) &&
        mapEquality.equals(e1?.mealBreakdown, e2?.mealBreakdown) &&
        mapEquality.equals(e1?.goalAchievement, e2?.goalAchievement) &&
        e1?.healthScore == e2?.healthScore &&
        e1?.createdAt == e2?.createdAt &&
        e1?.updatedAt == e2?.updatedAt;
  }

  @override
  int hash(NutritionAnalysisRecord? e) => const ListEquality().hash([
        e?.analysisId,
        e?.userId,
        e?.analysisDate,
        e?.totalCalories,
        e?.targetCalories,
        e?.macroNutrients,
        e?.microNutrients,
        e?.mealBreakdown,
        e?.goalAchievement,
        e?.healthScore,
        e?.createdAt,
        e?.updatedAt
      ]);

  @override
  bool isValidKey(Object? o) => o is NutritionAnalysisRecord;
}
