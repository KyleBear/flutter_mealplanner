import '/auth/firebase_auth/auth_util.dart';
import '/backend/backend.dart';
import '/flutter_flow/flutter_flow_theme.dart';
import '/flutter_flow/flutter_flow_util.dart';
import '/flutter_flow/flutter_flow_widgets.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:provider/provider.dart';
import 'food_database_model.dart';
export 'food_database_model.dart';

class FoodDatabaseWidget extends StatefulWidget {
  const FoodDatabaseWidget({super.key});

  @override
  State<FoodDatabaseWidget> createState() => _FoodDatabaseWidgetState();
}

class _FoodDatabaseWidgetState extends State<FoodDatabaseWidget> {
  late FoodDatabaseModel _model;

  final scaffoldKey = GlobalKey<ScaffoldState>();

  @override
  void initState() {
    super.initState();
    _model = createModel(context, () => FoodDatabaseModel());

    WidgetsBinding.instance.addPostFrameCallback((_) => setState(() {}));
  }

  @override
  void dispose() {
    _model.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    if (isiOS) {
      SystemChrome.setSystemUIOverlayStyle(
        SystemUiOverlayStyle(
          statusBarBrightness: Theme.of(context).brightness,
          systemNavigationBarColor: Colors.white,
          systemNavigationBarIconBrightness: Theme.of(context).brightness,
        ),
      );
    }

    return GestureDetector(
      onTap: () => FocusScope.of(context).unfocus(),
      child: Scaffold(
        key: scaffoldKey,
        backgroundColor: FlutterFlowTheme.of(context).primaryBackground,
        appBar: AppBar(
          backgroundColor: FlutterFlowTheme.of(context).primaryBackground,
          automaticallyImplyLeading: false,
          leading: IconButton(
            icon: Icon(
              Icons.arrow_back_rounded,
              color: FlutterFlowTheme.of(context).primaryText,
              size: 24.0,
            ),
            onPressed: () async {
              context.pop();
            },
          ),
          title: Text(
            '식품 데이터베이스',
            style: FlutterFlowTheme.of(context).headlineMedium.override(
                  fontFamily: 'Inter',
                  letterSpacing: 0.0,
                ),
          ),
          actions: [
            IconButton(
              icon: Icon(
                Icons.filter_list_rounded,
                color: FlutterFlowTheme.of(context).primaryText,
                size: 24.0,
              ),
              onPressed: () async {
                await _showFilterBottomSheet();
              },
            ),
          ],
          centerTitle: false,
          elevation: 0.0,
        ),
        body: SafeArea(
          top: true,
          child: Column(
            mainAxisSize: MainAxisSize.max,
            children: [
              // 검색 바
              _buildSearchBar(),
              
              // 카테고리 필터
              _buildCategoryFilter(),
              
              // 식품 목록
              Expanded(
                child: _buildFoodList(),
              ),
            ],
          ),
        ),
      ),
    );
  }

  Widget _buildSearchBar() {
    return Container(
      padding: const EdgeInsetsDirectional.fromSTEB(16.0, 16.0, 16.0, 8.0),
      child: TextFormField(
        controller: _model.searchController,
        focusNode: _model.searchFocusNode,
        onChanged: (value) => _performSearch(value),
        decoration: InputDecoration(
          hintText: '식품명을 검색하세요...',
          hintStyle: FlutterFlowTheme.of(context).bodyMedium.override(
                fontFamily: 'Inter',
                letterSpacing: 0.0,
              ),
          prefixIcon: Icon(
            Icons.search,
            color: FlutterFlowTheme.of(context).secondaryText,
            size: 24.0,
          ),
          suffixIcon: _model.searchController.text.isNotEmpty
              ? IconButton(
                  icon: Icon(
                    Icons.clear,
                    color: FlutterFlowTheme.of(context).secondaryText,
                    size: 20.0,
                  ),
                  onPressed: () {
                    _model.searchController.clear();
                    _performSearch('');
                  },
                )
              : null,
          filled: true,
          fillColor: FlutterFlowTheme.of(context).secondaryBackground,
          border: OutlineInputBorder(
            borderRadius: BorderRadius.circular(12.0),
            borderSide: BorderSide(
              color: FlutterFlowTheme.of(context).alternate,
              width: 1.0,
            ),
          ),
          enabledBorder: OutlineInputBorder(
            borderRadius: BorderRadius.circular(12.0),
            borderSide: BorderSide(
              color: FlutterFlowTheme.of(context).alternate,
              width: 1.0,
            ),
          ),
          focusedBorder: OutlineInputBorder(
            borderRadius: BorderRadius.circular(12.0),
            borderSide: BorderSide(
              color: FlutterFlowTheme.of(context).primary,
              width: 2.0,
            ),
          ),
        ),
        style: FlutterFlowTheme.of(context).bodyMedium.override(
              fontFamily: 'Inter',
              letterSpacing: 0.0,
            ),
      ),
    );
  }

