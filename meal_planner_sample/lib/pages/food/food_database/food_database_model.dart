import '/flutter_flow/flutter_flow_util.dart';
import 'package:flutter/material.dart';

class FoodDatabaseModel extends FlutterFlowModel<FoodDatabaseWidget> {
  ///  State fields for stateful widgets in this page.

  final unfocusNode = FocusNode();
  
  // Search
  FocusNode? searchFocusNode;
  TextEditingController? searchController;
  String? Function(BuildContext, String?)? searchControllerValidator;
  String searchQuery = '';
  
  // Categories
  List<String> categories = ['전체', '과일', '채소', '육류', '해산물', '곡물', '유제품', '견과류', '음료'];
  String selectedCategory = '전체';
  
  // Food data
  List<FoodItemRecord> allFoods = [];
  List<FoodItemRecord> filteredFoods = [];
  
  // Filters
  double minCalories = 0.0;
  double maxCalories = 0.0;
  List<String> selectedAllergens = [];
  List<String> allergens = ['우유', '계란', '견과류', '땅콩', '대두', '밀', '생선', '조개류'];
  String sortBy = 'name';
  
  // Filter controllers
  FocusNode? minCaloriesFocusNode;
  TextEditingController? minCaloriesController;
  FocusNode? maxCaloriesFocusNode;
  TextEditingController? maxCaloriesController;
  
  // Loading state
  bool isLoading = false;

  /// Initialization and disposal methods.

  @override
  void initState(BuildContext context) {
    searchController = TextEditingController();
    minCaloriesController = TextEditingController();
    maxCaloriesController = TextEditingController();
  }

  @override
  void dispose() {
    unfocusNode.dispose();
    searchFocusNode?.dispose();
    searchController?.dispose();
    minCaloriesFocusNode?.dispose();
    minCaloriesController?.dispose();
    maxCaloriesFocusNode?.dispose();
    maxCaloriesController?.dispose();
  }

  /// Action blocks are added here.

  /// Additional helper methods are added here.
}
