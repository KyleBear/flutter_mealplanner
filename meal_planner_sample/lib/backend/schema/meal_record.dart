import 'dart:async';

import 'package:collection/collection.dart';

import '/backend/schema/util/firestore_util.dart';

import 'index.dart';
import '/flutter_flow/flutter_flow_util.dart';

class MealRecord extends FirestoreRecord {
  MealRecord._(
    super.reference,
    super.data,
  ) {
    _initializeFields();
  }

  // "meal_record_id" field.
  String? _mealRecordId;
  String get mealRecordId => _mealRecordId ?? '';
  bool hasMealRecordId() => _mealRecordId != null;

  // "user_id" field.
  String? _userId;
  String get userId => _userId ?? '';
  bool hasUserId() => _userId != null;

  // "meal_date" field.
  DateTime? _mealDate;
  DateTime? get mealDate => _mealDate;
  bool hasMealDate() => _mealDate != null;

  // "meal_type" field.
  String? _mealType;
  String get mealType => _mealType ?? '';
  bool hasMealType() => _mealType != null;

  // "meal_time" field.
  DateTime? _mealTime;
  DateTime? get mealTime => _mealTime;
  bool hasMealTime() => _mealTime != null;

  // "food_items" field.
  List<Map<String, dynamic>>? _foodItems;
  List<Map<String, dynamic>> get foodItems => _foodItems ?? const [];
  bool hasFoodItems() => _foodItems != null;

  // "total_calories" field.
  double? _totalCalories;
  double get totalCalories => _totalCalories ?? 0.0;
  bool hasTotalCalories() => _totalCalories != null;

  // "total_nutrition" field.
  Map<String, dynamic>? _totalNutrition;
  Map<String, dynamic> get totalNutrition => _totalNutrition ?? const {};
  bool hasTotalNutrition() => _totalNutrition != null;

  // "meal_image" field.
  String? _mealImage;
  String get mealImage => _mealImage ?? '';
  bool hasMealImage() => _mealImage != null;

  // "notes" field.
  String? _notes;
  String get notes => _notes ?? '';
  bool hasNotes() => _notes != null;

  // "is_verified" field.
  bool? _isVerified;
  bool get isVerified => _isVerified ?? false;
  bool hasIsVerified() => _isVerified != null;

  // "created_at" field.
  DateTime? _createdAt;
  DateTime? get createdAt => _createdAt;
  bool hasCreatedAt() => _createdAt != null;

  // "updated_at" field.
  DateTime? _updatedAt;
  DateTime? get updatedAt => _updatedAt;
  bool hasUpdatedAt() => _updatedAt != null;

  void _initializeFields() {
    _mealRecordId = snapshotData['meal_record_id'] as String?;
    _userId = snapshotData['user_id'] as String?;
    _mealDate = snapshotData['meal_date'] as DateTime?;
    _mealType = snapshotData['meal_type'] as String?;
    _mealTime = snapshotData['meal_time'] as DateTime?;
    _foodItems = getDataList(snapshotData['food_items']);
    _totalCalories = castToType<double>(snapshotData['total_calories']);
    _totalNutrition = snapshotData['total_nutrition'] as Map<String, dynamic>?;
    _mealImage = snapshotData['meal_image'] as String?;
    _notes = snapshotData['notes'] as String?;
    _isVerified = snapshotData['is_verified'] as bool?;
    _createdAt = snapshotData['created_at'] as DateTime?;
    _updatedAt = snapshotData['updated_at'] as DateTime?;
  }

  static CollectionReference get collection =>
      FirebaseFirestore.instance.collection('meal_records');

  static Stream<MealRecord> getDocument(DocumentReference ref) =>
      ref.snapshots().map((s) => MealRecord.fromSnapshot(s));

  static Future<MealRecord> getDocumentOnce(DocumentReference ref) =>
      ref.get().then((s) => MealRecord.fromSnapshot(s));

  static MealRecord fromSnapshot(DocumentSnapshot snapshot) => MealRecord._(
        snapshot.reference,
        mapFromFirestore(snapshot.data() as Map<String, dynamic>),
      );

  static MealRecord getDocumentFromData(
    Map<String, dynamic> data,
    DocumentReference reference,
  ) =>
      MealRecord._(reference, mapFromFirestore(data));

  @override
  String toString() =>
      'MealRecord(reference: ${reference.path}, data: $snapshotData)';

  @override
  int get hashCode => reference.path.hashCode;

  @override
  bool operator ==(other) =>
      other is MealRecord &&
      reference.path.hashCode == other.reference.path.hashCode;
}

Map<String, dynamic> createMealRecordData({
  String? mealRecordId,
  String? userId,
  DateTime? mealDate,
  String? mealType,
  DateTime? mealTime,
  List<Map<String, dynamic>>? foodItems,
  double? totalCalories,
  Map<String, dynamic>? totalNutrition,
  String? mealImage,
  String? notes,
  bool? isVerified,
  DateTime? createdAt,
  DateTime? updatedAt,
}) {
  final firestoreData = mapToFirestore(
    <String, dynamic>{
      'meal_record_id': mealRecordId,
      'user_id': userId,
      'meal_date': mealDate,
      'meal_type': mealType,
      'meal_time': mealTime,
      'food_items': foodItems,
      'total_calories': totalCalories,
      'total_nutrition': totalNutrition,
      'meal_image': mealImage,
      'notes': notes,
      'is_verified': isVerified,
      'created_at': createdAt,
      'updated_at': updatedAt,
    }.withoutNulls,
  );

  return firestoreData;
}

class MealRecordDocumentEquality implements Equality<MealRecord> {
  const MealRecordDocumentEquality();

  @override
  bool equals(MealRecord? e1, MealRecord? e2) {
    const listEquality = ListEquality();
    const mapEquality = MapEquality();
    return e1?.mealRecordId == e2?.mealRecordId &&
        e1?.userId == e2?.userId &&
        e1?.mealDate == e2?.mealDate &&
        e1?.mealType == e2?.mealType &&
        e1?.mealTime == e2?.mealTime &&
        listEquality.equals(e1?.foodItems, e2?.foodItems) &&
        e1?.totalCalories == e2?.totalCalories &&
        mapEquality.equals(e1?.totalNutrition, e2?.totalNutrition) &&
        e1?.mealImage == e2?.mealImage &&
        e1?.notes == e2?.notes &&
        e1?.isVerified == e2?.isVerified &&
        e1?.createdAt == e2?.createdAt &&
        e1?.updatedAt == e2?.updatedAt;
  }

  @override
  int hash(MealRecord? e) => const ListEquality().hash([
        e?.mealRecordId,
        e?.userId,
        e?.mealDate,
        e?.mealType,
        e?.mealTime,
        e?.foodItems,
        e?.totalCalories,
        e?.totalNutrition,
        e?.mealImage,
        e?.notes,
        e?.isVerified,
        e?.createdAt,
        e?.updatedAt
      ]);

  @override
  bool isValidKey(Object? o) => o is MealRecord;
}
