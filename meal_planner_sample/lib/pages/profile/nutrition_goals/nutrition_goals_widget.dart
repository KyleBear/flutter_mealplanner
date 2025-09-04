import '/auth/firebase_auth/auth_util.dart';
import '/backend/backend.dart';
import '/flutter_flow/flutter_flow_theme.dart';
import '/flutter_flow/flutter_flow_util.dart';
import '/flutter_flow/flutter_flow_widgets.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:provider/provider.dart';
import 'nutrition_goals_model.dart';
export 'nutrition_goals_model.dart';

class NutritionGoalsWidget extends StatefulWidget {
  const NutritionGoalsWidget({super.key});

  @override
  State<NutritionGoalsWidget> createState() => _NutritionGoalsWidgetState();
}

class _NutritionGoalsWidgetState extends State<NutritionGoalsWidget> {
  late NutritionGoalsModel _model;

  final scaffoldKey = GlobalKey<ScaffoldState>();

  @override
  void initState() {
    super.initState();
    _model = createModel(context, () => NutritionGoalsModel());

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
            '영양 목표 관리',
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
                    '건강한 목표를 설정하고\n체계적으로 관리해보세요',
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
                      // 칼로리 목표 설정
                      _buildSectionTitle('칼로리 목표'),
                      _buildTextField(
                        label: '일일 칼로리 목표 (kcal)',
                        hint: '2000',
                        controller: _model.dailyCaloriesController,
                        keyboardType: TextInputType.number,
                      ),
                      _buildTextField(
                        label: '주간 칼로리 목표 (kcal)',
                        hint: '14000',
                        controller: _model.weeklyCaloriesController,
                        keyboardType: TextInputType.number,
                      ),
                      _buildTextField(
                        label: '월간 칼로리 목표 (kcal)',
                        hint: '60000',
                        controller: _model.monthlyCaloriesController,
                        keyboardType: TextInputType.number,
                      ),
                      
                      const SizedBox(height: 24.0),
                      
                      // 3대 영양소 비율 설정
                      _buildSectionTitle('3대 영양소 비율'),
                      _buildMacroRatioSlider(
                        label: '탄수화물 (%)',
                        value: _model.carbohydrateRatio,
                        onChanged: (value) => setState(() => _model.carbohydrateRatio = value),
                        color: Colors.orange,
                      ),
                      _buildMacroRatioSlider(
                        label: '단백질 (%)',
                        value: _model.proteinRatio,
                        onChanged: (value) => setState(() => _model.proteinRatio = value),
                        color: Colors.red,
                      ),
                      _buildMacroRatioSlider(
                        label: '지방 (%)',
                        value: _model.fatRatio,
                        onChanged: (value) => setState(() => _model.fatRatio = value),
                        color: Colors.blue,
                      ),
                      
                      // 영양소 비율 합계 표시
                      _buildMacroRatioSummary(),
                      
                      const SizedBox(height: 24.0),
                      
                      // 미량 영양소 목표 설정
                      _buildSectionTitle('미량 영양소 목표'),
                      _buildMicroNutrientField(
                        label: '비타민 C (mg)',
                        hint: '90',
                        controller: _model.vitaminCController,
                      ),
                      _buildMicroNutrientField(
                        label: '칼슘 (mg)',
                        hint: '1000',
                        controller: _model.calciumController,
                      ),
                      _buildMicroNutrientField(
                        label: '철분 (mg)',
                        hint: '18',
                        controller: _model.ironController,
                      ),
                      _buildMicroNutrientField(
                        label: '마그네슘 (mg)',
                        hint: '400',
                        controller: _model.magnesiumController,
                      ),
                      
                      const SizedBox(height: 24.0),
                      
                      // 목표 달성률 시각화
                      if (_model.dailyCalories > 0) ...[
                        _buildSectionTitle('목표 달성률'),
                        _buildProgressCard(
                          title: '일일 칼로리',
                          current: _model.currentDailyCalories,
                          target: _model.dailyCalories,
                          unit: 'kcal',
                        ),
                        _buildProgressCard(
                          title: '탄수화물',
                          current: _model.currentCarbs,
                          target: _model.dailyCalories * (_model.carbohydrateRatio / 100) / 4,
                          unit: 'g',
                        ),
                        _buildProgressCard(
                          title: '단백질',
                          current: _model.currentProtein,
                          target: _model.dailyCalories * (_model.proteinRatio / 100) / 4,
                          unit: 'g',
                        ),
                        _buildProgressCard(
                          title: '지방',
                          current: _model.currentFat,
                          target: _model.dailyCalories * (_model.fatRatio / 100) / 9,
                          unit: 'g',
                        ),
                      ],
                      
                      const SizedBox(height: 32.0),
                      
                      // 저장 버튼
                      FFButtonWidget(
                        onPressed: _model.isLoading ? null : () async {
                          await _saveNutritionGoals();
                        },
                        text: _model.isLoading ? '저장 중...' : '영양 목표 저장',
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

  Widget _buildTextField({
    required String label,
    required String hint,
    required TextEditingController controller,
    TextInputType? keyboardType,
  }) {
    return Padding(
      padding: const EdgeInsetsDirectional.fromSTEB(0.0, 0.0, 0.0, 16.0),
      child: Column(
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
              hintText: hint,
              hintStyle: FlutterFlowTheme.of(context).bodyMedium.override(
                    fontFamily: 'Inter',
                    letterSpacing: 0.0,
                  ),
              enabledBorder: OutlineInputBorder(
                borderSide: BorderSide(
                  color: FlutterFlowTheme.of(context).alternate,
                  width: 2.0,
                ),
                borderRadius: BorderRadius.circular(8.0),
              ),
              focusedBorder: OutlineInputBorder(
                borderSide: BorderSide(
                  color: FlutterFlowTheme.of(context).primary,
                  width: 2.0,
                ),
                borderRadius: BorderRadius.circular(8.0),
              ),
              filled: true,
              fillColor: FlutterFlowTheme.of(context).secondaryBackground,
            ),
            style: FlutterFlowTheme.of(context).bodyMedium.override(
                  fontFamily: 'Inter',
                  letterSpacing: 0.0,
                ),
            onChanged: (value) => _updateDailyCalories(),
          ),
        ],
      ),
    );
  }

  Widget _buildMacroRatioSlider({
    required String label,
    required double value,
    required Function(double) onChanged,
    required Color color,
  }) {
    return Padding(
      padding: const EdgeInsetsDirectional.fromSTEB(0.0, 0.0, 0.0, 16.0),
      child: Column(
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
                '${value.toStringAsFixed(0)}%',
                style: FlutterFlowTheme.of(context).bodyMedium.override(
                      fontFamily: 'Inter',
                      letterSpacing: 0.0,
                      fontWeight: FontWeight.w600,
                      color: color,
                    ),
              ),
            ],
          ),
          SliderTheme(
            data: SliderTheme.of(context).copyWith(
              activeTrackColor: color,
              inactiveTrackColor: color.withOpacity(0.3),
              thumbColor: color,
              overlayColor: color.withOpacity(0.2),
            ),
            child: Slider(
              value: value,
              min: 0,
              max: 100,
              divisions: 100,
              onChanged: onChanged,
            ),
          ),
        ],
      ),
    );
  }

  Widget _buildMacroRatioSummary() {
    final total = _model.carbohydrateRatio + _model.proteinRatio + _model.fatRatio;
    final isValid = (total - 100).abs() < 1.0;
    
    return Container(
      padding: const EdgeInsets.all(16.0),
      decoration: BoxDecoration(
        color: isValid 
            ? FlutterFlowTheme.of(context).success.withOpacity(0.1)
            : FlutterFlowTheme.of(context).error.withOpacity(0.1),
        borderRadius: BorderRadius.circular(8.0),
        border: Border.all(
          color: isValid 
              ? FlutterFlowTheme.of(context).success
              : FlutterFlowTheme.of(context).error,
        ),
      ),
      child: Row(
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        children: [
          Text(
            '총 비율',
            style: FlutterFlowTheme.of(context).bodyMedium.override(
                  fontFamily: 'Inter',
                  letterSpacing: 0.0,
                  fontWeight: FontWeight.w500,
                ),
          ),
          Text(
            '${total.toStringAsFixed(1)}%',
            style: FlutterFlowTheme.of(context).bodyMedium.override(
                  fontFamily: 'Inter',
                  letterSpacing: 0.0,
                  fontWeight: FontWeight.w600,
                  color: isValid 
                      ? FlutterFlowTheme.of(context).success
                      : FlutterFlowTheme.of(context).error,
                ),
          ),
        ],
      ),
    );
  }

  Widget _buildMicroNutrientField({
    required String label,
    required String hint,
    required TextEditingController controller,
  }) {
    return Padding(
      padding: const EdgeInsetsDirectional.fromSTEB(0.0, 0.0, 0.0, 16.0),
      child: Column(
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
            keyboardType: TextInputType.number,
            decoration: InputDecoration(
              hintText: hint,
              hintStyle: FlutterFlowTheme.of(context).bodyMedium.override(
                    fontFamily: 'Inter',
                    letterSpacing: 0.0,
                  ),
              enabledBorder: OutlineInputBorder(
                borderSide: BorderSide(
                  color: FlutterFlowTheme.of(context).alternate,
                  width: 2.0,
                ),
                borderRadius: BorderRadius.circular(8.0),
              ),
              focusedBorder: OutlineInputBorder(
                borderSide: BorderSide(
                  color: FlutterFlowTheme.of(context).primary,
                  width: 2.0,
                ),
                borderRadius: BorderRadius.circular(8.0),
              ),
              filled: true,
              fillColor: FlutterFlowTheme.of(context).secondaryBackground,
            ),
            style: FlutterFlowTheme.of(context).bodyMedium.override(
                  fontFamily: 'Inter',
                  letterSpacing: 0.0,
                ),
          ),
        ],
      ),
    );
  }

  Widget _buildProgressCard({
    required String title,
    required double current,
    required double target,
    required String unit,
  }) {
    final percentage = target > 0 ? (current / target * 100).clamp(0, 100) : 0;
    final isOverTarget = current > target;
    
    return Padding(
      padding: const EdgeInsetsDirectional.fromSTEB(0.0, 0.0, 0.0, 16.0),
      child: Container(
        padding: const EdgeInsets.all(16.0),
        decoration: BoxDecoration(
          color: FlutterFlowTheme.of(context).secondaryBackground,
          borderRadius: BorderRadius.circular(8.0),
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
                  title,
                  style: FlutterFlowTheme.of(context).bodyMedium.override(
                        fontFamily: 'Inter',
                        letterSpacing: 0.0,
                        fontWeight: FontWeight.w500,
                      ),
                ),
                Text(
                  '${current.toStringAsFixed(0)} / ${target.toStringAsFixed(0)} $unit',
                  style: FlutterFlowTheme.of(context).bodyMedium.override(
                        fontFamily: 'Inter',
                        letterSpacing: 0.0,
                        fontWeight: FontWeight.w600,
                        color: isOverTarget 
                            ? FlutterFlowTheme.of(context).error
                            : FlutterFlowTheme.of(context).primary,
                      ),
                ),
              ],
            ),
            const SizedBox(height: 8.0),
            LinearProgressIndicator(
              value: percentage / 100,
              backgroundColor: FlutterFlowTheme.of(context).alternate,
              valueColor: AlwaysStoppedAnimation<Color>(
                isOverTarget 
                    ? FlutterFlowTheme.of(context).error
                    : FlutterFlowTheme.of(context).primary,
              ),
            ),
            const SizedBox(height: 4.0),
            Text(
              '${percentage.toStringAsFixed(1)}%',
              style: FlutterFlowTheme.of(context).bodySmall.override(
                    fontFamily: 'Inter',
                    letterSpacing: 0.0,
                    color: FlutterFlowTheme.of(context).secondaryText,
                  ),
            ),
          ],
        ),
      ),
    );
  }

  void _updateDailyCalories() {
    final dailyCalories = double.tryParse(_model.dailyCaloriesController.text) ?? 0;
    setState(() {
      _model.dailyCalories = dailyCalories;
    });
  }

  Future<void> _saveNutritionGoals() async {
    if (_model.dailyCaloriesController.text.isEmpty) {
      ScaffoldMessenger.of(context).showSnackBar(
        const SnackBar(content: Text('일일 칼로리 목표를 입력해주세요.')),
      );
      return;
    }

    final totalRatio = _model.carbohydrateRatio + _model.proteinRatio + _model.fatRatio;
    if ((totalRatio - 100).abs() > 1.0) {
      ScaffoldMessenger.of(context).showSnackBar(
        const SnackBar(content: Text('3대 영양소 비율의 합이 100%가 되도록 설정해주세요.')),
      );
      return;
    }

    setState(() {
      _model.isLoading = true;
    });

    try {
      final currentUser = currentUserDocument;
      if (currentUser != null) {
        final goalId = DateTime.now().millisecondsSinceEpoch.toString();
        
        final macroRatios = {
          'carbohydrate': _model.carbohydrateRatio,
          'protein': _model.proteinRatio,
          'fat': _model.fatRatio,
        };

        final microNutrients = {
          'vitaminC': double.tryParse(_model.vitaminCController.text) ?? 0,
          'calcium': double.tryParse(_model.calciumController.text) ?? 0,
          'iron': double.tryParse(_model.ironController.text) ?? 0,
          'magnesium': double.tryParse(_model.magnesiumController.text) ?? 0,
        };

        await NutritionGoalsRecord.collection.add(createNutritionGoalsRecordData(
          goalId: goalId,
          userId: currentUser.uid,
          targetDate: DateTime.now(),
          dailyCalories: double.parse(_model.dailyCaloriesController.text),
          macroRatios: macroRatios,
          microNutrients: microNutrients,
          isActive: true,
          createdAt: DateTime.now(),
          updatedAt: DateTime.now(),
        ));

        ScaffoldMessenger.of(context).showSnackBar(
          const SnackBar(content: Text('영양 목표가 성공적으로 저장되었습니다!')),
        );

        // 잠시 후 이전 페이지로 이동
        Future.delayed(const Duration(seconds: 2), () {
          context.pop();
        });
      }
    } catch (e) {
      ScaffoldMessenger.of(context).showSnackBar(
        SnackBar(content: Text('저장 중 오류가 발생했습니다: $e')),
      );
    } finally {
      setState(() {
        _model.isLoading = false;
      });
    }
  }
}