  Widget _buildCategoryFilter() {
    return Container(
      height: 50.0,
      padding: const EdgeInsetsDirectional.fromSTEB(16.0, 0.0, 16.0, 8.0),
      child: ListView.builder(
        scrollDirection: Axis.horizontal,
        itemCount: _model.categories.length,
        itemBuilder: (context, index) {
          final category = _model.categories[index];
          final isSelected = _model.selectedCategory == category;
          
          return Padding(
            padding: const EdgeInsetsDirectional.fromSTEB(0.0, 0.0, 8.0, 0.0),
            child: FilterChip(
              label: Text(
                category,
                style: FlutterFlowTheme.of(context).bodyMedium.override(
                      fontFamily: 'Inter',
                      letterSpacing: 0.0,
                      color: isSelected 
                          ? Colors.white
                          : FlutterFlowTheme.of(context).primaryText,
                    ),
              ),
              selected: isSelected,
              onSelected: (selected) {
                setState(() {
                  _model.selectedCategory = selected ? category : '';
                });
                _filterFoods();
              },
              backgroundColor: FlutterFlowTheme.of(context).secondaryBackground,
              selectedColor: FlutterFlowTheme.of(context).primary,
              checkmarkColor: Colors.white,
              side: BorderSide(
                color: isSelected 
                    ? FlutterFlowTheme.of(context).primary
                    : FlutterFlowTheme.of(context).alternate,
                width: 1.0,
              ),
            ),
          );
        },
      ),
    );
  }

