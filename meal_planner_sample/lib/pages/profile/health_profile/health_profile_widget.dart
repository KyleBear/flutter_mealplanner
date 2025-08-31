import '/auth/firebase_auth/auth_util.dart';
import '/backend/backend.dart';
import '/flutter_flow/flutter_flow_theme.dart';
import '/flutter_flow/flutter_flow_util.dart';
import '/flutter_flow/flutter_flow_widgets.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:provider/provider.dart';
import 'health_profile_model.dart';
export 'health_profile_model.dart';

class HealthProfileWidget extends StatefulWidget {
  const HealthProfileWidget({super.key});

  @override
  State<HealthProfileWidget> createState() => _HealthProfileWidgetState();
}

class _HealthProfileWidgetState extends State<HealthProfileWidget> {
  late HealthProfileModel _model;

  final scaffoldKey = GlobalKey<ScaffoldState>();

  @override
  void initState() {
    super.initState();
    _model = createModel(context, () => HealthProfileModel());

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
            '건강 프로필 설정',
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
                    '건강한 식단 관리를 위해\n기본 정보를 입력해주세요',
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
                      // 기본 신체 정보
                      _buildSectionTitle('기본 신체 정보'),
                      _buildTextField(
                        label: '키 (cm)',
                        hint: '170',
                        controller: _model.heightController,
                        keyboardType: TextInputType.number,
                      ),
                      _buildTextField(
                        label: '몸무게 (kg)',
                        hint: '65',
                        controller: _model.weightController,
                        keyboardType: TextInputType.number,
                      ),
                      _buildTextField(
                        label: '나이',
                        hint: '25',
                        controller: _model.ageController,
                        keyboardType: TextInputType.number,
                      ),
                      _buildDropdown(
                        label: '성별',
                        value: _model.genderValue,
                        options: const ['남성', '여성'],
                        onChanged: (val) => setState(() => _model.genderValue = val),
                      ),
                      
                      const SizedBox(height: 24.0),
                      
                      // 활동 수준
                      _buildSectionTitle('활동 수준'),
                      _buildDropdown(
                        label: '일상 활동 수준',
                        value: _model.activityLevelValue,
                        options: const [
                          '좌업생활 (거의 운동하지 않음)',
                          '가벼운 운동 (주 1-3회)',
                          '보통 운동 (주 3-5회)',
                          '활발한 운동 (주 6-7회)',
                          '매우 활발한 운동 (매일 2회 이상)'
                        ],
                        onChanged: (val) => setState(() => _model.activityLevelValue = val),
                      ),
                      
                      const SizedBox(height: 24.0),
                      
                      // 건강 목표
                      _buildSectionTitle('건강 목표'),
                      _buildDropdown(
                        label: '건강 목표',
                        value: _model.healthGoalValue,
                        options: const ['체중감량', '근육증가', '체중유지', '체중증가'],
                        onChanged: (val) => setState(() => _model.healthGoalValue = val),
                      ),
                      
                      const SizedBox(height: 24.0),
                      
                      // 알레르기/식이제한
                      _buildSectionTitle('알레르기 및 식이제한'),
                      _buildMultiSelect(
                        label: '알레르기 (해당하는 항목을 선택하세요)',
                        options: const [
                          '견과류', '우유', '계란', '대두', '밀', '생선', '조개류'
                        ],
                        selectedValues: _model.allergies,
                        onChanged: (values) => setState(() => _model.allergies = values),
                      ),
                      _buildMultiSelect(
                        label: '식이제한 (해당하는 항목을 선택하세요)',
                        options: const [
                          '비건', '채식주의', '글루텐프리', '유당불내증', '저탄수화물', '저지방'
                        ],
                        selectedValues: _model.dietaryRestrictions,
                        onChanged: (values) => setState(() => _model.dietaryRestrictions = values),
                      ),
                      
                      const SizedBox(height: 24.0),
                      
                      // 계산된 정보 표시
                      if (_model.bmr > 0) ...[
                        _buildSectionTitle('계산된 정보'),
                        _buildInfoCard(
                          title: '기초대사율 (BMR)',
                          value: '${_model.bmr.toStringAsFixed(0)} kcal/일',
                          description: '휴식 상태에서 소모하는 최소 칼로리',
                        ),
                        _buildInfoCard(
                          title: '일일 권장 칼로리',
                          value: '${_model.dailyCalorieGoal.toStringAsFixed(0)} kcal/일',
                          description: '목표 달성을 위한 권장 칼로리',
                        ),
                      ],
                      
                      const SizedBox(height: 32.0),
                      
                      // 저장 버튼
                      FFButtonWidget(
                        onPressed: _model.isLoading ? null : () async {
                          await _saveHealthProfile();
                        },
                        text: _model.isLoading ? '저장 중...' : '건강 프로필 저장',
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
            onChanged: (value) => _calculateBMR(),
          ),
        ],
      ),
    );
  }

  Widget _buildDropdown({
    required String label,
    required String? value,
    required List<String> options,
    required Function(String?) onChanged,
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
          DropdownButtonFormField<String>(
            value: value,
            decoration: InputDecoration(
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
            items: options.map((String option) {
              return DropdownMenuItem<String>(
                value: option,
                child: Text(
                  option,
                  style: FlutterFlowTheme.of(context).bodyMedium.override(
                        fontFamily: 'Inter',
                        letterSpacing: 0.0,
                      ),
                ),
              );
            }).toList(),
            onChanged: onChanged,
            style: FlutterFlowTheme.of(context).bodyMedium.override(
                  fontFamily: 'Inter',
                  letterSpacing: 0.0,
                ),
          ),
        ],
      ),
    );
  }

  Widget _buildMultiSelect({
    required String label,
    required List<String> options,
    required List<String> selectedValues,
    required Function(List<String>) onChanged,
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
          Wrap(
            spacing: 8.0,
            runSpacing: 8.0,
            children: options.map((option) {
              final isSelected = selectedValues.contains(option);
              return FilterChip(
                label: Text(option),
                selected: isSelected,
                onSelected: (selected) {
                  final newValues = List<String>.from(selectedValues);
                  if (selected) {
                    newValues.add(option);
                  } else {
                    newValues.remove(option);
                  }
                  onChanged(newValues);
                },
                selectedColor: FlutterFlowTheme.of(context).primary,
                checkmarkColor: Colors.white,
                labelStyle: TextStyle(
                  color: isSelected ? Colors.white : FlutterFlowTheme.of(context).primaryText,
                ),
              );
            }).toList(),
          ),
        ],
      ),
    );
  }

  Widget _buildInfoCard({
    required String title,
    required String value,
    required String description,
  }) {
    return Padding(
      padding: const EdgeInsetsDirectional.fromSTEB(0.0, 0.0, 0.0, 16.0),
      child: Container(
        width: double.infinity,
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
            Text(
              title,
              style: FlutterFlowTheme.of(context).bodyMedium.override(
                    fontFamily: 'Inter',
                    letterSpacing: 0.0,
                    fontWeight: FontWeight.w500,
                  ),
            ),
            const SizedBox(height: 8.0),
            Text(
              value,
              style: FlutterFlowTheme.of(context).titleLarge.override(
                    fontFamily: 'Inter',
                    letterSpacing: 0.0,
                    fontWeight: FontWeight.w600,
                    color: FlutterFlowTheme.of(context).primary,
                  ),
            ),
            const SizedBox(height: 4.0),
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
    );
  }

  void _calculateBMR() {
    final height = double.tryParse(_model.heightController.text) ?? 0;
    final weight = double.tryParse(_model.weightController.text) ?? 0;
    final age = int.tryParse(_model.ageController.text) ?? 0;
    
    if (height > 0 && weight > 0 && age > 0 && _model.genderValue != null) {
      // Harris-Benedict 공식
      if (_model.genderValue == '남성') {
        _model.bmr = 88.362 + (13.397 * weight) + (4.799 * height) - (5.677 * age);
      } else {
        _model.bmr = 447.593 + (9.247 * weight) + (3.098 * height) - (4.330 * age);
      }
      
      // 활동 수준에 따른 칼로리 계산
      double activityMultiplier = 1.2; // 기본값
      switch (_model.activityLevelValue) {
        case '좌업생활 (거의 운동하지 않음)':
          activityMultiplier = 1.2;
          break;
        case '가벼운 운동 (주 1-3회)':
          activityMultiplier = 1.375;
          break;
        case '보통 운동 (주 3-5회)':
          activityMultiplier = 1.55;
          break;
        case '활발한 운동 (주 6-7회)':
          activityMultiplier = 1.725;
          break;
        case '매우 활발한 운동 (매일 2회 이상)':
          activityMultiplier = 1.9;
          break;
      }
      
      _model.dailyCalorieGoal = _model.bmr * activityMultiplier;
      
      // 건강 목표에 따른 조정
      switch (_model.healthGoalValue) {
        case '체중감량':
          _model.dailyCalorieGoal -= 500; // 하루 500칼로리 감소
          break;
        case '근육증가':
          _model.dailyCalorieGoal += 300; // 하루 300칼로리 증가
          break;
        case '체중증가':
          _model.dailyCalorieGoal += 500; // 하루 500칼로리 증가
          break;
      }
      
      setState(() {});
    }
  }

  Future<void> _saveHealthProfile() async {
    if (_model.heightController.text.isEmpty ||
        _model.weightController.text.isEmpty ||
        _model.ageController.text.isEmpty ||
        _model.genderValue == null ||
        _model.activityLevelValue == null ||
        _model.healthGoalValue == null) {
      ScaffoldMessenger.of(context).showSnackBar(
        const SnackBar(content: Text('모든 필수 항목을 입력해주세요.')),
      );
      return;
    }

    setState(() {
      _model.isLoading = true;
    });

    try {
      final currentUser = currentUserDocument;
      if (currentUser != null) {
        final healthProfile = {
          'height': double.parse(_model.heightController.text),
          'weight': double.parse(_model.weightController.text),
          'age': int.parse(_model.ageController.text),
          'gender': _model.genderValue,
          'activityLevel': _model.activityLevelValue,
          'healthGoal': _model.healthGoalValue,
          'bmr': _model.bmr,
          'dailyCalorieGoal': _model.dailyCalorieGoal,
        };

        await currentUser.reference.update({
          'health_profile': healthProfile,
          'dietary_restrictions': _model.dietaryRestrictions,
          'allergens': _model.allergies,
        });

        ScaffoldMessenger.of(context).showSnackBar(
          const SnackBar(content: Text('건강 프로필이 성공적으로 저장되었습니다!')),
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

