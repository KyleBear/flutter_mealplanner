import 'dart:async';

import 'package:collection/collection.dart';

import '/backend/schema/util/firestore_util.dart';

import 'index.dart';
import '/flutter_flow/flutter_flow_util.dart';

class RecommendationHistoryRecord extends FirestoreRecord {
  RecommendationHistoryRecord._(
    super.reference,
    super.data,
  ) {
    _initializeFields();
  }

  // "recommendation_id" field.
  String? _recommendationId;
  String get recommendationId => _recommendationId ?? '';
  bool hasRecommendationId() => _recommendationId != null;

  // "user_id" field.
  String? _userId;
  String get userId => _userId ?? '';
  bool hasUserId() => _userId != null;

  // "meal_type" field.
  String? _mealType;
  String get mealType => _mealType ?? '';
  bool hasMealType() => _mealType != null;

  // "recommended_meals" field.
  List<String>? _recommendedMeals;
  List<String> get recommendedMeals => _recommendedMeals ?? const [];
  bool hasRecommendedMeals() => _recommendedMeals != null;

  // "recommendation_reason" field.
  String? _recommendationReason;
  String get recommendationReason => _recommendationReason ?? '';
  bool hasRecommendationReason() => _recommendationReason != null;

  // "user_health_profile" field.
  Map<String, dynamic>? _userHealthProfile;
  Map<String, dynamic> get userHealthProfile => _userHealthProfile ?? const {};
  bool hasUserHealthProfile() => _userHealthProfile != null;

  // "nutrition_goals" field.
  Map<String, dynamic>? _nutritionGoals;
  Map<String, dynamic> get nutritionGoals => _nutritionGoals ?? const {};
  bool hasNutritionGoals() => _nutritionGoals != null;

  // "is_accepted" field.
  bool? _isAccepted;
  bool get isAccepted => _isAccepted ?? false;
  bool hasIsAccepted() => _isAccepted != null;

  // "feedback_score" field.
  int? _feedbackScore;
  int get feedbackScore => _feedbackScore ?? 0;
  bool hasFeedbackScore() => _feedbackScore != null;

  // "created_at" field.
  DateTime? _createdAt;
  DateTime? get createdAt => _createdAt;
  bool hasCreatedAt() => _createdAt != null;

  void _initializeFields() {
    _recommendationId = snapshotData['recommendation_id'] as String?;
    _userId = snapshotData['user_id'] as String?;
    _mealType = snapshotData['meal_type'] as String?;
    _recommendedMeals = getDataList(snapshotData['recommended_meals']);
    _recommendationReason = snapshotData['recommendation_reason'] as String?;
    _userHealthProfile = snapshotData['user_health_profile'] as Map<String, dynamic>?;
    _nutritionGoals = snapshotData['nutrition_goals'] as Map<String, dynamic>?;
    _isAccepted = snapshotData['is_accepted'] as bool?;
    _feedbackScore = castToType<int>(snapshotData['feedback_score']);
    _createdAt = snapshotData['created_at'] as DateTime?;
  }

  static CollectionReference get collection =>
      FirebaseFirestore.instance.collection('recommendation_history');

  static Stream<RecommendationHistoryRecord> getDocument(DocumentReference ref) =>
      ref.snapshots().map((s) => RecommendationHistoryRecord.fromSnapshot(s));

  static Future<RecommendationHistoryRecord> getDocumentOnce(DocumentReference ref) =>
      ref.get().then((s) => RecommendationHistoryRecord.fromSnapshot(s));

  static RecommendationHistoryRecord fromSnapshot(DocumentSnapshot snapshot) => RecommendationHistoryRecord._(
        snapshot.reference,
        mapFromFirestore(snapshot.data() as Map<String, dynamic>),
      );

  static RecommendationHistoryRecord getDocumentFromData(
    Map<String, dynamic> data,
    DocumentReference reference,
  ) =>
      RecommendationHistoryRecord._(reference, mapFromFirestore(data));

  @override
  String toString() =>
      'RecommendationHistoryRecord(reference: ${reference.path}, data: $snapshotData)';

  @override
  int get hashCode => reference.path.hashCode;

  @override
  bool operator ==(other) =>
      other is RecommendationHistoryRecord &&
      reference.path.hashCode == other.reference.path.hashCode;
}

Map<String, dynamic> createRecommendationHistoryRecordData({
  String? recommendationId,
  String? userId,
  String? mealType,
  List<String>? recommendedMeals,
  String? recommendationReason,
  Map<String, dynamic>? userHealthProfile,
  Map<String, dynamic>? nutritionGoals,
  bool? isAccepted,
  int? feedbackScore,
  DateTime? createdAt,
}) {
  final firestoreData = mapToFirestore(
    <String, dynamic>{
      'recommendation_id': recommendationId,
      'user_id': userId,
      'mealType': mealType,
      'recommended_meals': recommendedMeals,
      'recommendation_reason': recommendationReason,
      'user_health_profile': userHealthProfile,
      'nutrition_goals': nutritionGoals,
      'is_accepted': isAccepted,
      'feedback_score': feedbackScore,
      'created_at': createdAt,
    }.withoutNulls,
  );

  return firestoreData;
}

class RecommendationHistoryRecordDocumentEquality implements Equality<RecommendationHistoryRecord> {
  const RecommendationHistoryRecordDocumentEquality();

  @override
  bool equals(RecommendationHistoryRecord? e1, RecommendationHistoryRecord? e2) {
    const listEquality = ListEquality();
    const mapEquality = MapEquality();
    return e1?.recommendationId == e2?.recommendationId &&
        e1?.userId == e2?.userId &&
        e1?.mealType == e2?.mealType &&
        listEquality.equals(e1?.recommendedMeals, e2?.recommendedMeals) &&
        e1?.recommendationReason == e2?.recommendationReason &&
        mapEquality.equals(e1?.userHealthProfile, e2?.userHealthProfile) &&
        mapEquality.equals(e1?.nutritionGoals, e2?.nutritionGoals) &&
        e1?.isAccepted == e2?.isAccepted &&
        e1?.feedbackScore == e2?.feedbackScore &&
        e1?.createdAt == e2?.createdAt;
  }

  @override
  int hash(RecommendationHistoryRecord? e) => const ListEquality().hash([
        e?.recommendationId,
        e?.userId,
        e?.mealType,
        e?.recommendedMeals,
        e?.recommendationReason,
        e?.userHealthProfile,
        e?.nutritionGoals,
        e?.isAccepted,
        e?.feedbackScore,
        e?.createdAt
      ]);

  @override
  bool isValidKey(Object? o) => o is RecommendationHistoryRecord;
}
