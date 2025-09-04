import '/auth/firebase_auth/auth_util.dart';
import '/backend/backend.dart';
import '/flutter_flow/flutter_flow_theme.dart';
import '/flutter_flow/flutter_flow_util.dart';
import '/flutter_flow/flutter_flow_widgets.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:provider/provider.dart';
import 'calorie_recommendation_model.dart';
export 'calorie_recommendation_model.dart';

class CalorieRecommendationWidget extends StatefulWidget {
  const CalorieRecommendationWidget({super.key});

  @override
  State<CalorieRecommendationWidget> createState() => _CalorieRecommendationWidgetState();
}

class _CalorieRecommendationWidgetState extends State<CalorieRecommendationWidget> {
  late CalorieRecommendationModel _model;

  final scaffoldKey = GlobalKey<ScaffoldState>();

  @override
  void initState() {
    super.initState();
    _model = createModel(context, () => CalorieRecommendationModel());

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
            '칼로리/영양 추천',
            style: FlutterFlowTheme.of(context).headlineMedium.override(
                  fontFamily: 'Inter',
                  letterSpacing: 0.0,
                ),
          ),
          actions: [],
          centerTitle: false,
          elevation: 0.0,
        ),
        body: SafeArea(
          top: true,
          child: SingleChildScrollView(
            child: Column(
              mainAxisSize: MainAxisSize.max,
              children: [
                Padding(
                  padding: const EdgeInsetsDirectional.fromSTEB(16.0, 16.0, 16.0, 0.0),
                  child: Text(
                    '개인 맞춤형 식사 추천을\n받아보세요',
                    style: FlutterFlowTheme.of(context).bodyLarge.override(
                          fontFamily: 'Inter',
                          letterSpacing: 0.0,
                        ),
                    textAlign: TextAlign.center,
                  ),
                ),
                Padding(
                  padding: const EdgeInsetsDirectional.fromSTEB(16.0, 24.0, 16.0, 0.0),
                  child: Column(
                    mainAxisSize: MainAxisSize.max,
                    children: [
                      // 사용자 정보 요약
                      _buildUserInfoSummary(),
                      
                      const SizedBox(height: 24.0),
                      
                      // 식사 시간 선택
                      _buildSectionTitle('식사 시간 선택'),
                      _buildMealTimeSelector(),
                      
                      const SizedBox(height: 24.0),
                      
                      // 추천 옵션
                      _buildSectionTitle('추천 옵션'),
                      _buildRecommendationOptions(),
                      
                      const SizedBox(height: 24.0),
                      
                      // 추천 결과
                      if (_model.recommendations.isNotEmpty) ...[
                        _buildSectionTitle('추천 결과'),
                        _buildRecommendationResults(),
                        const SizedBox(height: 24.0),
                      ],
                      
                      // 추천 받기 버튼
                      FFButtonWidget(
                        onPressed: _model.isLoading ? null : () async {
                          await _generateRecommendations();
                        },
                        text: _model.isLoading ? '추천 생성 중...' : '추천 받기',
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
                      
                      const SizedBox(height: 16.0),
                    ],
                  ),
                ),
              ],
            ),
          ),
        ),
      ),
    );
  }

  Widget _buildSectionTitle(String title) {
    return Padding(
      padding: const EdgeInsetsDirectional.fromSTEB(0.0, 0.0, 0.0, 16.0),
      child: Text(
        title,
        style: FlutterFlowTheme.of(context).titleMedium.override(
              fontFamily: 'Inter',
              letterSpacing: 0.0,
              fontWeight: FontWeight.w600,
            ),
      ),
    );
  }

  Widget _buildUserInfoSummary() {
    return Container(
      padding: const EdgeInsets.all(16.0),
      decoration: BoxDecoration(
        color: FlutterFlowTheme.of(context).secondaryBackground,
        borderRadius: BorderRadius.circular(12.0),
        border: Border.all(
          color: FlutterFlowTheme.of(context).alternate,
        ),
      ),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Row(
            children: [
              Icon(
                Icons.person_outline,
                color: FlutterFlowTheme.of(context).primary,
                size: 20.0,
              ),
              const SizedBox(width: 8.0),
              Text(
                '사용자 정보',
                style: FlutterFlowTheme.of(context).titleSmall.override(
                      fontFamily: 'Inter',
                      letterSpacing: 0.0,
                      fontWeight: FontWeight.w600,
                    ),
              ),
            ],
          ),
          const SizedBox(height: 12.0),
          _buildInfoRow('목표 칼로리', '${_model.dailyCalorieGoal.toStringAsFixed(0)} kcal'),
          _buildInfoRow('탄수화물 비율', '${_model.carbRatio.toStringAsFixed(0)}%'),
          _buildInfoRow('단백질 비율', '${_model.proteinRatio.toStringAsFixed(0)}%'),
          _buildInfoRow('지방 비율', '${_model.fatRatio.toStringAsFixed(0)}%'),
          _buildInfoRow('건강 목표', _model.healthGoal),
        ],
      ),
    );
  }

  Widget _buildInfoRow(String label, String value) {
    return Padding(
      padding: const EdgeInsetsDirectional.fromSTEB(0.0, 4.0, 0.0, 4.0),
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

  Widget _buildMealTimeSelector() {
    return Container(
      padding: const EdgeInsets.all(16.0),
      decoration: BoxDecoration(
        color: FlutterFlowTheme.of(context).secondaryBackground,
        borderRadius: BorderRadius.circular(12.0),
        border: Border.all(
          color: FlutterFlowTheme.of(context).alternate,
        ),
      ),
      child: Column(
        children: [
          _buildMealTimeOption('아침', '07:00 - 09:00', Icons.wb_sunny_outlined),
          const Divider(),
          _buildMealTimeOption('점심', '12:00 - 14:00', Icons.wb_sunny),
          const Divider(),
          _buildMealTimeOption('저녁', '18:00 - 20:00', Icons.nights_stay_outlined),
          const Divider(),
          _buildMealTimeOption('간식', '15:00 - 16:00', Icons.cookie_outlined),
        ],
      ),
    );
  }

  Widget _buildMealTimeOption(String mealType, String timeRange, IconData icon) {
    final isSelected = _model.selectedMealType == mealType;
    
    return InkWell(
      onTap: () => setState(() => _model.selectedMealType = mealType),
      child: Container(
        padding: const EdgeInsets.symmetric(vertical: 12.0),
        child: Row(
          children: [
            Container(
              width: 40.0,
              height: 40.0,
              decoration: BoxDecoration(
                color: isSelected 
                    ? FlutterFlowTheme.of(context).primary
                    : FlutterFlowTheme.of(context).alternate,
                shape: BoxShape.circle,
              ),
              child: Icon(
                icon,
                color: isSelected 
                    ? Colors.white
                    : FlutterFlowTheme.of(context).primaryText,
                size: 20.0,
              ),
            ),
            const SizedBox(width: 16.0),
            Expanded(
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Text(
                    mealType,
                    style: FlutterFlowTheme.of(context).bodyLarge.override(
                          fontFamily: 'Inter',
                          letterSpacing: 0.0,
                          fontWeight: FontWeight.w500,
                        ),
                  ),
                  Text(
                    timeRange,
                    style: FlutterFlowTheme.of(context).bodySmall.override(
                          fontFamily: 'Inter',
                          letterSpacing: 0.0,
                          color: FlutterFlowTheme.of(context).secondaryText,
                        ),
                  ),
                ],
              ),
            ),
            if (isSelected)
              Icon(
                Icons.check_circle,
                color: FlutterFlowTheme.of(context).primary,
                size: 24.0,
              ),
          ],
        ),
      ),
    );
  }

  Widget _buildRecommendationOptions() {
    return Container(
      padding: const EdgeInsets.all(16.0),
      decoration: BoxDecoration(
        color: FlutterFlowTheme.of(context).secondaryBackground,
        borderRadius: BorderRadius.circular(12.0),
        border: Border.all(
          color: FlutterFlowTheme.of(context).alternate,
        ),
      ),
      child: Column(
        children: [
          _buildOptionToggle(
            '칼로리 기반 추천',
            '목표 칼로리에 맞는 식사 추천',
            _model.calorieBasedRecommendation,
            (value) => setState(() => _model.calorieBasedRecommendation = value),
          ),
          const Divider(),
          _buildOptionToggle(
            '영양소 균형 추천',
            '3대 영양소 비율에 맞는 추천',
            _model.nutritionBasedRecommendation,
            (value) => setState(() => _model.nutritionBasedRecommendation = value),
          ),
          const Divider(),
          _buildOptionToggle(
            '건강 목표 맞춤',
            '체중감량/증가 목표에 맞는 추천',
            _model.healthGoalRecommendation,
            (value) => setState(() => _model.healthGoalRecommendation = value),
          ),
          const Divider(),
          _buildOptionToggle(
            '알레르기 고려',
            '알레르기 정보를 고려한 추천',
            _model.allergyConsideration,
            (value) => setState(() => _model.allergyConsideration = value),
          ),
        ],
      ),
    );
  }

  Widget _buildOptionToggle(String title, String description, bool value, Function(bool) onChanged) {
    return Row(
      children: [
        Expanded(
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Text(
                title,
                style: FlutterFlowTheme.of(context).bodyLarge.override(
                      fontFamily: 'Inter',
                      letterSpacing: 0.0,
                      fontWeight: FontWeight.w500,
                    ),
              ),
              Text(
                description,
                style: FlutterFlowTheme.of(context).bodySmall.override(
                      fontFamily: 'Inter',
                      letterSpacing: 0.0,
                      color: FlutterFlowTheme.of(context).secondaryText,
                    ),
              ),
            ],
          ),
        ),
        Switch(
          value: value,
          onChanged: onChanged,
          activeColor: FlutterFlowTheme.of(context).primary,
        ),
      ],
    );
  }

  Widget _buildRecommendationResults() {
    return Column(
      children: _model.recommendations.map((recommendation) => 
        _buildRecommendationCard(recommendation)
      ).toList(),
    );
  }

  Widget _buildRecommendationCard(Map<String, dynamic> recommendation) {
    return Container(
      margin: const EdgeInsetsDirectional.fromSTEB(0.0, 0.0, 0.0, 16.0),
      padding: const EdgeInsets.all(16.0),
      decoration: BoxDecoration(
        color: FlutterFlowTheme.of(context).secondaryBackground,
        borderRadius: BorderRadius.circular(12.0),
        border: Border.all(
          color: FlutterFlowTheme.of(context).alternate,
        ),
      ),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Row(
            children: [
              Container(
                width: 50.0,
                height: 50.0,
                decoration: BoxDecoration(
                  color: FlutterFlowTheme.of(context).primary.withOpacity(0.1),
                  borderRadius: BorderRadius.circular(8.0),
                ),
                child: Icon(
                  Icons.restaurant,
                  color: FlutterFlowTheme.of(context).primary,
                  size: 24.0,
                ),
              ),
              const SizedBox(width: 12.0),
              Expanded(
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Text(
                      recommendation['name'] ?? '추천 식사',
                      style: FlutterFlowTheme.of(context).titleSmall.override(
                            fontFamily: 'Inter',
                            letterSpacing: 0.0,
                            fontWeight: FontWeight.w600,
                          ),
                    ),
                    Text(
                      '${recommendation['calories']?.toStringAsFixed(0) ?? '0'} kcal',
                      style: FlutterFlowTheme.of(context).bodyMedium.override(
                            fontFamily: 'Inter',
                            letterSpacing: 0.0,
                            color: FlutterFlowTheme.of(context).primary,
                            fontWeight: FontWeight.w500,
                          ),
                    ),
                  ],
                ),
              ),
              Row(
                children: [
                  IconButton(
                    onPressed: () => _rateRecommendation(recommendation, 1),
                    icon: Icon(
                      Icons.thumb_up_outlined,
                      color: FlutterFlowTheme.of(context).success,
                      size: 20.0,
                    ),
                  ),
                  IconButton(
                    onPressed: () => _rateRecommendation(recommendation, -1),
                    icon: Icon(
                      Icons.thumb_down_outlined,
                      color: FlutterFlowTheme.of(context).error,
                      size: 20.0,
                    ),
                  ),
                ],
              ),
            ],
          ),
          const SizedBox(height: 12.0),
          Text(
            recommendation['description'] ?? '맛있고 건강한 식사입니다.',
            style: FlutterFlowTheme.of(context).bodyMedium.override(
                  fontFamily: 'Inter',
                  letterSpacing: 0.0,
                ),
          ),
          const SizedBox(height: 12.0),
          Row(
            children: [
              _buildNutritionChip('탄수화물', '${recommendation['carbs']?.toStringAsFixed(0) ?? '0'}g', Colors.orange),
              const SizedBox(width: 8.0),
              _buildNutritionChip('단백질', '${recommendation['protein']?.toStringAsFixed(0) ?? '0'}g', Colors.red),
              const SizedBox(width: 8.0),
              _buildNutritionChip('지방', '${recommendation['fat']?.toStringAsFixed(0) ?? '0'}g', Colors.blue),
            ],
          ),
        ],
      ),
    );
  }

  Widget _buildNutritionChip(String label, String value, Color color) {
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
        '$label: $value',
        style: FlutterFlowTheme.of(context).bodySmall.override(
              fontFamily: 'Inter',
              letterSpacing: 0.0,
              color: color,
              fontWeight: FontWeight.w500,
            ),
      ),
    );
  }

  Future<void> _generateRecommendations() async {
    if (_model.selectedMealType.isEmpty) {
      ScaffoldMessenger.of(context).showSnackBar(
        const SnackBar(content: Text('식사 시간을 선택해주세요.')),
      );
      return;
    }

    setState(() {
      _model.isLoading = true;
    });

    try {
      // 사용자 정보 로드
      await _loadUserData();
      
      // 추천 생성 로직
      final recommendations = await _createRecommendations();
      
      setState(() {
        _model.recommendations = recommendations;
      });

      // 추천 히스토리 저장
      await _saveRecommendationHistory(recommendations);

      ScaffoldMessenger.of(context).showSnackBar(
        const SnackBar(content: Text('개인 맞춤 추천이 생성되었습니다!')),
      );
    } catch (e) {
      ScaffoldMessenger.of(context).showSnackBar(
        SnackBar(content: Text('추천 생성 중 오류가 발생했습니다: $e')),
      );
    } finally {
      setState(() {
        _model.isLoading = false;
      });
    }
  }

  Future<void> _loadUserData() async {
    final currentUser = currentUserDocument;
    if (currentUser != null) {
      // 건강 프로필 정보 로드
      final healthProfile = currentUser.healthProfile;
      if (healthProfile.isNotEmpty) {
        _model.dailyCalorieGoal = (healthProfile['dailyCalorieGoal'] as num?)?.toDouble() ?? 2000.0;
        _model.healthGoal = healthProfile['healthGoal'] as String? ?? '체중유지';
      }

      // 영양 목표 정보 로드
      final nutritionGoals = await queryNutritionGoalsRecordOnce(
        queryBuilder: (query) => query
            .where('user_id', isEqualTo: currentUser.uid)
            .where('is_active', isEqualTo: true)
            .orderBy('created_at', descending: true)
            .limit(1),
      );

      if (nutritionGoals.isNotEmpty) {
        final goal = nutritionGoals.first;
        final macroRatios = goal.macroRatios;
        _model.carbRatio = (macroRatios['carbohydrate'] as num?)?.toDouble() ?? 50.0;
        _model.proteinRatio = (macroRatios['protein'] as num?)?.toDouble() ?? 25.0;
        _model.fatRatio = (macroRatios['fat'] as num?)?.toDouble() ?? 25.0;
      }
    }
  }

  Future<List<Map<String, dynamic>>> _createRecommendations() async {
    // 간단한 추천 로직 (실제로는 더 복잡한 알고리즘 사용)
    final mealCalories = _getMealCalories();
    final recommendations = <Map<String, dynamic>>[];

    // 샘플 추천 데이터
    final sampleMeals = [
      {
        'name': '닭가슴살 샐러드',
        'calories': mealCalories * 0.8,
        'carbs': mealCalories * 0.4 / 4,
        'protein': mealCalories * 0.3 / 4,
        'fat': mealCalories * 0.3 / 9,
        'description': '단백질이 풍부하고 칼로리가 적당한 건강한 식사입니다.',
      },
      {
        'name': '연어 구이와 현미밥',
        'calories': mealCalories * 0.9,
        'carbs': mealCalories * 0.5 / 4,
        'protein': mealCalories * 0.25 / 4,
        'fat': mealCalories * 0.25 / 9,
        'description': '오메가3가 풍부한 연어와 현미로 구성된 균형잡힌 식사입니다.',
      },
      {
        'name': '토마토 파스타',
        'calories': mealCalories * 0.85,
        'carbs': mealCalories * 0.6 / 4,
        'protein': mealCalories * 0.2 / 4,
        'fat': mealCalories * 0.2 / 9,
        'description': '신선한 토마토와 올리브오일로 만든 이탈리안 스타일 파스타입니다.',
      },
    ];

    // 선택된 옵션에 따라 추천 필터링
    for (final meal in sampleMeals) {
      if (_shouldIncludeMeal(meal)) {
        recommendations.add(meal);
      }
    }

    return recommendations.take(3).toList();
  }

  double _getMealCalories() {
    switch (_model.selectedMealType) {
      case '아침':
        return _model.dailyCalorieGoal * 0.25;
      case '점심':
        return _model.dailyCalorieGoal * 0.35;
      case '저녁':
        return _model.dailyCalorieGoal * 0.3;
      case '간식':
        return _model.dailyCalorieGoal * 0.1;
      default:
        return _model.dailyCalorieGoal * 0.3;
    }
  }

  bool _shouldIncludeMeal(Map<String, dynamic> meal) {
    // 칼로리 기반 필터링
    if (_model.calorieBasedRecommendation) {
      final targetCalories = _getMealCalories();
      final mealCalories = meal['calories'] as double;
      if ((mealCalories - targetCalories).abs() > targetCalories * 0.2) {
        return false;
      }
    }

    // 건강 목표 기반 필터링
    if (_model.healthGoalRecommendation) {
      if (_model.healthGoal == '체중감량' && (meal['calories'] as double) > _getMealCalories() * 1.1) {
        return false;
      }
      if (_model.healthGoal == '체중증가' && (meal['calories'] as double) < _getMealCalories() * 0.9) {
        return false;
      }
    }

    return true;
  }

  Future<void> _saveRecommendationHistory(List<Map<String, dynamic>> recommendations) async {
    final currentUser = currentUserDocument;
    if (currentUser != null) {
      final recommendationId = DateTime.now().millisecondsSinceEpoch.toString();
      
      await RecommendationHistoryRecord.collection.add(createRecommendationHistoryRecordData(
        recommendationId: recommendationId,
        userId: currentUser.uid,
        mealType: _model.selectedMealType,
        recommendedMeals: recommendations.map((r) => r['name'] as String).toList(),
        recommendationReason: _generateRecommendationReason(),
        userHealthProfile: currentUser.healthProfile,
        nutritionGoals: {
          'dailyCalories': _model.dailyCalorieGoal,
          'carbRatio': _model.carbRatio,
          'proteinRatio': _model.proteinRatio,
          'fatRatio': _model.fatRatio,
        },
        isAccepted: false,
        feedbackScore: 0,
        createdAt: DateTime.now(),
      ));
    }
  }

  String _generateRecommendationReason() {
    final reasons = <String>[];
    
    if (_model.calorieBasedRecommendation) {
      reasons.add('칼로리 목표 기반');
    }
    if (_model.nutritionBasedRecommendation) {
      reasons.add('영양소 균형 고려');
    }
    if (_model.healthGoalRecommendation) {
      reasons.add('${_model.healthGoal} 목표 맞춤');
    }
    if (_model.allergyConsideration) {
      reasons.add('알레르기 정보 고려');
    }
    
    return reasons.isEmpty ? '기본 추천' : reasons.join(', ');
  }

  Future<void> _rateRecommendation(Map<String, dynamic> recommendation, int rating) async {
    // 추천 평가 로직
    ScaffoldMessenger.of(context).showSnackBar(
      SnackBar(content: Text(rating > 0 ? '좋아요를 눌렀습니다!' : '싫어요를 눌렀습니다!')),
    );
  }
}
