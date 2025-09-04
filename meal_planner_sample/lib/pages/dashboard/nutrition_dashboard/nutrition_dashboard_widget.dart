import '/auth/firebase_auth/auth_util.dart';
import '/backend/backend.dart';
import '/flutter_flow/flutter_flow_theme.dart';
import '/flutter_flow/flutter_flow_util.dart';
import '/flutter_flow/flutter_flow_widgets.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:provider/provider.dart';
import 'nutrition_dashboard_model.dart';
export 'nutrition_dashboard_model.dart';

class NutritionDashboardWidget extends StatefulWidget {
  const NutritionDashboardWidget({super.key});

  @override
  State<NutritionDashboardWidget> createState() => _NutritionDashboardWidgetState();
}

class _NutritionDashboardWidgetState extends State<NutritionDashboardWidget> {
  late NutritionDashboardModel _model;

  final scaffoldKey = GlobalKey<ScaffoldState>();

  @override
  void initState() {
    super.initState();
    _model = createModel(context, () => NutritionDashboardModel());

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
            '영양 대시보드',
            style: FlutterFlowTheme.of(context).headlineMedium.override(
                  fontFamily: 'Inter',
                  letterSpacing: 0.0,
                ),
          ),
          actions: [
            IconButton(
              icon: Icon(
                Icons.refresh_rounded,
                color: FlutterFlowTheme.of(context).primaryText,
                size: 24.0,
              ),
              onPressed: () async {
                await _refreshData();
              },
            ),
          ],
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
                    '오늘의 영양 섭취 현황을\n확인해보세요',
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
                      // 날짜 선택기
                      _buildDateSelector(),
                      
                      const SizedBox(height: 24.0),
                      
                      // 칼로리 요약 카드
                      _buildCalorieSummaryCard(),
                      
                      const SizedBox(height: 24.0),
                      
                      // 3대 영양소 차트
                      _buildMacroNutrientsChart(),
                      
                      const SizedBox(height: 24.0),
                      
                      // 식사별 분석
                      _buildMealBreakdown(),
                      
                      const SizedBox(height: 24.0),
                      
                      // 목표 달성률
                      _buildGoalAchievement(),
                      
                      const SizedBox(height: 24.0),
                      
                      // 건강 점수
                      _buildHealthScore(),
                      
                      const SizedBox(height: 24.0),
                      
                      // 미량 영양소 현황
                      _buildMicroNutrientsStatus(),
                      
                      const SizedBox(height: 24.0),
                      
                      // 주간 트렌드
                      _buildWeeklyTrend(),
                      
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

  Widget _buildDateSelector() {
    return Container(
      padding: const EdgeInsets.all(16.0),
      decoration: BoxDecoration(
        color: FlutterFlowTheme.of(context).secondaryBackground,
        borderRadius: BorderRadius.circular(12.0),
        border: Border.all(
          color: FlutterFlowTheme.of(context).alternate,
        ),
      ),
      child: Row(
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        children: [
          IconButton(
            onPressed: () => _changeDate(-1),
            icon: Icon(
              Icons.chevron_left,
              color: FlutterFlowTheme.of(context).primaryText,
            ),
          ),
          Column(
            children: [
              Text(
                _formatDate(_model.selectedDate),
                style: FlutterFlowTheme.of(context).titleMedium.override(
                      fontFamily: 'Inter',
                      letterSpacing: 0.0,
                      fontWeight: FontWeight.w600,
                    ),
              ),
              Text(
                _getDayOfWeek(_model.selectedDate),
                style: FlutterFlowTheme.of(context).bodySmall.override(
                      fontFamily: 'Inter',
                      letterSpacing: 0.0,
                      color: FlutterFlowTheme.of(context).secondaryText,
                    ),
              ),
            ],
          ),
          IconButton(
            onPressed: () => _changeDate(1),
            icon: Icon(
              Icons.chevron_right,
              color: FlutterFlowTheme.of(context).primaryText,
            ),
          ),
        ],
      ),
    );
  }

