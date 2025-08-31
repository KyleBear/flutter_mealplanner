import 'dart:async';

import 'package:collection/collection.dart';

import '/backend/schema/util/firestore_util.dart';

import 'index.dart';
import '/flutter_flow/flutter_flow_util.dart';

class UsersRecord extends FirestoreRecord {
  UsersRecord._(
    super.reference,
    super.data,
  ) {
    _initializeFields();
  }

  // "email" field.
  String? _email;
  String get email => _email ?? '';
  bool hasEmail() => _email != null;

  // "display_name" field.
  String? _displayName;
  String get displayName => _displayName ?? '';
  bool hasDisplayName() => _displayName != null;

  // "photo_url" field.
  String? _photoUrl;
  String get photoUrl => _photoUrl ?? '';
  bool hasPhotoUrl() => _photoUrl != null;

  // "uid" field.
  String? _uid;
  String get uid => _uid ?? '';
  bool hasUid() => _uid != null;

  // "created_time" field.
  DateTime? _createdTime;
  DateTime? get createdTime => _createdTime;
  bool hasCreatedTime() => _createdTime != null;

  // "phone_number" field.
  String? _phoneNumber;
  String get phoneNumber => _phoneNumber ?? '';
  bool hasPhoneNumber() => _phoneNumber != null;

  // "diet" field.
  String? _diet;
  String get diet => _diet ?? '';
  bool hasDiet() => _diet != null;

  // "allergens" field.
  List<String>? _allergens;
  List<String> get allergens => _allergens ?? const [];
  bool hasAllergens() => _allergens != null;

  // "ingredient_dislikes" field.
  List<String>? _ingredientDislikes;
  List<String> get ingredientDislikes => _ingredientDislikes ?? const [];
  bool hasIngredientDislikes() => _ingredientDislikes != null;

  // "health_profile" field.
  Map<String, dynamic>? _healthProfile;
  Map<String, dynamic> get healthProfile => _healthProfile ?? const {};
  bool hasHealthProfile() => _healthProfile != null;

  // "dietary_restrictions" field.
  List<String>? _dietaryRestrictions;
  List<String> get dietaryRestrictions => _dietaryRestrictions ?? const [];
  bool hasDietaryRestrictions() => _dietaryRestrictions != null;

  // "preferences" field.
  Map<String, dynamic>? _preferences;
  Map<String, dynamic> get preferences => _preferences ?? const {};
  bool hasPreferences() => _preferences != null;

  void _initializeFields() {
    _email = snapshotData['email'] as String?;
    _displayName = snapshotData['display_name'] as String?;
    _photoUrl = snapshotData['photo_url'] as String?;
    _uid = snapshotData['uid'] as String?;
    _createdTime = snapshotData['created_time'] as DateTime?;
    _phoneNumber = snapshotData['phone_number'] as String?;
    _diet = snapshotData['diet'] as String?;
    _allergens = getDataList(snapshotData['allergens']);
    _ingredientDislikes = getDataList(snapshotData['ingredient_dislikes']);
    _healthProfile = snapshotData['health_profile'] as Map<String, dynamic>?;
    _dietaryRestrictions = getDataList(snapshotData['dietary_restrictions']);
    _preferences = snapshotData['preferences'] as Map<String, dynamic>?;
  }

  static CollectionReference get collection =>
      FirebaseFirestore.instance.collection('users');

  static Stream<UsersRecord> getDocument(DocumentReference ref) =>
      ref.snapshots().map((s) => UsersRecord.fromSnapshot(s));

  static Future<UsersRecord> getDocumentOnce(DocumentReference ref) =>
      ref.get().then((s) => UsersRecord.fromSnapshot(s));

  static UsersRecord fromSnapshot(DocumentSnapshot snapshot) => UsersRecord._(
        snapshot.reference,
        mapFromFirestore(snapshot.data() as Map<String, dynamic>),
      );

  static UsersRecord getDocumentFromData(
    Map<String, dynamic> data,
    DocumentReference reference,
  ) =>
      UsersRecord._(reference, mapFromFirestore(data));

  @override
  String toString() =>
      'UsersRecord(reference: ${reference.path}, data: $snapshotData)';

  @override
  int get hashCode => reference.path.hashCode;

  @override
  bool operator ==(other) =>
      other is UsersRecord &&
      reference.path.hashCode == other.reference.path.hashCode;
}

Map<String, dynamic> createUsersRecordData({
  String? email,
  String? displayName,
  String? photoUrl,
  String? uid,
  DateTime? createdTime,
  String? phoneNumber,
  String? diet,
  List<String>? allergens,
  List<String>? ingredientDislikes,
  Map<String, dynamic>? healthProfile,
  List<String>? dietaryRestrictions,
  Map<String, dynamic>? preferences,
}) {
  final firestoreData = mapToFirestore(
    <String, dynamic>{
      'email': email,
      'display_name': displayName,
      'photo_url': photoUrl,
      'uid': uid,
      'created_time': createdTime,
      'phone_number': phoneNumber,
      'diet': diet,
      'allergens': allergens,
      'ingredient_dislikes': ingredientDislikes,
      'health_profile': healthProfile,
      'dietary_restrictions': dietaryRestrictions,
      'preferences': preferences,
    }.withoutNulls,
  );

  return firestoreData;
}

class UsersRecordDocumentEquality implements Equality<UsersRecord> {
  const UsersRecordDocumentEquality();

  @override
  bool equals(UsersRecord? e1, UsersRecord? e2) {
    const listEquality = ListEquality();
    const mapEquality = MapEquality();
    return e1?.email == e2?.email &&
        e1?.displayName == e2?.displayName &&
        e1?.photoUrl == e2?.photoUrl &&
        e1?.uid == e2?.uid &&
        e1?.createdTime == e2?.createdTime &&
        e1?.phoneNumber == e2?.phoneNumber &&
        e1?.diet == e2?.diet &&
        listEquality.equals(e1?.allergens, e2?.allergens) &&
        listEquality.equals(e1?.ingredientDislikes, e2?.ingredientDislikes) &&
        mapEquality.equals(e1?.healthProfile, e2?.healthProfile) &&
        listEquality.equals(e1?.dietaryRestrictions, e2?.dietaryRestrictions) &&
        mapEquality.equals(e1?.preferences, e2?.preferences);
  }

  @override
  int hash(UsersRecord? e) => const ListEquality().hash([
        e?.email,
        e?.displayName,
        e?.photoUrl,
        e?.uid,
        e?.createdTime,
        e?.phoneNumber,
        e?.diet,
        e?.allergens,
        e?.ingredientDislikes,
        e?.healthProfile,
        e?.dietaryRestrictions,
        e?.preferences
      ]);

  @override
  bool isValidKey(Object? o) => o is UsersRecord;
}
