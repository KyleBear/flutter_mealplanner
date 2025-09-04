import '/auth/firebase_auth/auth_util.dart';
import '/backend/backend.dart';
import '/flutter_flow/flutter_flow_theme.dart';
import '/flutter_flow/flutter_flow_util.dart';
import '/flutter_flow/flutter_flow_widgets.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:provider/provider.dart';
import 'package:table_calendar/table_calendar.dart';
import 'enhanced_dashboard_model.dart';
export 'enhanced_dashboard_model.dart';

class EnhancedDashboardWidget extends StatefulWidget {
  const EnhancedDashboardWidget({super.key});

  @override
  State<EnhancedDashboardWidget> createState() => _EnhancedDashboardWidgetState();
}

class _EnhancedDashboardWidgetState extends State<EnhancedDashboardWidget> {
  late EnhancedDashboardModel _model;

  final scaffoldKey = GlobalKey<ScaffoldState>();

  @override
  void initState() {
    super.initState();
    _model = createModel(context, () => EnhancedDashboardModel());

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
          title: Text(
            '식단 캘린더',
            style: FlutterFlowTheme.of(context).headlineMedium.override(
                  fontFamily: 'Inter',
                  letterSpacing: 0.0,
                ),
          ),
          actions: [
            IconButton(
              icon: Icon(
                Icons.add_rounded,
                color: FlutterFlowTheme.of(context).primaryText,
                size: 24.0,
              ),
              onPressed: () async {
                await _showAddMealBottomSheet();
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
                // 오늘의 요약 카드
                _buildTodaySummaryCard(),
                
                // 캘린더
                _buildCalendar(),
                
                // 선택된 날짜의 식사 기록
                _buildSelectedDateMeals(),
                
                // 주간 영양 트렌드
                _buildWeeklyNutritionTrend(),
                
                const SizedBox(height: 16.0),
              ],
            ),
          ),
        ),
      ),
    );
  }

  Widget _buildTodaySummaryCard() {
    return Container(
      margin: const EdgeInsetsDirectional.fromSTEB(16.0, 16.0, 16.0, 0.0),
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
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              Text(
                '오늘의 식단',
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
                  '${_model.todayHealthScore.toStringAsFixed(0)}점',
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
            children: [
              Expanded(
                child: _buildSummaryItem('섭취', '${_model.todayCalories.toStringAsFixed(0)}', 'kcal', Colors.white),
              ),
              Container(
                width: 1.0,
                height: 40.0,
                color: Colors.white.withOpacity(0.3),
              ),
              Expanded(
                child: _buildSummaryItem('목표', '${_model.dailyCalorieGoal.toStringAsFixed(0)}', 'kcal', Colors.white.withOpacity(0.8)),
              ),
              Container(
                width: 1.0,
                height: 40.0,
                color: Colors.white.withOpacity(0.3),
              ),
              Expanded(
                child: _buildSummaryItem('잔여', '${(_model.dailyCalorieGoal - _model.todayCalories).toStringAsFixed(0)}', 'kcal', Colors.white.withOpacity(0.8)),
              ),
            ],
          ),
          const SizedBox(height: 16.0),
          // 칼로리 진행률 바
          LinearProgressIndicator(
            value: _model.dailyCalorieGoal > 0 ? (_model.todayCalories / _model.dailyCalorieGoal).clamp(0.0, 1.0) : 0.0,
            backgroundColor: Colors.white.withOpacity(0.3),
            valueColor: const AlwaysStoppedAnimation<Color>(Colors.white),
          ),
          const SizedBox(height: 8.0),
          Text(
            _getCalorieStatusMessage(),
            style: FlutterFlowTheme.of(context).bodySmall.override(
                  fontFamily: 'Inter',
                  color: Colors.white.withOpacity(0.8),
                  letterSpacing: 0.0,
                ),
          ),
        ],
      ),
    );
  }

  Widget _buildSummaryItem(String label, String value, String unit, Color color) {
    return Column(
      children: [
        Text(
          value,
          style: FlutterFlowTheme.of(context).titleLarge.override(
                fontFamily: 'Inter',
                color: color,
                letterSpacing: 0.0,
                fontWeight: FontWeight.bold,
              ),
        ),
        Text(
          '$label ($unit)',
          style: FlutterFlowTheme.of(context).bodySmall.override(
                fontFamily: 'Inter',
                color: color.withOpacity(0.8),
                letterSpacing: 0.0,
              ),
        ),
      ],
    );
  }

  Widget _buildCalendar() {
    return Container(
      margin: const EdgeInsetsDirectional.fromSTEB(16.0, 16.0, 16.0, 0.0),
      decoration: BoxDecoration(
        color: FlutterFlowTheme.of(context).secondaryBackground,
        borderRadius: BorderRadius.circular(16.0),
        border: Border.all(
          color: FlutterFlowTheme.of(context).alternate,
        ),
      ),
      child: TableCalendar<MealRecord>(
        firstDay: DateTime.utc(2020, 1, 1),
        lastDay: DateTime.utc(2030, 12, 31),
        focusedDay: _model.focusedDay,
        calendarFormat: _model.calendarFormat,
        eventLoader: _getEventsForDay,
        startingDayOfWeek: StartingDayOfWeek.monday,
        calendarStyle: CalendarStyle(
          outsideDaysVisible: false,
          weekendTextStyle: FlutterFlowTheme.of(context).bodyMedium.override(
                fontFamily: 'Inter',
                letterSpacing: 0.0,
                color: FlutterFlowTheme.of(context).error,
              ),
          holidayTextStyle: FlutterFlowTheme.of(context).bodyMedium.override(
                fontFamily: 'Inter',
                letterSpacing: 0.0,
                color: FlutterFlowTheme.of(context).error,
              ),
          defaultTextStyle: FlutterFlowTheme.of(context).bodyMedium.override(
                fontFamily: 'Inter',
                letterSpacing: 0.0,
              ),
          selectedTextStyle: FlutterFlowTheme.of(context).bodyMedium.override(
                fontFamily: 'Inter',
                letterSpacing: 0.0,
                color: Colors.white,
              ),
          todayTextStyle: FlutterFlowTheme.of(context).bodyMedium.override(
                fontFamily: 'Inter',
                letterSpacing: 0.0,
                color: Colors.white,
                fontWeight: FontWeight.bold,
              ),
          selectedDecoration: BoxDecoration(
            color: FlutterFlowTheme.of(context).primary,
            shape: BoxShape.circle,
          ),
          todayDecoration: BoxDecoration(
            color: FlutterFlowTheme.of(context).primary.withOpacity(0.7),
            shape: BoxShape.circle,
          ),
          markerDecoration: BoxDecoration(
            color: FlutterFlowTheme.of(context).success,
            shape: BoxShape.circle,
          ),
        ),
        headerStyle: HeaderStyle(
          formatButtonVisible: false,
          titleCentered: true,
          titleTextStyle: FlutterFlowTheme.of(context).titleMedium.override(
                fontFamily: 'Inter',
                letterSpacing: 0.0,
                fontWeight: FontWeight.w600,
              ),
        ),
        onDaySelected: (selectedDay, focusedDay) {
          if (!isSameDay(_model.selectedDay, selectedDay)) {
            setState(() {
              _model.selectedDay = selectedDay;
              _model.focusedDay = focusedDay;
            });
            _loadSelectedDateMeals();
          }
        },
        onFormatChanged: (format) {
          if (_model.calendarFormat != format) {
            setState(() {
              _model.calendarFormat = format;
            });
          }
        },
        onPageChanged: (focusedDay) {
          _model.focusedDay = focusedDay;
        },
        calendarBuilders: CalendarBuilders(
          markerBuilder: (context, day, events) {
            if (events.isNotEmpty) {
              return Positioned(
                bottom: 1,
                child: _buildDayMarker(day, events),
              );
            }
            return null;
          },
        ),
      ),
    );
  }

  Widget _buildDayMarker(DateTime day, List<MealRecord> events) {
    final totalCalories = events.fold<double>(0, (sum, meal) => sum + meal.totalCalories);
    final isToday = isSameDay(day, DateTime.now());
    final isSelected = isSameDay(day, _model.selectedDay);
    
    return Container(
      width: 6.0,
      height: 6.0,
      decoration: BoxDecoration(
        color: _getMarkerColor(totalCalories, isToday, isSelected),
        shape: BoxShape.circle,
      ),
    );
  }

  Color _getMarkerColor(double calories, bool isToday, bool isSelected) {
    if (isSelected) return Colors.white;
    if (isToday) return Colors.white;
    
    if (calories >= _model.dailyCalorieGoal * 0.8) return FlutterFlowTheme.of(context).success;
    if (calories >= _model.dailyCalorieGoal * 0.5) return FlutterFlowTheme.of(context).warning;
    return FlutterFlowTheme.of(context).error;
  }

  Widget _buildSelectedDateMeals() {
    return Container(
      margin: const EdgeInsetsDirectional.fromSTEB(16.0, 16.0, 16.0, 0.0),
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
          Padding(
            padding: const EdgeInsets.all(16.0),
            child: Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                Text(
                  _formatSelectedDate(),
                  style: FlutterFlowTheme.of(context).titleMedium.override(
                        fontFamily: 'Inter',
                        letterSpacing: 0.0,
                        fontWeight: FontWeight.w600,
                      ),
                ),
                Text(
                  '${_model.selectedDateMeals.length}개 식사',
                  style: FlutterFlowTheme.of(context).bodyMedium.override(
                        fontFamily: 'Inter',
                        letterSpacing: 0.0,
                        color: FlutterFlowTheme.of(context).secondaryText,
                      ),
                ),
              ],
            ),
          ),
          if (_model.selectedDateMeals.isEmpty)
            _buildEmptyMealsState()
          else
            ..._model.selectedDateMeals.map((meal) => _buildMealCard(meal)),
        ],
      ),
    );
  }

  Widget _buildEmptyMealsState() {
    return Padding(
      padding: const EdgeInsets.all(32.0),
      child: Column(
        children: [
          Icon(
            Icons.restaurant_outlined,
            size: 64.0,
            color: FlutterFlowTheme.of(context).secondaryText,
          ),
          const SizedBox(height: 16.0),
          Text(
            '식사 기록이 없습니다',
            style: FlutterFlowTheme.of(context).titleMedium.override(
                  fontFamily: 'Inter',
                  letterSpacing: 0.0,
                ),
          ),
          const SizedBox(height: 8.0),
          Text(
            '오늘의 식사를 기록해보세요',
            style: FlutterFlowTheme.of(context).bodyMedium.override(
                  fontFamily: 'Inter',
                  letterSpacing: 0.0,
                  color: FlutterFlowTheme.of(context).secondaryText,
                ),
          ),
          const SizedBox(height: 16.0),
          FFButtonWidget(
            onPressed: () async {
              await _showAddMealBottomSheet();
            },
            text: '식사 추가',
            options: FFButtonOptions(
              height: 40.0,
              padding: const EdgeInsetsDirectional.fromSTEB(24.0, 0.0, 24.0, 0.0),
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
              borderRadius: BorderRadius.circular(20.0),
            ),
          ),
        ],
      ),
    );
  }

  Widget _buildMealCard(MealRecord meal) {
    return Container(
      margin: const EdgeInsetsDirectional.fromSTEB(16.0, 0.0, 16.0, 12.0),
      padding: const EdgeInsets.all(16.0),
      decoration: BoxDecoration(
        color: FlutterFlowTheme.of(context).primaryBackground,
        borderRadius: BorderRadius.circular(12.0),
        border: Border.all(
          color: FlutterFlowTheme.of(context).alternate,
        ),
      ),
      child: Row(
        children: [
          // 식사 타입 아이콘
          Container(
            width: 50.0,
            height: 50.0,
            decoration: BoxDecoration(
              color: _getMealTypeColor(meal.mealType).withOpacity(0.1),
              borderRadius: BorderRadius.circular(8.0),
            ),
            child: Icon(
              _getMealTypeIcon(meal.mealType),
              color: _getMealTypeColor(meal.mealType),
              size: 24.0,
            ),
          ),
          
          const SizedBox(width: 16.0),
          
          // 식사 정보
          Expanded(
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Row(
                  children: [
                    Text(
                      meal.mealType,
                      style: FlutterFlowTheme.of(context).titleSmall.override(
                            fontFamily: 'Inter',
                            letterSpacing: 0.0,
                            fontWeight: FontWeight.w600,
                          ),
                    ),
                    const SizedBox(width: 8.0),
                    if (meal.isVerified)
                      Icon(
                        Icons.verified,
                        color: FlutterFlowTheme.of(context).success,
                        size: 16.0,
                      ),
                  ],
                ),
                const SizedBox(height: 4.0),
                Text(
                  _formatMealTime(meal.mealTime),
                  style: FlutterFlowTheme.of(context).bodySmall.override(
                        fontFamily: 'Inter',
                        letterSpacing: 0.0,
                        color: FlutterFlowTheme.of(context).secondaryText,
                      ),
                ),
                const SizedBox(height: 8.0),
                Row(
                  children: [
                    _buildNutritionChip('${meal.totalCalories.toStringAsFixed(0)} kcal', Colors.orange),
                    const SizedBox(width: 8.0),
                    _buildNutritionChip('${meal.foodItems.length}개 음식', Colors.blue),
                  ],
                ),
              ],
            ),
          ),
          
          // 액션 버튼
          PopupMenuButton<String>(
            onSelected: (value) => _handleMealAction(value, meal),
            itemBuilder: (context) => [
              const PopupMenuItem(value: 'edit', child: Text('수정')),
              const PopupMenuItem(value: 'delete', child: Text('삭제')),
            ],
            child: Icon(
              Icons.more_vert,
              color: FlutterFlowTheme.of(context).secondaryText,
            ),
          ),
        ],
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

  Widget _buildWeeklyNutritionTrend() {
    return Container(
      margin: const EdgeInsetsDirectional.fromSTEB(16.0, 16.0, 16.0, 0.0),
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
            '주간 영양 트렌드',
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
  String _formatSelectedDate() {
    final now = DateTime.now();
    final selected = _model.selectedDay;
    
    if (isSameDay(selected, now)) {
      return '오늘 (${selected.month}/${selected.day})';
    } else if (isSameDay(selected, now.subtract(const Duration(days: 1)))) {
      return '어제 (${selected.month}/${selected.day})';
    } else if (isSameDay(selected, now.add(const Duration(days: 1)))) {
      return '내일 (${selected.month}/${selected.day})';
    } else {
      return '${selected.month}월 ${selected.day}일';
    }
  }

  String _formatMealTime(DateTime? mealTime) {
    if (mealTime == null) return '';
    return '${mealTime.hour.toString().padLeft(2, '0')}:${mealTime.minute.toString().padLeft(2, '0')}';
  }

  String _getDayName(int index) {
    const days = ['월', '화', '수', '목', '금', '토', '일'];
    return days[index];
  }

  String _getCalorieStatusMessage() {
    final remaining = _model.dailyCalorieGoal - _model.todayCalories;
    if (remaining > 0) {
      return '${remaining.toStringAsFixed(0)}kcal 더 섭취하세요';
    } else if (remaining < 0) {
      return '${(-remaining).toStringAsFixed(0)}kcal 초과했습니다';
    } else {
      return '목표 칼로리를 달성했습니다!';
    }
  }

  Color _getMealTypeColor(String mealType) {
    switch (mealType) {
      case '아침': return Colors.orange;
      case '점심': return Colors.blue;
      case '저녁': return Colors.purple;
      case '간식': return Colors.green;
      default: return FlutterFlowTheme.of(context).primary;
    }
  }

  IconData _getMealTypeIcon(String mealType) {
    switch (mealType) {
      case '아침': return Icons.wb_sunny_outlined;
      case '점심': return Icons.wb_sunny;
      case '저녁': return Icons.nights_stay_outlined;
      case '간식': return Icons.cookie_outlined;
      default: return Icons.restaurant;
    }
  }

  List<MealRecord> _getEventsForDay(DateTime day) {
    return _model.allMeals.where((meal) => isSameDay(meal.mealDate, day)).toList();
  }

  void _handleMealAction(String action, MealRecord meal) {
    switch (action) {
      case 'edit':
        _showEditMealBottomSheet(meal);
        break;
      case 'delete':
        _deleteMeal(meal);
        break;
    }
  }

  Future<void> _showAddMealBottomSheet() async {
    await showModalBottomSheet(
      context: context,
      isScrollControlled: true,
      backgroundColor: Colors.transparent,
      builder: (context) => _buildAddMealBottomSheet(),
    );
  }

  Future<void> _showEditMealBottomSheet(MealRecord meal) async {
    await showModalBottomSheet(
      context: context,
      isScrollControlled: true,
      backgroundColor: Colors.transparent,
      builder: (context) => _buildEditMealBottomSheet(meal),
    );
  }

  Widget _buildAddMealBottomSheet() {
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
                  '식사 추가',
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
            
            // 식사 타입 선택
            Text(
              '식사 타입',
              style: FlutterFlowTheme.of(context).titleMedium.override(
                    fontFamily: 'Inter',
                    letterSpacing: 0.0,
                    fontWeight: FontWeight.w600,
                  ),
            ),
            const SizedBox(height: 12.0),
            Wrap(
              spacing: 8.0,
              children: ['아침', '점심', '저녁', '간식'].map((type) {
                final isSelected = _model.selectedMealType == type;
                return FilterChip(
                  label: Text(type),
                  selected: isSelected,
                  onSelected: (selected) {
                    setState(() {
                      _model.selectedMealType = selected ? type : '';
                    });
                  },
                );
              }).toList(),
            ),
            
            const SizedBox(height: 20.0),
            
            // 식사 시간
            Text(
              '식사 시간',
              style: FlutterFlowTheme.of(context).titleMedium.override(
                    fontFamily: 'Inter',
                    letterSpacing: 0.0,
                    fontWeight: FontWeight.w600,
                  ),
            ),
            const SizedBox(height: 12.0),
            InkWell(
              onTap: () async {
                final time = await showTimePicker(
                  context: context,
                  initialTime: TimeOfDay.now(),
                );
                if (time != null) {
                  setState(() {
                    _model.selectedMealTime = DateTime(
                      _model.selectedDay.year,
                      _model.selectedDay.month,
                      _model.selectedDay.day,
                      time.hour,
                      time.minute,
                    );
                  });
                }
              },
              child: Container(
                padding: const EdgeInsets.all(16.0),
                decoration: BoxDecoration(
                  border: Border.all(
                    color: FlutterFlowTheme.of(context).alternate,
                  ),
                  borderRadius: BorderRadius.circular(8.0),
                ),
                child: Row(
                  children: [
                    Icon(
                      Icons.access_time,
                      color: FlutterFlowTheme.of(context).primaryText,
                    ),
                    const SizedBox(width: 12.0),
                    Text(
                      _model.selectedMealTime != null
                          ? _formatMealTime(_model.selectedMealTime)
                          : '시간 선택',
                      style: FlutterFlowTheme.of(context).bodyMedium.override(
                            fontFamily: 'Inter',
                            letterSpacing: 0.0,
                          ),
                    ),
                  ],
                ),
              ),
            ),
            
            const Spacer(),
            
            // 저장 버튼
            FFButtonWidget(
              onPressed: _model.selectedMealType.isEmpty || _model.selectedMealTime == null
                  ? null
                  : () async {
                      await _saveMeal();
                      Navigator.pop(context);
                    },
              text: '식사 저장',
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

  Widget _buildEditMealBottomSheet(MealRecord meal) {
    // 편집 모달 구현
    return Container(
      height: MediaQuery.of(context).size.height * 0.5,
      decoration: BoxDecoration(
        color: FlutterFlowTheme.of(context).secondaryBackground,
        borderRadius: const BorderRadius.only(
          topLeft: Radius.circular(20.0),
          topRight: Radius.circular(20.0),
        ),
      ),
      child: const Center(
        child: Text('식사 편집 기능은 추후 구현 예정입니다.'),
      ),
    );
  }

  Future<void> _saveMeal() async {
    final currentUser = currentUserDocument;
    if (currentUser != null && _model.selectedMealType.isNotEmpty && _model.selectedMealTime != null) {
      final mealRecordId = DateTime.now().millisecondsSinceEpoch.toString();
      
      await MealRecord.collection.add(createMealRecordData(
        mealRecordId: mealRecordId,
        userId: currentUser.uid,
        mealDate: _model.selectedDay,
        mealType: _model.selectedMealType,
        mealTime: _model.selectedMealTime,
        foodItems: [], // 추후 식품 추가 기능으로 확장
        totalCalories: 0.0, // 추후 계산 로직 추가
        totalNutrition: {},
        mealImage: '',
        notes: '',
        isVerified: false,
        createdAt: DateTime.now(),
        updatedAt: DateTime.now(),
      ));

      ScaffoldMessenger.of(context).showSnackBar(
        const SnackBar(content: Text('식사가 추가되었습니다!')),
      );
      
      await _loadMealData();
    }
  }

  Future<void> _deleteMeal(MealRecord meal) async {
    await meal.reference.delete();
    ScaffoldMessenger.of(context).showSnackBar(
      const SnackBar(content: Text('식사가 삭제되었습니다!')),
    );
    await _loadMealData();
  }

  Future<void> _loadMealData() async {
    setState(() {
      _model.isLoading = true;
    });

    try {
      final currentUser = currentUserDocument;
      if (currentUser != null) {
        // 오늘의 식사 데이터 로드
        final todayMeals = await queryMealRecordOnce(
          queryBuilder: (query) => query
              .where('user_id', isEqualTo: currentUser.uid)
              .where('meal_date', isEqualTo: DateTime.now())
              .orderBy('meal_time'),
        );

        // 모든 식사 데이터 로드 (캘린더용)
        _model.allMeals = await queryMealRecordOnce(
          queryBuilder: (query) => query
              .where('user_id', isEqualTo: currentUser.uid)
              .orderBy('meal_date', descending: true)
              .limit(100),
        );

        // 오늘의 칼로리 계산
        _model.todayCalories = todayMeals.fold<double>(0, (sum, meal) => sum + meal.totalCalories);

        // 선택된 날짜의 식사 로드
        await _loadSelectedDateMeals();

        // 주간 데이터 로드
        await _loadWeeklyData();

        // 건강 점수 계산
        _model.todayHealthScore = _calculateHealthScore();
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

  Future<void> _loadSelectedDateMeals() async {
    _model.selectedDateMeals = _model.allMeals
        .where((meal) => isSameDay(meal.mealDate, _model.selectedDay))
        .toList();
  }

  Future<void> _loadWeeklyData() async {
    // 최근 7일간의 칼로리 데이터 생성 (샘플)
    _model.weeklyCalories = [1800, 1950, 2100, 1750, 2200, 1900, _model.todayCalories];
  }

  double _calculateHealthScore() {
    // 간단한 건강 점수 계산 로직
    final calorieRatio = _model.dailyCalorieGoal > 0 ? (_model.todayCalories / _model.dailyCalorieGoal) : 0.0;
    
    if (calorieRatio >= 0.8 && calorieRatio <= 1.2) {
      return 90.0; // 목표 범위 내
    } else if (calorieRatio >= 0.6 && calorieRatio <= 1.4) {
      return 70.0; // 적당한 범위
    } else {
      return 50.0; // 개선 필요
    }
  }

  @override
  void initState() {
    super.initState();
    _loadMealData();
  }
}
