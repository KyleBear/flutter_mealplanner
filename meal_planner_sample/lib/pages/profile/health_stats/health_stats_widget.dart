import '/auth/firebase_auth/auth_util.dart';
import '/backend/backend.dart';
import '/flutter_flow/flutter_flow_theme.dart';
import '/flutter_flow/flutter_flow_util.dart';
import '/flutter_flow/flutter_flow_widgets.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:provider/provider.dart';
import 'health_stats_model.dart';
export 'health_stats_model.dart';

class HealthStatsWidget extends StatefulWidget {
  const HealthStatsWidget({super.key});

  @override
  State<HealthStatsWidget> createState() => _HealthStatsWidgetState();
}

class _HealthStatsWidgetState extends State<HealthStatsWidget> {
  late HealthStatsModel _model;

  final scaffoldKey = GlobalKey<ScaffoldState>();

  @override
  void initState() {
    super.initState();
    _model = createModel(context, () => HealthStatsModel());

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
            '건강 통계',
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
                await _showAddStatsBottomSheet();
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
                    '나의 건강 변화를\n추적해보세요',
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
                      // 오늘의 요약
                      _buildTodaySummary(),
                      
                      const SizedBox(height: 24.0),
                      
                      // 체중 변화 차트
                      _buildWeightTrendChart(),
                      
                      const SizedBox(height: 24.0),
                      
                      // 주요 지표
                      _buildKeyMetrics(),
                      
                      const SizedBox(height: 24.0),
                      
                      // 주간 활동 요약
                      _buildWeeklyActivitySummary(),
                      
                      const SizedBox(height: 24.0),
                      
                      // 최근 기록
                      _buildRecentRecords(),
                      
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

  Widget _buildTodaySummary() {
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
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              Text(
                '오늘의 건강',
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
                child: _buildSummaryItem('체중', '${_model.todayWeight.toStringAsFixed(1)}', 'kg', Colors.white),
              ),
              Container(
                width: 1.0,
                height: 40.0,
                color: Colors.white.withOpacity(0.3),
              ),
              Expanded(
                child: _buildSummaryItem('걸음', '${_model.todaySteps}', '걸음', Colors.white.withOpacity(0.8)),
              ),
              Container(
                width: 1.0,
                height: 40.0,
                color: Colors.white.withOpacity(0.3),
              ),
              Expanded(
                child: _buildSummaryItem('운동', '${_model.todayExerciseMinutes}', '분', Colors.white.withOpacity(0.8)),
              ),
            ],
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

  Widget _buildWeightTrendChart() {
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
          Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              Text(
                '체중 변화',
                style: FlutterFlowTheme.of(context).titleMedium.override(
                      fontFamily: 'Inter',
                      letterSpacing: 0.0,
                      fontWeight: FontWeight.w600,
                    ),
              ),
              Text(
                '최근 7일',
                style: FlutterFlowTheme.of(context).bodySmall.override(
                      fontFamily: 'Inter',
                      letterSpacing: 0.0,
                      color: FlutterFlowTheme.of(context).secondaryText,
                    ),
              ),
            ],
          ),
          const SizedBox(height: 16.0),
          SizedBox(
            height: 120.0,
            child: Row(
              mainAxisAlignment: MainAxisAlignment.spaceEvenly,
              crossAxisAlignment: CrossAxisAlignment.end,
              children: _model.weightHistory.asMap().entries.map((entry) {
                final index = entry.key;
                final weight = entry.value;
                final maxWeight = _model.weightHistory.reduce((a, b) => a > b ? a : b);
                final minWeight = _model.weightHistory.reduce((a, b) => a < b ? a : b);
                final height = maxWeight > minWeight ? ((weight - minWeight) / (maxWeight - minWeight)) : 0.5;
                final isToday = index == 6; // 마지막 날이 오늘
                
                return Column(
                  mainAxisAlignment: MainAxisAlignment.end,
                  children: [
                    Text(
                      '${weight.toStringAsFixed(1)}',
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

  Widget _buildKeyMetrics() {
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
            '주요 지표',
            style: FlutterFlowTheme.of(context).titleMedium.override(
                  fontFamily: 'Inter',
                  letterSpacing: 0.0,
                  fontWeight: FontWeight.w600,
                ),
          ),
          const SizedBox(height: 16.0),
          Row(
            children: [
              Expanded(
                child: _buildMetricCard('BMI', '${_model.currentBmi.toStringAsFixed(1)}', _getBmiStatus(_model.currentBmi)),
              ),
              const SizedBox(width: 12.0),
              Expanded(
                child: _buildMetricCard('체지방률', '${_model.currentBodyFat.toStringAsFixed(1)}%', _getBodyFatStatus(_model.currentBodyFat)),
              ),
            ],
          ),
          const SizedBox(height: 12.0),
          Row(
            children: [
              Expanded(
                child: _buildMetricCard('근육량', '${_model.currentMuscleMass.toStringAsFixed(1)}kg', '정상'),
              ),
              const SizedBox(width: 12.0),
              Expanded(
                child: _buildMetricCard('수면', '${_model.todaySleepHours.toStringAsFixed(1)}시간', _getSleepStatus(_model.todaySleepHours)),
              ),
            ],
          ),
        ],
      ),
    );
  }

  Widget _buildMetricCard(String title, String value, String status) {
    return Container(
      padding: const EdgeInsets.all(16.0),
      decoration: BoxDecoration(
        color: FlutterFlowTheme.of(context).primaryBackground,
        borderRadius: BorderRadius.circular(12.0),
        border: Border.all(
          color: FlutterFlowTheme.of(context).alternate,
        ),
      ),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Text(
            title,
            style: FlutterFlowTheme.of(context).bodySmall.override(
                  fontFamily: 'Inter',
                  letterSpacing: 0.0,
                  color: FlutterFlowTheme.of(context).secondaryText,
                ),
          ),
          const SizedBox(height: 4.0),
          Text(
            value,
            style: FlutterFlowTheme.of(context).titleMedium.override(
                  fontFamily: 'Inter',
                  letterSpacing: 0.0,
                  fontWeight: FontWeight.w600,
                ),
          ),
          const SizedBox(height: 4.0),
          Text(
            status,
            style: FlutterFlowTheme.of(context).bodySmall.override(
                  fontFamily: 'Inter',
                  letterSpacing: 0.0,
                  color: _getStatusColor(status),
                ),
          ),
        ],
      ),
    );
  }

  Widget _buildWeeklyActivitySummary() {
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
            '주간 활동 요약',
            style: FlutterFlowTheme.of(context).titleMedium.override(
                  fontFamily: 'Inter',
                  letterSpacing: 0.0,
                  fontWeight: FontWeight.w600,
                ),
          ),
          const SizedBox(height: 16.0),
          _buildActivityItem('평균 걸음수', '${_model.weeklyAvgSteps.toStringAsFixed(0)}걸음', Icons.directions_walk, Colors.blue),
          _buildActivityItem('평균 운동시간', '${_model.weeklyAvgExerciseMinutes.toStringAsFixed(0)}분', Icons.fitness_center, Colors.green),
          _buildActivityItem('평균 수면시간', '${_model.weeklyAvgSleepHours.toStringAsFixed(1)}시간', Icons.bedtime, Colors.purple),
          _buildActivityItem('평균 물 섭취량', '${_model.weeklyAvgWaterIntake.toStringAsFixed(1)}L', Icons.water_drop, Colors.cyan),
        ],
      ),
    );
  }

  Widget _buildActivityItem(String title, String value, IconData icon, Color color) {
    return Padding(
      padding: const EdgeInsetsDirectional.fromSTEB(0.0, 0.0, 0.0, 12.0),
      child: Row(
        children: [
          Container(
            width: 40.0,
            height: 40.0,
            decoration: BoxDecoration(
              color: color.withOpacity(0.1),
              shape: BoxShape.circle,
            ),
            child: Icon(
              icon,
              color: color,
              size: 20.0,
            ),
          ),
          const SizedBox(width: 16.0),
          Expanded(
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Text(
                  title,
                  style: FlutterFlowTheme.of(context).bodyMedium.override(
                        fontFamily: 'Inter',
                        letterSpacing: 0.0,
                      ),
                ),
                Text(
                  value,
                  style: FlutterFlowTheme.of(context).bodySmall.override(
                        fontFamily: 'Inter',
                        letterSpacing: 0.0,
                        color: FlutterFlowTheme.of(context).secondaryText,
                      ),
                ),
              ],
            ),
          ),
        ],
      ),
    );
  }

  Widget _buildRecentRecords() {
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
          Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              Text(
                '최근 기록',
                style: FlutterFlowTheme.of(context).titleMedium.override(
                      fontFamily: 'Inter',
                      letterSpacing: 0.0,
                      fontWeight: FontWeight.w600,
                    ),
              ),
              Text(
                '${_model.recentRecords.length}개',
                style: FlutterFlowTheme.of(context).bodySmall.override(
                      fontFamily: 'Inter',
                      letterSpacing: 0.0,
                      color: FlutterFlowTheme.of(context).secondaryText,
                    ),
              ),
            ],
          ),
          const SizedBox(height: 16.0),
          if (_model.recentRecords.isEmpty)
            _buildEmptyState()
          else
            ..._model.recentRecords.take(3).map((record) => _buildRecordItem(record)),
        ],
      ),
    );
  }

  Widget _buildEmptyState() {
    return Padding(
      padding: const EdgeInsets.all(32.0),
      child: Column(
        children: [
          Icon(
            Icons.analytics_outlined,
            size: 64.0,
            color: FlutterFlowTheme.of(context).secondaryText,
          ),
          const SizedBox(height: 16.0),
          Text(
            '건강 기록이 없습니다',
            style: FlutterFlowTheme.of(context).titleMedium.override(
                  fontFamily: 'Inter',
                  letterSpacing: 0.0,
                ),
          ),
          const SizedBox(height: 8.0),
          Text(
            '첫 번째 건강 기록을 추가해보세요',
            style: FlutterFlowTheme.of(context).bodyMedium.override(
                  fontFamily: 'Inter',
                  letterSpacing: 0.0,
                  color: FlutterFlowTheme.of(context).secondaryText,
                ),
          ),
          const SizedBox(height: 16.0),
          FFButtonWidget(
            onPressed: () async {
              await _showAddStatsBottomSheet();
            },
            text: '기록 추가',
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

  Widget _buildRecordItem(HealthStatsRecord record) {
    return Container(
      margin: const EdgeInsetsDirectional.fromSTEB(0.0, 0.0, 0.0, 12.0),
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
          Container(
            width: 50.0,
            height: 50.0,
            decoration: BoxDecoration(
              color: FlutterFlowTheme.of(context).primary.withOpacity(0.1),
              borderRadius: BorderRadius.circular(8.0),
            ),
            child: Icon(
              Icons.favorite,
              color: FlutterFlowTheme.of(context).primary,
              size: 24.0,
            ),
          ),
          
          const SizedBox(width: 16.0),
          
          Expanded(
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Text(
                  _formatDate(record.recordDate),
                  style: FlutterFlowTheme.of(context).titleSmall.override(
                        fontFamily: 'Inter',
                        letterSpacing: 0.0,
                        fontWeight: FontWeight.w600,
                      ),
                ),
                const SizedBox(height: 4.0),
                Text(
                  '체중: ${record.weight.toStringAsFixed(1)}kg • BMI: ${record.bmi.toStringAsFixed(1)}',
                  style: FlutterFlowTheme.of(context).bodySmall.override(
                        fontFamily: 'Inter',
                        letterSpacing: 0.0,
                        color: FlutterFlowTheme.of(context).secondaryText,
                      ),
                ),
              ],
            ),
          ),
          
          Icon(
            Icons.chevron_right,
            color: FlutterFlowTheme.of(context).secondaryText,
            size: 24.0,
          ),
        ],
      ),
    );
  }

  // Helper methods
  String _getDayName(int index) {
    const days = ['월', '화', '수', '목', '금', '토', '일'];
    return days[index];
  }

  String _formatDate(DateTime? date) {
    if (date == null) return '';
    return '${date.month}/${date.day}';
  }

  String _getBmiStatus(double bmi) {
    if (bmi < 18.5) return '저체중';
    if (bmi < 25) return '정상';
    if (bmi < 30) return '과체중';
    return '비만';
  }

  String _getBodyFatStatus(double bodyFat) {
    if (bodyFat < 10) return '매우 낮음';
    if (bodyFat < 15) return '낮음';
    if (bodyFat < 20) return '정상';
    if (bodyFat < 25) return '높음';
    return '매우 높음';
  }

  String _getSleepStatus(double sleepHours) {
    if (sleepHours < 6) return '부족';
    if (sleepHours < 8) return '적당';
    if (sleepHours < 10) return '충분';
    return '과다';
  }

  Color _getStatusColor(String status) {
    switch (status) {
      case '정상':
      case '적당':
      case '충분':
        return FlutterFlowTheme.of(context).success;
      case '저체중':
      case '낮음':
      case '부족':
        return FlutterFlowTheme.of(context).warning;
      case '과체중':
      case '비만':
      case '높음':
      case '매우 높음':
      case '과다':
        return FlutterFlowTheme.of(context).error;
      default:
        return FlutterFlowTheme.of(context).secondaryText;
    }
  }

  Future<void> _showAddStatsBottomSheet() async {
    await showModalBottomSheet(
      context: context,
      isScrollControlled: true,
      backgroundColor: Colors.transparent,
      builder: (context) => _buildAddStatsBottomSheet(),
    );
  }

  Widget _buildAddStatsBottomSheet() {
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
                  '건강 기록 추가',
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
            
            // 체중 입력
            _buildInputField('체중 (kg)', _model.weightController, TextInputType.number),
            const SizedBox(height: 16.0),
            
            // BMI 입력
            _buildInputField('BMI', _model.bmiController, TextInputType.number),
            const SizedBox(height: 16.0),
            
            // 체지방률 입력
            _buildInputField('체지방률 (%)', _model.bodyFatController, TextInputType.number),
            const SizedBox(height: 16.0),
            
            // 걸음수 입력
            _buildInputField('걸음수', _model.stepsController, TextInputType.number),
            const SizedBox(height: 16.0),
            
            // 운동시간 입력
            _buildInputField('운동시간 (분)', _model.exerciseController, TextInputType.number),
            const SizedBox(height: 16.0),
            
            // 수면시간 입력
            _buildInputField('수면시간 (시간)', _model.sleepController, TextInputType.number),
            
            const Spacer(),
            
            // 저장 버튼
            FFButtonWidget(
              onPressed: () async {
                await _saveHealthStats();
                Navigator.pop(context);
              },
              text: '기록 저장',
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

  Widget _buildInputField(String label, TextEditingController controller, TextInputType keyboardType) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Text(
          label,
          style: FlutterFlowTheme.of(context).bodyMedium.override(
                fontFamily: 'Inter',
                letterSpacing: 0.0,
                fontWeight: FontWeight.w500,
              ),
        ),
        const SizedBox(height: 8.0),
        TextFormField(
          controller: controller,
          keyboardType: keyboardType,
          decoration: InputDecoration(
            border: OutlineInputBorder(
              borderRadius: BorderRadius.circular(8.0),
            ),
            hintText: label,
          ),
        ),
      ],
    );
  }

  Future<void> _saveHealthStats() async {
    final currentUser = currentUserDocument;
    if (currentUser != null) {
      final statsId = DateTime.now().millisecondsSinceEpoch.toString();
      
      await HealthStatsRecord.collection.add(createHealthStatsRecordData(
        statsId: statsId,
        userId: currentUser.uid,
        recordDate: DateTime.now(),
        weight: double.tryParse(_model.weightController.text) ?? 0.0,
        bmi: double.tryParse(_model.bmiController.text) ?? 0.0,
        bodyFatPercentage: double.tryParse(_model.bodyFatController.text) ?? 0.0,
        dailySteps: int.tryParse(_model.stepsController.text) ?? 0,
        exerciseMinutes: int.tryParse(_model.exerciseController.text) ?? 0,
        sleepHours: double.tryParse(_model.sleepController.text) ?? 0.0,
        createdAt: DateTime.now(),
        updatedAt: DateTime.now(),
      ));

      ScaffoldMessenger.of(context).showSnackBar(
        const SnackBar(content: Text('건강 기록이 추가되었습니다!')),
      );
      
      await _loadHealthStats();
    }
  }

  Future<void> _loadHealthStats() async {
    setState(() {
      _model.isLoading = true;
    });

    try {
      final currentUser = currentUserDocument;
      if (currentUser != null) {
        // 최근 건강 통계 로드
        _model.recentRecords = await queryHealthStatsRecordOnce(
          queryBuilder: (query) => query
              .where('user_id', isEqualTo: currentUser.uid)
              .orderBy('record_date', descending: true)
              .limit(10),
        );

        if (_model.recentRecords.isNotEmpty) {
          final latestRecord = _model.recentRecords.first;
          setState(() {
            _model.todayWeight = latestRecord.weight;
            _model.todaySteps = latestRecord.dailySteps;
            _model.todayExerciseMinutes = latestRecord.exerciseMinutes;
            _model.todaySleepHours = latestRecord.sleepHours;
            _model.currentBmi = latestRecord.bmi;
            _model.currentBodyFat = latestRecord.bodyFatPercentage;
            _model.currentMuscleMass = latestRecord.muscleMass;
          });
        }

        // 체중 히스토리 생성 (최근 7일)
        _model.weightHistory = _model.recentRecords
            .take(7)
            .map((record) => record.weight)
            .toList();

        // 주간 평균 계산
        _calculateWeeklyAverages();

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

  void _calculateWeeklyAverages() {
    if (_model.recentRecords.isNotEmpty) {
      final weeklyRecords = _model.recentRecords.take(7);
      
      _model.weeklyAvgSteps = weeklyRecords
          .map((record) => record.dailySteps.toDouble())
          .reduce((a, b) => a + b) / weeklyRecords.length;
      
      _model.weeklyAvgExerciseMinutes = weeklyRecords
          .map((record) => record.exerciseMinutes.toDouble())
          .reduce((a, b) => a + b) / weeklyRecords.length;
      
      _model.weeklyAvgSleepHours = weeklyRecords
          .map((record) => record.sleepHours)
          .reduce((a, b) => a + b) / weeklyRecords.length;
      
      _model.weeklyAvgWaterIntake = weeklyRecords
          .map((record) => record.waterIntake)
          .reduce((a, b) => a + b) / weeklyRecords.length;
    }
  }

  double _calculateHealthScore() {
    // 간단한 건강 점수 계산 로직
    double score = 50.0; // 기본 점수
    
    // BMI 점수 (20-25가 이상적)
    if (_model.currentBmi >= 20 && _model.currentBmi <= 25) {
      score += 20.0;
    } else if (_model.currentBmi >= 18.5 && _model.currentBmi <= 30) {
      score += 10.0;
    }
    
    // 운동 점수
    if (_model.todayExerciseMinutes >= 30) {
      score += 15.0;
    } else if (_model.todayExerciseMinutes >= 15) {
      score += 10.0;
    }
    
    // 수면 점수
    if (_model.todaySleepHours >= 7 && _model.todaySleepHours <= 9) {
      score += 15.0;
    } else if (_model.todaySleepHours >= 6 && _model.todaySleepHours <= 10) {
      score += 10.0;
    }
    
    return score.clamp(0.0, 100.0);
  }

  @override
  void initState() {
    super.initState();
    _loadHealthStats();
  }
}
