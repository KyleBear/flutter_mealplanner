import 'dart:async';

import 'package:collection/collection.dart';

import '/backend/schema/util/firestore_util.dart';

import 'index.dart';
import '/flutter_flow/flutter_flow_util.dart';

class FoodItemRecord extends FirestoreRecord {
  FoodItemRecord._(
    super.reference,
    super.data,
  ) {
    _initializeFields();
  }

  // "food_id" field.
  String? _foodId;
  String get foodId => _foodId ?? '';
  bool hasFoodId() => _foodId != null;

  // "name" field.
  String? _name;
  String get name => _name ?? '';
  bool hasName() => _name != null;

  // "name_korean" field.
  String? _nameKorean;
  String get nameKorean => _nameKorean ?? '';
  bool hasNameKorean() => _nameKorean != null;

  // "category" field.
  String? _category;
  String get category => _category ?? '';
  bool hasCategory() => _category != null;

  // "subcategory" field.
  String? _subcategory;
  String get subcategory => _subcategory ?? '';
  bool hasSubcategory() => _subcategory != null;

  // "description" field.
  String? _description;
  String get description => _description ?? '';
  bool hasDescription() => _description != null;

  // "image_url" field.
  String? _imageUrl;
  String get imageUrl => _imageUrl ?? '';
  bool hasImageUrl() => _imageUrl != null;

  // "serving_size" field.
  double? _servingSize;
  double get servingSize => _servingSize ?? 0.0;
  bool hasServingSize() => _servingSize != null;

  // "serving_unit" field.
  String? _servingUnit;
  String get servingUnit => _servingUnit ?? '';
  bool hasServingUnit() => _servingUnit != null;

  // "calories_per_serving" field.
  double? _caloriesPerServing;
  double get caloriesPerServing => _caloriesPerServing ?? 0.0;
  bool hasCaloriesPerServing() => _caloriesPerServing != null;

  // "macro_nutrients" field.
  Map<String, dynamic>? _macroNutrients;
  Map<String, dynamic> get macroNutrients => _macroNutrients ?? const {};
  bool hasMacroNutrients() => _macroNutrients != null;

  // "micro_nutrients" field.
  Map<String, dynamic>? _microNutrients;
  Map<String, dynamic> get microNutrients => _microNutrients ?? const {};
  bool hasMicroNutrients() => _microNutrients != null;

  // "allergens" field.
  List<String>? _allergens;
  List<String> get allergens => _allergens ?? const [];
  bool hasAllergens() => _allergens != null;

  // "dietary_tags" field.
  List<String>? _dietaryTags;
  List<String> get dietaryTags => _dietaryTags ?? const [];
  bool hasDietaryTags() => _dietaryTags != null;

  // "is_verified" field.
  bool? _isVerified;
  bool get isVerified => _isVerified ?? false;
  bool hasIsVerified() => _isVerified != null;

  // "source" field.
  String? _source;
  String get source => _source ?? '';
  bool hasSource() => _source != null;

  // "popularity_score" field.
  double? _popularityScore;
  double get popularityScore => _popularityScore ?? 0.0;
  bool hasPopularityScore() => _popularityScore != null;

  // "created_at" field.
  DateTime? _createdAt;
  DateTime? get createdAt => _createdAt;
  bool hasCreatedAt() => _createdAt != null;

  // "updated_at" field.
  DateTime? _updatedAt;
  DateTime? get updatedAt => _updatedAt;
  bool hasUpdatedAt() => _updatedAt != null;

  void _initializeFields() {
    _foodId = snapshotData['food_id'] as String?;
    _name = snapshotData['name'] as String?;
    _nameKorean = snapshotData['name_korean'] as String?;
    _category = snapshotData['category'] as String?;
    _subcategory = snapshotData['subcategory'] as String?;
    _description = snapshotData['description'] as String?;
    _imageUrl = snapshotData['image_url'] as String?;
    _servingSize = castToType<double>(snapshotData['serving_size']);
    _servingUnit = snapshotData['serving_unit'] as String?;
    _caloriesPerServing = castToType<double>(snapshotData['calories_per_serving']);
    _macroNutrients = snapshotData['macro_nutrients'] as Map<String, dynamic>?;
    _microNutrients = snapshotData['micro_nutrients'] as Map<String, dynamic>?;
    _allergens = getDataList(snapshotData['allergens']);
    _dietaryTags = getDataList(snapshotData['dietary_tags']);
    _isVerified = snapshotData['is_verified'] as bool?;
    _source = snapshotData['source'] as String?;
    _popularityScore = castToType<double>(snapshotData['popularity_score']);
    _createdAt = snapshotData['created_at'] as DateTime?;
    _updatedAt = snapshotData['updated_at'] as DateTime?;
  }