  Widget _buildCalorieSummaryCard() {
    final percentage = _model.targetCalories > 0 
        ? (_model.totalCalories / _model.targetCalories * 100).clamp(0, 100)
        : 0.0;
    final isOverTarget = _model.totalCalories > _model.targetCalories;
    
    return Container(
      padding: const EdgeInsets.all(20.0),
      decoration: BoxDecoration(
        gradient: LinearGradient(
          colors: [
            FlutterFlowTheme.of(context).primary,
            FlutterFlowTheme.of(context).primary.withOpacity(0.8),
          ],
          begin: Alignment.topLeft,
          end: Alignment.bottomRight,
        ),
        borderRadius: BorderRadius.circular(16.0),
        boxShadow: [
          BoxShadow(
            color: FlutterFlowTheme.of(context).primary.withOpacity(0.3),
            blurRadius: 8.0,
            offset: const Offset(0, 4),
          ),
        ],
      ),
      child: Column(
        children: [
          Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              Text(
                '오늘의 칼로리',
                style: FlutterFlowTheme.of(context).titleMedium.override(
                      fontFamily: 'Inter',
                      color: Colors.white,
                      letterSpacing: 0.0,
                    ),
              ),
              Container(
                padding: const EdgeInsets.symmetric(horizontal: 12.0, vertical: 6.0),
                decoration: BoxDecoration(
                  color: Colors.white.withOpacity(0.2),
                  borderRadius: BorderRadius.circular(20.0),
                ),
                child: Text(
                  '${percentage.toStringAsFixed(0)}%',
                  style: FlutterFlowTheme.of(context).bodySmall.override(
                        fontFamily: 'Inter',
                        color: Colors.white,
                        letterSpacing: 0.0,
                        fontWeight: FontWeight.w600,
                      ),
                ),
              ),
            ],
          ),
          const SizedBox(height: 16.0),
          Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Text(
                    '${_model.totalCalories.toStringAsFixed(0)}',
                    style: FlutterFlowTheme.of(context).displaySmall.override(
                          fontFamily: 'Inter',
                          color: Colors.white,
                          letterSpacing: 0.0,
                          fontWeight: FontWeight.bold,
                        ),
                  ),
                  Text(
                    'kcal 섭취',
                    style: FlutterFlowTheme.of(context).bodyMedium.override(
                          fontFamily: 'Inter',
                          color: Colors.white.withOpacity(0.8),
                          letterSpacing: 0.0,
                        ),
                  ),
                ],
              ),
              Column(
                crossAxisAlignment: CrossAxisAlignment.end,
                children: [
                  Text(
                    '${_model.targetCalories.toStringAsFixed(0)}',
                    style: FlutterFlowTheme.of(context).titleLarge.override(
                          fontFamily: 'Inter',
                          color: Colors.white.withOpacity(0.8),
                          letterSpacing: 0.0,
                        ),
                  ),
                  Text(
                    'kcal 목표',
                    style: FlutterFlowTheme.of(context).bodyMedium.override(
                          fontFamily: 'Inter',
                          color: Colors.white.withOpacity(0.8),
                          letterSpacing: 0.0,
                        ),
                  ),
                ],
              ),
            ],
          ),
          const SizedBox(height: 16.0),
          LinearProgressIndicator(
            value: percentage / 100,
            backgroundColor: Colors.white.withOpacity(0.3),
            valueColor: AlwaysStoppedAnimation<Color>(
              isOverTarget ? Colors.red : Colors.white,
            ),
          ),
          if (isOverTarget) ...[
            const SizedBox(height: 8.0),
            Text(
              '목표를 ${(_model.totalCalories - _model.targetCalories).toStringAsFixed(0)}kcal 초과했습니다',
              style: FlutterFlowTheme.of(context).bodySmall.override(
                    fontFamily: 'Inter',
                    color: Colors.red[200],
                    letterSpacing: 0.0,
                  ),
            ),
          ],
        ],
      ),
    );
  }

  Widget _buildMacroNutrientsChart() {
    return Container(
      padding: const EdgeInsets.all(20.0),
      decoration: BoxDecoration(
        color: FlutterFlowTheme.of(context).secondaryBackground,
        borderRadius: BorderRadius.circular(16.0),
        border: Border.all(
          color: FlutterFlowTheme.of(context).alternate,
        ),
      ),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Text(
            '3대 영양소',
            style: FlutterFlowTheme.of(context).titleMedium.override(
                  fontFamily: 'Inter',
                  letterSpacing: 0.0,
                  fontWeight: FontWeight.w600,
                ),
          ),
          const SizedBox(height: 20.0),
          _buildMacroNutrientBar('탄수화물', _model.carbsConsumed, _model.carbsTarget, Colors.orange),
          const SizedBox(height: 16.0),
          _buildMacroNutrientBar('단백질', _model.proteinConsumed, _model.proteinTarget, Colors.red),
          const SizedBox(height: 16.0),
          _buildMacroNutrientBar('지방', _model.fatConsumed, _model.fatTarget, Colors.blue),
        ],
      ),
    );
  }

  Widget _buildMacroNutrientBar(String label, double consumed, double target, Color color) {
    final percentage = target > 0 ? (consumed / target * 100).clamp(0, 100) : 0.0;
    
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Row(
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          children: [
            Text(
              label,
              style: FlutterFlowTheme.of(context).bodyMedium.override(
                    fontFamily: 'Inter',
                    letterSpacing: 0.0,
                    fontWeight: FontWeight.w500,
                  ),
            ),
            Text(
              '${consumed.toStringAsFixed(0)}g / ${target.toStringAsFixed(0)}g',
              style: FlutterFlowTheme.of(context).bodyMedium.override(
                    fontFamily: 'Inter',
                    letterSpacing: 0.0,
                    fontWeight: FontWeight.w600,
                  ),
            ),
          ],
        ),
        const SizedBox(height: 8.0),
        LinearProgressIndicator(
          value: percentage / 100,
          backgroundColor: color.withOpacity(0.2),
          valueColor: AlwaysStoppedAnimation<Color>(color),
        ),
        const SizedBox(height: 4.0),
        Text(
          '${percentage.toStringAsFixed(0)}%',
          style: FlutterFlowTheme.of(context).bodySmall.override(
                fontFamily: 'Inter',
                letterSpacing: 0.0,
                color: FlutterFlowTheme.of(context).secondaryText,
              ),
        ),
      ],
    );
  }

  Widget _buildMealBreakdown() {
    return Container(
      padding: const EdgeInsets.all(20.0),
      decoration: BoxDecoration(
        color: FlutterFlowTheme.of(context).secondaryBackground,
        borderRadius: BorderRadius.circular(16.0),
        border: Border.all(
          color: FlutterFlowTheme.of(context).alternate,
        ),
      ),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Text(
            '식사별 분석',
            style: FlutterFlowTheme.of(context).titleMedium.override(
                  fontFamily: 'Inter',
                  letterSpacing: 0.0,
                  fontWeight: FontWeight.w600,
                ),
          ),
          const SizedBox(height: 16.0),
          _buildMealItem('아침', _model.breakfastCalories, Icons.wb_sunny_outlined),
          _buildMealItem('점심', _model.lunchCalories, Icons.wb_sunny),
          _buildMealItem('저녁', _model.dinnerCalories, Icons.nights_stay_outlined),
          _buildMealItem('간식', _model.snackCalories, Icons.cookie_outlined),
        ],
      ),
    );
  }

  Widget _buildMealItem(String mealName, double calories, IconData icon) {
    return Padding(
      padding: const EdgeInsetsDirectional.fromSTEB(0.0, 0.0, 0.0, 12.0),
      child: Row(
        children: [
          Container(
            width: 40.0,
            height: 40.0,
            decoration: BoxDecoration(
              color: FlutterFlowTheme.of(context).primary.withOpacity(0.1),
              shape: BoxShape.circle,
            ),
            child: Icon(
              icon,
              color: FlutterFlowTheme.of(context).primary,
              size: 20.0,
            ),
          ),
          const SizedBox(width: 16.0),
          Expanded(
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Text(
                  mealName,
                  style: FlutterFlowTheme.of(context).bodyMedium.override(
                        fontFamily: 'Inter',
                        letterSpacing: 0.0,
                        fontWeight: FontWeight.w500,
                      ),
                ),
                Text(
                  '${calories.toStringAsFixed(0)} kcal',
                  style: FlutterFlowTheme.of(context).bodySmall.override(
                        fontFamily: 'Inter',
                        letterSpacing: 0.0,
                        color: FlutterFlowTheme.of(context).secondaryText,
                      ),
                ),
              ],
            ),
          ),
          Container(
            width: 60.0,
            height: 8.0,
            decoration: BoxDecoration(
              color: FlutterFlowTheme.of(context).alternate,
              borderRadius: BorderRadius.circular(4.0),
            ),
            child: FractionallySizedBox(
              alignment: Alignment.centerLeft,
              widthFactor: (calories / _model.targetCalories).clamp(0.0, 1.0),
              child: Container(
                decoration: BoxDecoration(
                  color: FlutterFlowTheme.of(context).primary,
                  borderRadius: BorderRadius.circular(4.0),
                ),
              ),
            ),
          ),
        ],
      ),
    );
  }

  Widget _buildGoalAchievement() {
    return Container(
      padding: const EdgeInsets.all(20.0),
      decoration: BoxDecoration(
        color: FlutterFlowTheme.of(context).secondaryBackground,
        borderRadius: BorderRadius.circular(16.0),
        border: Border.all(
          color: FlutterFlowTheme.of(context).alternate,
        ),
      ),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Text(
            '목표 달성률',
            style: FlutterFlowTheme.of(context).titleMedium.override(
                  fontFamily: 'Inter',
                  letterSpacing: 0.0,
                  fontWeight: FontWeight.w600,
                ),
          ),
          const SizedBox(height: 16.0),
          _buildAchievementItem('칼로리', _model.calorieAchievement, Colors.blue),
          _buildAchievementItem('탄수화물', _model.carbsAchievement, Colors.orange),
          _buildAchievementItem('단백질', _model.proteinAchievement, Colors.red),
          _buildAchievementItem('지방', _model.fatAchievement, Colors.green),
        ],
      ),
    );
  }

  Widget _buildAchievementItem(String label, double achievement, Color color) {
    return Padding(
      padding: const EdgeInsetsDirectional.fromSTEB(0.0, 0.0, 0.0, 12.0),
      child: Row(
        children: [
          Expanded(
            flex: 2,
            child: Text(
              label,
              style: FlutterFlowTheme.of(context).bodyMedium.override(
                    fontFamily: 'Inter',
                    letterSpacing: 0.0,
                  ),
            ),
          ),
          Expanded(
            flex: 3,
            child: LinearProgressIndicator(
              value: achievement / 100,
              backgroundColor: color.withOpacity(0.2),
              valueColor: AlwaysStoppedAnimation<Color>(color),
            ),
          ),
          const SizedBox(width: 12.0),
          SizedBox(
            width: 50.0,
            child: Text(
              '${achievement.toStringAsFixed(0)}%',
              style: FlutterFlowTheme.of(context).bodyMedium.override(
                    fontFamily: 'Inter',
                    letterSpacing: 0.0,
                    fontWeight: FontWeight.w600,
                  ),
              textAlign: TextAlign.end,
            ),
          ),
        ],
      ),
    );
  }

  Widget _buildHealthScore() {
    return Container(
      padding: const EdgeInsets.all(20.0),
      decoration: BoxDecoration(
        gradient: LinearGradient(
          colors: [
            FlutterFlowTheme.of(context).success,
            FlutterFlowTheme.of(context).success.withOpacity(0.8),
          ],
          begin: Alignment.topLeft,
          end: Alignment.bottomRight,
        ),
        borderRadius: BorderRadius.circular(16.0),
      ),
      child: Row(
        children: [
          Expanded(
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Text(
                  '건강 점수',
                  style: FlutterFlowTheme.of(context).titleMedium.override(
                        fontFamily: 'Inter',
                        color: Colors.white,
                        letterSpacing: 0.0,
                      ),
                ),
                const SizedBox(height: 8.0),
                Text(
                  '${_model.healthScore.toStringAsFixed(0)}점',
                  style: FlutterFlowTheme.of(context).displaySmall.override(
                        fontFamily: 'Inter',
                        color: Colors.white,
                        letterSpacing: 0.0,
                        fontWeight: FontWeight.bold,
                      ),
                ),
                Text(
                  _getHealthScoreMessage(_model.healthScore),
                  style: FlutterFlowTheme.of(context).bodySmall.override(
                        fontFamily: 'Inter',
                        color: Colors.white.withOpacity(0.8),
                        letterSpacing: 0.0,
                      ),
                ),
              ],
            ),
          ),
          Container(
            width: 80.0,
            height: 80.0,
            decoration: BoxDecoration(
              color: Colors.white.withOpacity(0.2),
              shape: BoxShape.circle,
            ),
            child: Center(
              child: Text(
                '${_model.healthScore.toStringAsFixed(0)}',
                style: FlutterFlowTheme.of(context).titleLarge.override(
                      fontFamily: 'Inter',
                      color: Colors.white,
                      letterSpacing: 0.0,
                      fontWeight: FontWeight.bold,
                    ),
              ),
            ),
          ),
        ],
      ),
    );
  }

  Widget _buildMicroNutrientsStatus() {
    return Container(
      padding: const EdgeInsets.all(20.0),
      decoration: BoxDecoration(
        color: FlutterFlowTheme.of(context).secondaryBackground,
        borderRadius: BorderRadius.circular(16.0),
        border: Border.all(
          color: FlutterFlowTheme.of(context).alternate,
        ),
      ),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Text(
            '미량 영양소 현황',
            style: FlutterFlowTheme.of(context).titleMedium.override(
                  fontFamily: 'Inter',
                  letterSpacing: 0.0,
                  fontWeight: FontWeight.w600,
                ),
          ),
          const SizedBox(height: 16.0),
          _buildMicroNutrientItem('비타민 C', _model.vitaminC, 90.0, 'mg'),
          _buildMicroNutrientItem('칼슘', _model.calcium, 1000.0, 'mg'),
          _buildMicroNutrientItem('철분', _model.iron, 18.0, 'mg'),
          _buildMicroNutrientItem('마그네슘', _model.magnesium, 400.0, 'mg'),
        ],
      ),
    );
  }

  Widget _buildMicroNutrientItem(String name, double consumed, double target, String unit) {
    final percentage = target > 0 ? (consumed / target * 100).clamp(0, 100) : 0.0;
    final isAdequate = percentage >= 80.0;
    
    return Padding(
      padding: const EdgeInsetsDirectional.fromSTEB(0.0, 0.0, 0.0, 12.0),
      child: Row(
        children: [
          Expanded(
            flex: 2,
            child: Text(
              name,
              style: FlutterFlowTheme.of(context).bodyMedium.override(
                    fontFamily: 'Inter',
                    letterSpacing: 0.0,
                  ),
            ),
          ),
          Expanded(
            flex: 2,
            child: Text(
              '${consumed.toStringAsFixed(0)} / ${target.toStringAsFixed(0)} $unit',
              style: FlutterFlowTheme.of(context).bodySmall.override(
                    fontFamily: 'Inter',
                    letterSpacing: 0.0,
                    color: FlutterFlowTheme.of(context).secondaryText,
                  ),
            ),
          ),
          Expanded(
            flex: 2,
            child: LinearProgressIndicator(
              value: percentage / 100,
              backgroundColor: isAdequate 
                  ? FlutterFlowTheme.of(context).success.withOpacity(0.2)
                  : FlutterFlowTheme.of(context).warning.withOpacity(0.2),
              valueColor: AlwaysStoppedAnimation<Color>(
                isAdequate 
                    ? FlutterFlowTheme.of(context).success
                    : FlutterFlowTheme.of(context).warning,
              ),
            ),
          ),
          const SizedBox(width: 12.0),
          SizedBox(
            width: 40.0,
            child: Text(
              '${percentage.toStringAsFixed(0)}%',
              style: FlutterFlowTheme.of(context).bodySmall.override(
                    fontFamily: 'Inter',
                    letterSpacing: 0.0,
                    fontWeight: FontWeight.w600,
                    color: isAdequate 
                        ? FlutterFlowTheme.of(context).success
                        : FlutterFlowTheme.of(context).warning,
                  ),
              textAlign: TextAlign.end,
            ),
          ),
        ],
      ),
    );
  }

  Widget _buildWeeklyTrend() {
    return Container(
      padding: const EdgeInsets.all(20.0),
      decoration: BoxDecoration(
        color: FlutterFlowTheme.of(context).secondaryBackground,
        borderRadius: BorderRadius.circular(16.0),
        border: Border.all(
          color: FlutterFlowTheme.of(context).alternate,
        ),
      ),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Text(
            '주간 트렌드',
            style: FlutterFlowTheme.of(context).titleMedium.override(
                  fontFamily: 'Inter',
                  letterSpacing: 0.0,
                  fontWeight: FontWeight.w600,
                ),
          ),
          const SizedBox(height: 16.0),
          SizedBox(
            height: 120.0,
            child: Row(
              mainAxisAlignment: MainAxisAlignment.spaceEvenly,
              crossAxisAlignment: CrossAxisAlignment.end,
              children: _model.weeklyCalories.asMap().entries.map((entry) {
                final index = entry.key;
                final calories = entry.value;
                final maxCalories = _model.weeklyCalories.reduce((a, b) => a > b ? a : b);
                final height = maxCalories > 0 ? (calories / maxCalories) : 0.0;
                final isToday = index == 6; // 마지막 날이 오늘
                
                return Column(
                  mainAxisAlignment: MainAxisAlignment.end,
                  children: [
                    Text(
                      '${calories.toStringAsFixed(0)}',
                      style: FlutterFlowTheme.of(context).bodySmall.override(
                            fontFamily: 'Inter',
                            letterSpacing: 0.0,
                            color: FlutterFlowTheme.of(context).secondaryText,
                          ),
                    ),
                    const SizedBox(height: 4.0),
                    Container(
                      width: 20.0,
                      height: height * 80.0,
                      decoration: BoxDecoration(
                        color: isToday 
                            ? FlutterFlowTheme.of(context).primary
                            : FlutterFlowTheme.of(context).primary.withOpacity(0.6),
                        borderRadius: BorderRadius.circular(10.0),
                      ),
                    ),
                    const SizedBox(height: 4.0),
                    Text(
                      _getDayName(index),
                      style: FlutterFlowTheme.of(context).bodySmall.override(
                            fontFamily: 'Inter',
                            letterSpacing: 0.0,
                            color: FlutterFlowTheme.of(context).secondaryText,
                          ),
                    ),
                  ],
                );
              }).toList(),
            ),
          ),
        ],
      ),
    );
  }

  // Helper methods
  String _formatDate(DateTime date) {
    return '${date.month}월 ${date.day}일';
  }

  String _getDayOfWeek(DateTime date) {
    const days = ['월', '화', '수', '목', '금', '토', '일'];
    return days[date.weekday - 1];
  }

  String _getDayName(int index) {
    const days = ['월', '화', '수', '목', '금', '토', '일'];
    return days[index];
  }

  String _getHealthScoreMessage(double score) {
    if (score >= 90) return '훌륭합니다!';
    if (score >= 80) return '좋습니다!';
    if (score >= 70) return '보통입니다.';
    if (score >= 60) return '개선이 필요합니다.';
    return '주의가 필요합니다.';
  }

  void _changeDate(int days) {
    setState(() {
      _model.selectedDate = _model.selectedDate.add(Duration(days: days));
    });
    _loadNutritionData();
  }

  Future<void> _refreshData() async {
    await _loadNutritionData();
    ScaffoldMessenger.of(context).showSnackBar(
      const SnackBar(content: Text('데이터가 새로고침되었습니다!')),
    );
  }

  Future<void> _loadNutritionData() async {
    setState(() {
      _model.isLoading = true;
    });

    try {
      final currentUser = currentUserDocument;
      if (currentUser != null) {
        // 영양 분석 데이터 로드
        final analysisData = await queryNutritionAnalysisRecordOnce(
          queryBuilder: (query) => query
              .where('user_id', isEqualTo: currentUser.uid)
              .where('analysis_date', isEqualTo: _model.selectedDate)
              .limit(1),
        );

        if (analysisData.isNotEmpty) {
          final analysis = analysisData.first;
          _model.totalCalories = analysis.totalCalories;
          _model.targetCalories = analysis.targetCalories;
          
          final macroNutrients = analysis.macroNutrients;
          _model.carbsConsumed = (macroNutrients['carbs'] as num?)?.toDouble() ?? 0.0;
          _model.proteinConsumed = (macroNutrients['protein'] as num?)?.toDouble() ?? 0.0;
          _model.fatConsumed = (macroNutrients['fat'] as num?)?.toDouble() ?? 0.0;
          
          final mealBreakdown = analysis.mealBreakdown;
          _model.breakfastCalories = (mealBreakdown['breakfast'] as num?)?.toDouble() ?? 0.0;
          _model.lunchCalories = (mealBreakdown['lunch'] as num?)?.toDouble() ?? 0.0;
          _model.dinnerCalories = (mealBreakdown['dinner'] as num?)?.toDouble() ?? 0.0;
          _model.snackCalories = (mealBreakdown['snack'] as num?)?.toDouble() ?? 0.0;
          
          final microNutrients = analysis.microNutrients;
          _model.vitaminC = (microNutrients['vitaminC'] as num?)?.toDouble() ?? 0.0;
          _model.calcium = (microNutrients['calcium'] as num?)?.toDouble() ?? 0.0;
          _model.iron = (microNutrients['iron'] as num?)?.toDouble() ?? 0.0;
          _model.magnesium = (microNutrients['magnesium'] as num?)?.toDouble() ?? 0.0;
          
          _model.healthScore = analysis.healthScore;
        } else {
          // 샘플 데이터로 초기화
          _initializeSampleData();
        }

        // 영양 목표 로드
        await _loadNutritionGoals();
        
        // 주간 데이터 로드
        await _loadWeeklyData();
        
        // 달성률 계산
        _calculateAchievements();
      }
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

  void _initializeSampleData() {
    _model.totalCalories = 1850.0;
    _model.carbsConsumed = 230.0;
    _model.proteinConsumed = 95.0;
    _model.fatConsumed = 65.0;
    _model.breakfastCalories = 450.0;
    _model.lunchCalories = 650.0;
    _model.dinnerCalories = 600.0;
    _model.snackCalories = 150.0;
    _model.vitaminC = 75.0;
    _model.calcium = 850.0;
    _model.iron = 15.0;
    _model.magnesium = 320.0;
    _model.healthScore = 85.0;
  }

  Future<void> _loadNutritionGoals() async {
    final currentUser = currentUserDocument;
    if (currentUser != null) {
      final nutritionGoals = await queryNutritionGoalsRecordOnce(
        queryBuilder: (query) => query
            .where('user_id', isEqualTo: currentUser.uid)
            .where('is_active', isEqualTo: true)
            .orderBy('created_at', descending: true)
            .limit(1),
      );

      if (nutritionGoals.isNotEmpty) {
        final goal = nutritionGoals.first;
        _model.targetCalories = goal.dailyCalories;
        
        final macroRatios = goal.macroRatios;
        final carbRatio = (macroRatios['carbohydrate'] as num?)?.toDouble() ?? 50.0;
        final proteinRatio = (macroRatios['protein'] as num?)?.toDouble() ?? 25.0;
        final fatRatio = (macroRatios['fat'] as num?)?.toDouble() ?? 25.0;
        
        _model.carbsTarget = _model.targetCalories * (carbRatio / 100) / 4;
        _model.proteinTarget = _model.targetCalories * (proteinRatio / 100) / 4;
        _model.fatTarget = _model.targetCalories * (fatRatio / 100) / 9;
      } else {
        _model.targetCalories = 2000.0;
        _model.carbsTarget = 250.0;
        _model.proteinTarget = 125.0;
        _model.fatTarget = 56.0;
      }
    }
  }

  Future<void> _loadWeeklyData() async {
    // 샘플 주간 데이터
    _model.weeklyCalories = [1800, 1950, 2100, 1750, 2200, 1900, 1850];
  }

  void _calculateAchievements() {
    _model.calorieAchievement = _model.targetCalories > 0 
        ? (_model.totalCalories / _model.targetCalories * 100).clamp(0, 100)
        : 0.0;
    _model.carbsAchievement = _model.carbsTarget > 0 
        ? (_model.carbsConsumed / _model.carbsTarget * 100).clamp(0, 100)
        : 0.0;
    _model.proteinAchievement = _model.proteinTarget > 0 
        ? (_model.proteinConsumed / _model.proteinTarget * 100).clamp(0, 100)
        : 0.0;
    _model.fatAchievement = _model.fatTarget > 0 
        ? (_model.fatConsumed / _model.fatTarget * 100).clamp(0, 100)
        : 0.0;
  }
}