  Widget _buildFoodList() {
    if (_model.isLoading) {
      return const Center(
        child: CircularProgressIndicator(),
      );
    }

    if (_model.filteredFoods.isEmpty) {
      return Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Icon(
              Icons.search_off,
              size: 64.0,
              color: FlutterFlowTheme.of(context).secondaryText,
            ),
            const SizedBox(height: 16.0),
            Text(
              '검색 결과가 없습니다',
              style: FlutterFlowTheme.of(context).titleMedium.override(
                    fontFamily: 'Inter',
                    letterSpacing: 0.0,
                  ),
            ),
            const SizedBox(height: 8.0),
            Text(
              '다른 검색어를 시도해보세요',
              style: FlutterFlowTheme.of(context).bodyMedium.override(
                    fontFamily: 'Inter',
                    letterSpacing: 0.0,
                    color: FlutterFlowTheme.of(context).secondaryText,
                  ),
            ),
          ],
        ),
      );
    }

    return ListView.builder(
      padding: const EdgeInsetsDirectional.fromSTEB(16.0, 0.0, 16.0, 16.0),
      itemCount: _model.filteredFoods.length,
      itemBuilder: (context, index) {
        final food = _model.filteredFoods[index];
        return _buildFoodCard(food);
      },
    );
  }

  Widget _buildFoodCard(FoodItemRecord food) {
    return Container(
      margin: const EdgeInsetsDirectional.fromSTEB(0.0, 0.0, 0.0, 12.0),
      decoration: BoxDecoration(
        color: FlutterFlowTheme.of(context).secondaryBackground,
        borderRadius: BorderRadius.circular(12.0),
        border: Border.all(
          color: FlutterFlowTheme.of(context).alternate,
        ),
      ),
      child: InkWell(
        onTap: () => _showFoodDetail(food),
        child: Padding(
          padding: const EdgeInsets.all(16.0),
          child: Row(
            children: [
              // 식품 이미지
              Container(
                width: 60.0,
                height: 60.0,
                decoration: BoxDecoration(
                  color: FlutterFlowTheme.of(context).primary.withOpacity(0.1),
                  borderRadius: BorderRadius.circular(8.0),
                ),
                child: food.imageUrl.isNotEmpty
                    ? ClipRRect(
                        borderRadius: BorderRadius.circular(8.0),
                        child: Image.network(
                          food.imageUrl,
                          fit: BoxFit.cover,
                          errorBuilder: (context, error, stackTrace) => Icon(
                            Icons.restaurant,
                            color: FlutterFlowTheme.of(context).primary,
                            size: 24.0,
                          ),
                        ),
                      )
                    : Icon(
                        Icons.restaurant,
                        color: FlutterFlowTheme.of(context).primary,
                        size: 24.0,
                      ),
              ),
              
              const SizedBox(width: 16.0),
              
              // 식품 정보
              Expanded(
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Row(
                      children: [
                        Expanded(
                          child: Text(
                            food.nameKorean.isNotEmpty ? food.nameKorean : food.name,
                            style: FlutterFlowTheme.of(context).titleSmall.override(
                                  fontFamily: 'Inter',
                                  letterSpacing: 0.0,
                                  fontWeight: FontWeight.w600,
                                ),
                          ),
                        ),
                        if (food.isVerified)
                          Icon(
                            Icons.verified,
                            color: FlutterFlowTheme.of(context).success,
                            size: 16.0,
                          ),
                      ],
                    ),
                    const SizedBox(height: 4.0),
                    Text(
                      food.category,
                      style: FlutterFlowTheme.of(context).bodySmall.override(
                            fontFamily: 'Inter',
                            letterSpacing: 0.0,
                            color: FlutterFlowTheme.of(context).secondaryText,
                          ),
                    ),
                    const SizedBox(height: 8.0),
                    Row(
                      children: [
                        _buildNutritionChip(
                          '${food.caloriesPerServing.toStringAsFixed(0)} kcal',
                          Colors.orange,
                        ),
                        const SizedBox(width: 8.0),
                        _buildNutritionChip(
                          '${food.servingSize.toStringAsFixed(0)}${food.servingUnit}',
                          Colors.blue,
                        ),
                      ],
                    ),
                  ],
                ),
              ),
              
              // 화살표 아이콘
              Icon(
                Icons.chevron_right,
                color: FlutterFlowTheme.of(context).secondaryText,
                size: 24.0,
              ),
            ],
          ),
        ),
      ),
    );
  }

  Widget _buildNutritionChip(String label, Color color) {
    return Container(
      padding: const EdgeInsets.symmetric(horizontal: 8.0, vertical: 4.0),
      decoration: BoxDecoration(
        color: color.withOpacity(0.1),
        borderRadius: BorderRadius.circular(12.0),
        border: Border.all(
          color: color.withOpacity(0.3),
        ),
      ),
      child: Text(
        label,
        style: FlutterFlowTheme.of(context).bodySmall.override(
              fontFamily: 'Inter',
              letterSpacing: 0.0,
              color: color,
              fontWeight: FontWeight.w500,
            ),
      ),
    );
  }

  // Helper methods
  void _performSearch(String query) {
    setState(() {
      _model.searchQuery = query;
    });
    _filterFoods();
  }

  void _filterFoods() {
    setState(() {
      _model.filteredFoods = _model.allFoods.where((food) {
        // 검색어 필터링
        if (_model.searchQuery.isNotEmpty) {
          final searchLower = _model.searchQuery.toLowerCase();
          final nameMatch = food.name.toLowerCase().contains(searchLower);
          final koreanNameMatch = food.nameKorean.toLowerCase().contains(searchLower);
          final categoryMatch = food.category.toLowerCase().contains(searchLower);
          
          if (!nameMatch && !koreanNameMatch && !categoryMatch) {
            return false;
          }
        }
        
        // 카테고리 필터링
        if (_model.selectedCategory.isNotEmpty) {
          if (food.category != _model.selectedCategory) {
            return false;
          }
        }
        
        // 추가 필터링 (칼로리, 알레르기 등)
        if (_model.minCalories > 0 && food.caloriesPerServing < _model.minCalories) {
          return false;
        }
        
        if (_model.maxCalories > 0 && food.caloriesPerServing > _model.maxCalories) {
          return false;
        }
        
        if (_model.selectedAllergens.isNotEmpty) {
          for (final allergen in _model.selectedAllergens) {
            if (food.allergens.contains(allergen)) {
              return false;
            }
          }
        }
        
        return true;
      }).toList();
      
      // 정렬
      _model.filteredFoods.sort((a, b) {
        switch (_model.sortBy) {
          case 'name':
            return a.nameKorean.compareTo(b.nameKorean);
          case 'calories':
            return a.caloriesPerServing.compareTo(b.caloriesPerServing);
          case 'popularity':
            return b.popularityScore.compareTo(a.popularityScore);
          default:
            return 0;
        }
      });
    });
  }

  Future<void> _showFilterBottomSheet() async {
    await showModalBottomSheet(
      context: context,
      isScrollControlled: true,
      backgroundColor: Colors.transparent,
      builder: (context) => _buildFilterBottomSheet(),
    );
  }

  Widget _buildFilterBottomSheet() {
    return Container(
      height: MediaQuery.of(context).size.height * 0.7,
      decoration: BoxDecoration(
        color: FlutterFlowTheme.of(context).secondaryBackground,
        borderRadius: const BorderRadius.only(
          topLeft: Radius.circular(20.0),
          topRight: Radius.circular(20.0),
        ),
      ),
      child: Padding(
        padding: const EdgeInsets.all(20.0),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            // 헤더
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                Text(
                  '필터',
                  style: FlutterFlowTheme.of(context).titleLarge.override(
                        fontFamily: 'Inter',
                        letterSpacing: 0.0,
                        fontWeight: FontWeight.w600,
                      ),
                ),
                IconButton(
                  onPressed: () => Navigator.pop(context),
                  icon: Icon(
                    Icons.close,
                    color: FlutterFlowTheme.of(context).primaryText,
                  ),
                ),
              ],
            ),
            
            const SizedBox(height: 20.0),
            
            // 칼로리 범위
            Text(
              '칼로리 범위',
              style: FlutterFlowTheme.of(context).titleMedium.override(
                    fontFamily: 'Inter',
                    letterSpacing: 0.0,
                    fontWeight: FontWeight.w600,
                  ),
            ),
            const SizedBox(height: 12.0),
            Row(
              children: [
                Expanded(
                  child: TextFormField(
                    controller: _model.minCaloriesController,
                    keyboardType: TextInputType.number,
                    decoration: InputDecoration(
                      labelText: '최소 칼로리',
                      border: OutlineInputBorder(
                        borderRadius: BorderRadius.circular(8.0),
                      ),
                    ),
                  ),
                ),
                const SizedBox(width: 16.0),
                Expanded(
                  child: TextFormField(
                    controller: _model.maxCaloriesController,
                    keyboardType: TextInputType.number,
                    decoration: InputDecoration(
                      labelText: '최대 칼로리',
                      border: OutlineInputBorder(
                        borderRadius: BorderRadius.circular(8.0),
                      ),
                    ),
                  ),
                ),
              ],
            ),
            
            const SizedBox(height: 20.0),
            
            // 알레르기 필터
            Text(
              '알레르기 제외',
              style: FlutterFlowTheme.of(context).titleMedium.override(
                    fontFamily: 'Inter',
                    letterSpacing: 0.0,
                    fontWeight: FontWeight.w600,
                  ),
            ),
            const SizedBox(height: 12.0),
            Wrap(
              spacing: 8.0,
              runSpacing: 8.0,
              children: _model.allergens.map((allergen) {
                final isSelected = _model.selectedAllergens.contains(allergen);
                return FilterChip(
                  label: Text(allergen),
                  selected: isSelected,
                  onSelected: (selected) {
                    setState(() {
                      if (selected) {
                        _model.selectedAllergens.add(allergen);
                      } else {
                        _model.selectedAllergens.remove(allergen);
                      }
                    });
                  },
                );
              }).toList(),
            ),
            
            const SizedBox(height: 20.0),
            
            // 정렬 옵션
            Text(
              '정렬',
              style: FlutterFlowTheme.of(context).titleMedium.override(
                    fontFamily: 'Inter',
                    letterSpacing: 0.0,
                    fontWeight: FontWeight.w600,
                  ),
            ),
            const SizedBox(height: 12.0),
            DropdownButtonFormField<String>(
              value: _model.sortBy,
              decoration: InputDecoration(
                border: OutlineInputBorder(
                  borderRadius: BorderRadius.circular(8.0),
                ),
              ),
              items: const [
                DropdownMenuItem(value: 'name', child: Text('이름순')),
                DropdownMenuItem(value: 'calories', child: Text('칼로리순')),
                DropdownMenuItem(value: 'popularity', child: Text('인기순')),
              ],
              onChanged: (value) {
                setState(() {
                  _model.sortBy = value ?? 'name';
                });
              },
            ),
            
            const Spacer(),
            
            // 적용 버튼
            FFButtonWidget(
              onPressed: () {
                _applyFilters();
                Navigator.pop(context);
              },
              text: '필터 적용',
              options: FFButtonOptions(
                width: double.infinity,
                height: 50.0,
                padding: const EdgeInsetsDirectional.fromSTEB(0.0, 0.0, 0.0, 0.0),
                iconPadding: const EdgeInsetsDirectional.fromSTEB(0.0, 0.0, 0.0, 0.0),
                color: FlutterFlowTheme.of(context).primary,
                textStyle: FlutterFlowTheme.of(context).titleSmall.override(
                      fontFamily: 'Inter',
                      color: Colors.white,
                      letterSpacing: 0.0,
                    ),
                elevation: 2.0,
                borderSide: const BorderSide(
                  color: Colors.transparent,
                  width: 1.0,
                ),
                borderRadius: BorderRadius.circular(8.0),
              ),
            ),
          ],
        ),
      ),
    );
  }

  void _applyFilters() {
    _model.minCalories = double.tryParse(_model.minCaloriesController.text) ?? 0.0;
    _model.maxCalories = double.tryParse(_model.maxCaloriesController.text) ?? 0.0;
    _filterFoods();
  }

  Future<void> _showFoodDetail(FoodItemRecord food) async {
    await showModalBottomSheet(
      context: context,
      isScrollControlled: true,
      backgroundColor: Colors.transparent,
      builder: (context) => _buildFoodDetailBottomSheet(food),
    );
  }

  Widget _buildFoodDetailBottomSheet(FoodItemRecord food) {
    final macroNutrients = food.macroNutrients;
    final carbs = (macroNutrients['carbs'] as num?)?.toDouble() ?? 0.0;
    final protein = (macroNutrients['protein'] as num?)?.toDouble() ?? 0.0;
    final fat = (macroNutrients['fat'] as num?)?.toDouble() ?? 0.0;
    
    return Container(
      height: MediaQuery.of(context).size.height * 0.8,
      decoration: BoxDecoration(
        color: FlutterFlowTheme.of(context).secondaryBackground,
        borderRadius: const BorderRadius.only(
          topLeft: Radius.circular(20.0),
          topRight: Radius.circular(20.0),
        ),
      ),
      child: SingleChildScrollView(
        padding: const EdgeInsets.all(20.0),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            // 헤더
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                Expanded(
                  child: Text(
                    food.nameKorean.isNotEmpty ? food.nameKorean : food.name,
                    style: FlutterFlowTheme.of(context).titleLarge.override(
                          fontFamily: 'Inter',
                          letterSpacing: 0.0,
                          fontWeight: FontWeight.w600,
                        ),
                  ),
                ),
                IconButton(
                  onPressed: () => Navigator.pop(context),
                  icon: Icon(
                    Icons.close,
                    color: FlutterFlowTheme.of(context).primaryText,
                  ),
                ),
              ],
            ),
            
            const SizedBox(height: 16.0),
            
            // 식품 이미지
            if (food.imageUrl.isNotEmpty)
              Container(
                width: double.infinity,
                height: 200.0,
                decoration: BoxDecoration(
                  borderRadius: BorderRadius.circular(12.0),
                ),
                child: ClipRRect(
                  borderRadius: BorderRadius.circular(12.0),
                  child: Image.network(
                    food.imageUrl,
                    fit: BoxFit.cover,
                    errorBuilder: (context, error, stackTrace) => Container(
                      color: FlutterFlowTheme.of(context).alternate,
                      child: Icon(
                        Icons.restaurant,
                        size: 64.0,
                        color: FlutterFlowTheme.of(context).secondaryText,
                      ),
                    ),
                  ),
                ),
              ),
            
            const SizedBox(height: 20.0),
            
            // 기본 정보
            _buildInfoSection('기본 정보', [
              _buildInfoRow('카테고리', food.category),
              _buildInfoRow('서브카테고리', food.subcategory),
              _buildInfoRow('1회 제공량', '${food.servingSize.toStringAsFixed(0)}${food.servingUnit}'),
              _buildInfoRow('칼로리', '${food.caloriesPerServing.toStringAsFixed(0)} kcal'),
            ]),
            
            const SizedBox(height: 20.0),
            
            // 영양소 정보
            _buildInfoSection('영양소 정보', [
              _buildInfoRow('탄수화물', '${carbs.toStringAsFixed(1)}g'),
              _buildInfoRow('단백질', '${protein.toStringAsFixed(1)}g'),
              _buildInfoRow('지방', '${fat.toStringAsFixed(1)}g'),
            ]),
            
            if (food.allergens.isNotEmpty) ...[
              const SizedBox(height: 20.0),
              _buildInfoSection('알레르기 정보', [
                _buildInfoRow('알레르기', food.allergens.join(', ')),
              ]),
            ],
            
            if (food.dietaryTags.isNotEmpty) ...[
              const SizedBox(height: 20.0),
              _buildInfoSection('식이 태그', [
                _buildInfoRow('태그', food.dietaryTags.join(', ')),
              ]),
            ],
            
            const SizedBox(height: 20.0),
            
            // 액션 버튼
            Row(
              children: [
                Expanded(
                  child: FFButtonWidget(
                    onPressed: () {
                      // 식품을 식단에 추가하는 로직
                      ScaffoldMessenger.of(context).showSnackBar(
                        const SnackBar(content: Text('식품이 식단에 추가되었습니다!')),
                      );
                      Navigator.pop(context);
                    },
                    text: '식단에 추가',
                    options: FFButtonOptions(
                      height: 50.0,
                      padding: const EdgeInsetsDirectional.fromSTEB(0.0, 0.0, 0.0, 0.0),
                      iconPadding: const EdgeInsetsDirectional.fromSTEB(0.0, 0.0, 0.0, 0.0),
                      color: FlutterFlowTheme.of(context).primary,
                      textStyle: FlutterFlowTheme.of(context).titleSmall.override(
                            fontFamily: 'Inter',
                            color: Colors.white,
                            letterSpacing: 0.0,
                          ),
                      elevation: 2.0,
                      borderSide: const BorderSide(
                        color: Colors.transparent,
                        width: 1.0,
                      ),
                      borderRadius: BorderRadius.circular(8.0),
                    ),
                  ),
                ),
                const SizedBox(width: 12.0),
                Expanded(
                  child: FFButtonWidget(
                    onPressed: () {
                      // 즐겨찾기에 추가하는 로직
                      ScaffoldMessenger.of(context).showSnackBar(
                        const SnackBar(content: Text('즐겨찾기에 추가되었습니다!')),
                      );
                    },
                    text: '즐겨찾기',
                    options: FFButtonOptions(
                      height: 50.0,
                      padding: const EdgeInsetsDirectional.fromSTEB(0.0, 0.0, 0.0, 0.0),
                      iconPadding: const EdgeInsetsDirectional.fromSTEB(0.0, 0.0, 0.0, 0.0),
                      color: FlutterFlowTheme.of(context).secondaryBackground,
                      textStyle: FlutterFlowTheme.of(context).titleSmall.override(
                            fontFamily: 'Inter',
                            color: FlutterFlowTheme.of(context).primaryText,
                            letterSpacing: 0.0,
                          ),
                      elevation: 0.0,
                      borderSide: BorderSide(
                        color: FlutterFlowTheme.of(context).alternate,
                        width: 1.0,
                      ),
                      borderRadius: BorderRadius.circular(8.0),
                    ),
                  ),
                ),
              ],
            ),
          ],
        ),
      ),
    );
  }

  Widget _buildInfoSection(String title, List<Widget> children) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Text(
          title,
          style: FlutterFlowTheme.of(context).titleMedium.override(
                fontFamily: 'Inter',
                letterSpacing: 0.0,
                fontWeight: FontWeight.w600,
              ),
        ),
        const SizedBox(height: 12.0),
        Container(
          padding: const EdgeInsets.all(16.0),
          decoration: BoxDecoration(
            color: FlutterFlowTheme.of(context).primaryBackground,
            borderRadius: BorderRadius.circular(8.0),
            border: Border.all(
              color: FlutterFlowTheme.of(context).alternate,
            ),
          ),
          child: Column(
            children: children,
          ),
        ),
      ],
    );
  }

  Widget _buildInfoRow(String label, String value) {
    return Padding(
      padding: const EdgeInsetsDirectional.fromSTEB(0.0, 0.0, 0.0, 8.0),
      child: Row(
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        children: [
          Text(
            label,
            style: FlutterFlowTheme.of(context).bodyMedium.override(
                  fontFamily: 'Inter',
                  letterSpacing: 0.0,
                ),
          ),
          Text(
            value,
            style: FlutterFlowTheme.of(context).bodyMedium.override(
                  fontFamily: 'Inter',
                  letterSpacing: 0.0,
                  fontWeight: FontWeight.w500,
                ),
          ),
        ],
      ),
    );
  }

  // 데이터 로드
  Future<void> _loadFoodData() async {
    setState(() {
      _model.isLoading = true;
    });

    try {
      // 샘플 데이터 생성 (실제로는 Firestore에서 로드)
      _model.allFoods = await _generateSampleFoodData();
      _model.filteredFoods = List.from(_model.allFoods);
    } catch (e) {
      ScaffoldMessenger.of(context).showSnackBar(
        SnackBar(content: Text('데이터 로드 중 오류가 발생했습니다: $e')),
      );
    } finally {
      setState(() {
        _model.isLoading = false;
      });
    }
  }

  Future<List<FoodItemRecord>> _generateSampleFoodData() async {
    // 샘플 식품 데이터 생성
    final sampleFoods = [
      {
        'food_id': 'food_001',
        'name': 'Apple',
        'name_korean': '사과',
        'category': '과일',
        'subcategory': '사과류',
        'description': '신선하고 달콤한 사과',
        'image_url': '',
        'serving_size': 100.0,
        'serving_unit': 'g',
        'calories_per_serving': 52.0,
        'macro_nutrients': {'carbs': 13.8, 'protein': 0.3, 'fat': 0.2},
        'micro_nutrients': {'vitamin_c': 4.6, 'calcium': 6.0, 'iron': 0.1},
        'allergens': [],
        'dietary_tags': ['비건', '글루텐프리'],
        'is_verified': true,
        'source': 'USDA',
        'popularity_score': 9.5,
      },
      {
        'food_id': 'food_002',
        'name': 'Chicken Breast',
        'name_korean': '닭가슴살',
        'category': '육류',
        'subcategory': '닭고기',
        'description': '고단백 저지방 닭가슴살',
        'image_url': '',
        'serving_size': 100.0,
        'serving_unit': 'g',
        'calories_per_serving': 165.0,
        'macro_nutrients': {'carbs': 0.0, 'protein': 31.0, 'fat': 3.6},
        'micro_nutrients': {'vitamin_c': 0.0, 'calcium': 15.0, 'iron': 1.0},
        'allergens': [],
        'dietary_tags': ['고단백', '저지방'],
        'is_verified': true,
        'source': 'USDA',
        'popularity_score': 9.2,
      },
      {
        'food_id': 'food_003',
        'name': 'Brown Rice',
        'name_korean': '현미',
        'category': '곡물',
        'subcategory': '쌀',
        'description': '영양이 풍부한 현미',
        'image_url': '',
        'serving_size': 100.0,
        'serving_unit': 'g',
        'calories_per_serving': 111.0,
        'macro_nutrients': {'carbs': 23.0, 'protein': 2.6, 'fat': 0.9},
        'micro_nutrients': {'vitamin_c': 0.0, 'calcium': 10.0, 'iron': 0.4},
        'allergens': [],
        'dietary_tags': ['비건', '글루텐프리', '고섬유'],
        'is_verified': true,
        'source': 'USDA',
        'popularity_score': 8.8,
      },
    ];

    return sampleFoods.map((data) {
      return FoodItemRecord.getDocumentFromData(
        createFoodItemRecordData(
          foodId: data['food_id'] as String,
          name: data['name'] as String,
          nameKorean: data['name_korean'] as String,
          category: data['category'] as String,
          subcategory: data['subcategory'] as String,
          description: data['description'] as String,
          imageUrl: data['image_url'] as String,
          servingSize: data['serving_size'] as double,
          servingUnit: data['serving_unit'] as String,
          caloriesPerServing: data['calories_per_serving'] as double,
          macroNutrients: data['macro_nutrients'] as Map<String, dynamic>,
          microNutrients: data['micro_nutrients'] as Map<String, dynamic>,
          allergens: data['allergens'] as List<String>,
          dietaryTags: data['dietary_tags'] as List<String>,
          isVerified: data['is_verified'] as bool,
          source: data['source'] as String,
          popularityScore: data['popularity_score'] as double,
          createdAt: DateTime.now(),
          updatedAt: DateTime.now(),
        ),
        FirebaseFirestore.instance.collection('food_items').doc(),
      );
    }).toList();
  }

  @override
  void initState() {
    super.initState();
    _loadFoodData();
  }
}