  static CollectionReference get collection =>
      FirebaseFirestore.instance.collection('food_items');

  static Stream<FoodItemRecord> getDocument(DocumentReference ref) =>
      ref.snapshots().map((s) => FoodItemRecord.fromSnapshot(s));

  static Future<FoodItemRecord> getDocumentOnce(DocumentReference ref) =>
      ref.get().then((s) => FoodItemRecord.fromSnapshot(s));

  static FoodItemRecord fromSnapshot(DocumentSnapshot snapshot) => FoodItemRecord._(
        snapshot.reference,
        mapFromFirestore(snapshot.data() as Map<String, dynamic>),
      );

  static FoodItemRecord getDocumentFromData(
    Map<String, dynamic> data,
    DocumentReference reference,
  ) =>
      FoodItemRecord._(reference, mapFromFirestore(data));

  @override
  String toString() =>
      'FoodItemRecord(reference: ${reference.path}, data: $snapshotData)';

  @override
  int get hashCode => reference.path.hashCode;

  @override
  bool operator ==(other) =>
      other is FoodItemRecord &&
      reference.path.hashCode == other.reference.path.hashCode;
}

Map<String, dynamic> createFoodItemRecordData({
  String? foodId,
  String? name,
  String? nameKorean,
  String? category,
  String? subcategory,
  String? description,
  String? imageUrl,
  double? servingSize,
  String? servingUnit,
  double? caloriesPerServing,
  Map<String, dynamic>? macroNutrients,
  Map<String, dynamic>? microNutrients,
  List<String>? allergens,
  List<String>? dietaryTags,
  bool? isVerified,
  String? source,
  double? popularityScore,
  DateTime? createdAt,
  DateTime? updatedAt,
}) {
  final firestoreData = mapToFirestore(
    <String, dynamic>{
      'food_id': foodId,
      'name': name,
      'name_korean': nameKorean,
      'category': category,
      'subcategory': subcategory,
      'description': description,
      'image_url': imageUrl,
      'serving_size': servingSize,
      'serving_unit': servingUnit,
      'calories_per_serving': caloriesPerServing,
      'macro_nutrients': macroNutrients,
      'micro_nutrients': microNutrients,
      'allergens': allergens,
      'dietary_tags': dietaryTags,
      'is_verified': isVerified,
      'source': source,
      'popularity_score': popularityScore,
      'created_at': createdAt,
      'updated_at': updatedAt,
    }.withoutNulls,
  );

  return firestoreData;
}

class FoodItemRecordDocumentEquality implements Equality<FoodItemRecord> {
  const FoodItemRecordDocumentEquality();

  @override
  bool equals(FoodItemRecord? e1, FoodItemRecord? e2) {
    const listEquality = ListEquality();
    const mapEquality = MapEquality();
    return e1?.foodId == e2?.foodId &&
        e1?.name == e2?.name &&
        e1?.nameKorean == e2?.nameKorean &&
        e1?.category == e2?.category &&
        e1?.subcategory == e2?.subcategory &&
        e1?.description == e2?.description &&
        e1?.imageUrl == e2?.imageUrl &&
        e1?.servingSize == e2?.servingSize &&
        e1?.servingUnit == e2?.servingUnit &&
        e1?.caloriesPerServing == e2?.caloriesPerServing &&
        mapEquality.equals(e1?.macroNutrients, e2?.macroNutrients) &&
        mapEquality.equals(e1?.microNutrients, e2?.microNutrients) &&
        listEquality.equals(e1?.allergens, e2?.allergens) &&
        listEquality.equals(e1?.dietaryTags, e2?.dietaryTags) &&
        e1?.isVerified == e2?.isVerified &&
        e1?.source == e2?.source &&
        e1?.popularityScore == e2?.popularityScore &&
        e1?.createdAt == e2?.createdAt &&
        e1?.updatedAt == e2?.updatedAt;
  }

  @override
  int hash(FoodItemRecord? e) => const ListEquality().hash([
        e?.foodId,
        e?.name,
        e?.nameKorean,
        e?.category,
        e?.subcategory,
        e?.description,
        e?.imageUrl,
        e?.servingSize,
        e?.servingUnit,
        e?.caloriesPerServing,
        e?.macroNutrients,
        e?.microNutrients,
        e?.allergens,
        e?.dietaryTags,
        e?.isVerified,
        e?.source,
        e?.popularityScore,
        e?.createdAt,
        e?.updatedAt
      ]);

  @override
  bool isValidKey(Object? o) => o is FoodItemRecord;
}
