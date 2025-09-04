import '/auth/firebase_auth/auth_util.dart';
import '/backend/backend.dart';
import '/flutter_flow/flutter_flow_theme.dart';
import '/flutter_flow/flutter_flow_util.dart';
import '/flutter_flow/flutter_flow_widgets.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:provider/provider.dart';
import 'notification_settings_model.dart';
export 'notification_settings_model.dart';

class NotificationSettingsWidget extends StatefulWidget {
  const NotificationSettingsWidget({super.key});

  @override
  State<NotificationSettingsWidget> createState() => _NotificationSettingsWidgetState();
}

class _NotificationSettingsWidgetState extends State<NotificationSettingsWidget> {
  late NotificationSettingsModel _model;

  final scaffoldKey = GlobalKey<ScaffoldState>();

  @override
  void initState() {
    super.initState();
    _model = createModel(context, () => NotificationSettingsModel());

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
            '알림 설정',
            style: FlutterFlowTheme.of(context).headlineMedium.override(
                  fontFamily: 'Inter',
                  letterSpacing: 0.0,
                ),
          ),
          actions: [
            IconButton(
              icon: Icon(
                Icons.save_rounded,
                color: FlutterFlowTheme.of(context).primaryText,
                size: 24.0,
              ),
              onPressed: () async {
                await _saveSettings();
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
                    '영양 관리 알림을\n설정해보세요',
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
                      // 알림 유형 설정
                      _buildNotificationTypesSection(),
                      
                      const SizedBox(height: 24.0),
                      
                      // 식사 시간 알림
                      _buildMealTimeRemindersSection(),
                      
                      const SizedBox(height: 24.0),
                      
                      // 임계값 설정
                      _buildThresholdsSection(),
                      
                      const SizedBox(height: 24.0),
                      
                      // 알림 빈도 설정
                      _buildNotificationFrequencySection(),
                      
                      const SizedBox(height: 24.0),
                      
                      // 조용한 시간 설정
                      _buildQuietHoursSection(),
                      
                      const SizedBox(height: 24.0),
                      
                      // 알림 방법 설정
                      _buildNotificationMethodsSection(),
                      
                      const SizedBox(height: 24.0),
                      
                      // 저장 버튼
                      FFButtonWidget(
                        onPressed: _model.isLoading ? null : () async {
                          await _saveSettings();
                        },
                        text: _model.isLoading ? '저장 중...' : '설정 저장',
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

  Widget _buildNotificationTypesSection() {
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
            '알림 유형',
            style: FlutterFlowTheme.of(context).titleMedium.override(
                  fontFamily: 'Inter',
                  letterSpacing: 0.0,
                  fontWeight: FontWeight.w600,
                ),
          ),
          const SizedBox(height: 16.0),
          _buildNotificationToggle(
            '영양 목표 달성 알림',
            '일일 영양 목표 달성 시 알림',
            Icons.track_changes_rounded,
            _model.nutritionGoalAlerts,
            (value) => setState(() => _model.nutritionGoalAlerts = value),
          ),
          _buildNotificationToggle(
            '칼로리 초과 경고',
            '목표 칼로리 초과 시 경고 알림',
            Icons.warning_rounded,
            _model.calorieExcessWarnings,
            (value) => setState(() => _model.calorieExcessWarnings = value),
          ),
          _buildNotificationToggle(
            '영양소 부족 알림',
            '필수 영양소 부족 시 알림',
            Icons.info_rounded,
            _model.nutrientDeficiencyAlerts,
            (value) => setState(() => _model.nutrientDeficiencyAlerts = value),
          ),
        ],
      ),
    );
  }

  Widget _buildMealTimeRemindersSection() {
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
            '식사 시간 알림',
            style: FlutterFlowTheme.of(context).titleMedium.override(
                  fontFamily: 'Inter',
                  letterSpacing: 0.0,
                  fontWeight: FontWeight.w600,
                ),
          ),
          const SizedBox(height: 16.0),
          _buildNotificationToggle(
            '식사 시간 알림',
            '정해진 시간에 식사 알림',
            Icons.schedule_rounded,
            _model.mealTimeReminders,
            (value) => setState(() => _model.mealTimeReminders = value),
          ),
          if (_model.mealTimeReminders) ...[
            const SizedBox(height: 16.0),
            _buildMealTimeSelector('아침', _model.breakfastTime, (time) => setState(() => _model.breakfastTime = time)),
            _buildMealTimeSelector('점심', _model.lunchTime, (time) => setState(() => _model.lunchTime = time)),
            _buildMealTimeSelector('저녁', _model.dinnerTime, (time) => setState(() => _model.dinnerTime = time)),
            _buildMealTimeSelector('간식', _model.snackTime, (time) => setState(() => _model.snackTime = time)),
          ],
        ],
      ),
    );
  }

  Widget _buildThresholdsSection() {
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
            '임계값 설정',
            style: FlutterFlowTheme.of(context).titleMedium.override(
                  fontFamily: 'Inter',
                  letterSpacing: 0.0,
                  fontWeight: FontWeight.w600,
                ),
          ),
          const SizedBox(height: 16.0),
          _buildThresholdSlider(
            '칼로리 초과 임계값',
            '${_model.calorieThreshold.toStringAsFixed(0)}%',
            _model.calorieThreshold,
            10.0,
            50.0,
            (value) => setState(() => _model.calorieThreshold = value),
          ),
          const SizedBox(height: 16.0),
          _buildThresholdSlider(
            '영양소 부족 임계값',
            '${_model.nutrientThreshold.toStringAsFixed(0)}%',
            _model.nutrientThreshold,
            10.0,
            50.0,
            (value) => setState(() => _model.nutrientThreshold = value),
          ),
        ],
      ),
    );
  }

  Widget _buildNotificationFrequencySection() {
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
            '알림 빈도',
            style: FlutterFlowTheme.of(context).titleMedium.override(
                  fontFamily: 'Inter',
                  letterSpacing: 0.0,
                  fontWeight: FontWeight.w600,
                ),
          ),
          const SizedBox(height: 16.0),
          DropdownButtonFormField<String>(
            value: _model.notificationFrequency,
            decoration: InputDecoration(
              border: OutlineInputBorder(
                borderRadius: BorderRadius.circular(8.0),
              ),
            ),
            items: const [
              DropdownMenuItem(value: 'immediate', child: Text('즉시 알림')),
              DropdownMenuItem(value: 'daily', child: Text('일일 요약')),
              DropdownMenuItem(value: 'weekly', child: Text('주간 요약')),
            ],
            onChanged: (value) {
              setState(() {
                _model.notificationFrequency = value ?? 'immediate';
              });
            },
          ),
        ],
      ),
    );
  }

  Widget _buildQuietHoursSection() {
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
            '조용한 시간',
            style: FlutterFlowTheme.of(context).titleMedium.override(
                  fontFamily: 'Inter',
                  letterSpacing: 0.0,
                  fontWeight: FontWeight.w600,
                ),
          ),
          const SizedBox(height: 16.0),
          _buildNotificationToggle(
            '조용한 시간 활성화',
            '설정된 시간 동안 알림 비활성화',
            Icons.bedtime_rounded,
            _model.quietHoursEnabled,
            (value) => setState(() => _model.quietHoursEnabled = value),
          ),
          if (_model.quietHoursEnabled) ...[
            const SizedBox(height: 16.0),
            Row(
              children: [
                Expanded(
                  child: _buildTimeSelector(
                    '시작 시간',
                    _model.quietStartTime,
                    (time) => setState(() => _model.quietStartTime = time),
                  ),
                ),
                const SizedBox(width: 16.0),
                Expanded(
                  child: _buildTimeSelector(
                    '종료 시간',
                    _model.quietEndTime,
                    (time) => setState(() => _model.quietEndTime = time),
                  ),
                ),
              ],
            ),
          ],
        ],
      ),
    );
  }

  Widget _buildNotificationMethodsSection() {
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
            '알림 방법',
            style: FlutterFlowTheme.of(context).titleMedium.override(
                  fontFamily: 'Inter',
                  letterSpacing: 0.0,
                  fontWeight: FontWeight.w600,
                ),
          ),
          const SizedBox(height: 16.0),
          _buildNotificationToggle(
            '푸시 알림',
            '앱 내 푸시 알림 수신',
            Icons.notifications_rounded,
            _model.pushNotifications,
            (value) => setState(() => _model.pushNotifications = value),
          ),
          _buildNotificationToggle(
            '이메일 알림',
            '이메일로 알림 수신',
            Icons.email_rounded,
            _model.emailNotifications,
            (value) => setState(() => _model.emailNotifications = value),
          ),
        ],
      ),
    );
  }

  Widget _buildNotificationToggle(String title, String description, IconData icon, bool value, Function(bool) onChanged) {
    return Padding(
      padding: const EdgeInsetsDirectional.fromSTEB(0.0, 0.0, 0.0, 16.0),
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
      ),
    );
  }

  Widget _buildMealTimeSelector(String mealType, TimeOfDay? time, Function(TimeOfDay?) onChanged) {
    return Padding(
      padding: const EdgeInsetsDirectional.fromSTEB(0.0, 0.0, 0.0, 12.0),
      child: InkWell(
        onTap: () async {
          final selectedTime = await showTimePicker(
            context: context,
            initialTime: time ?? TimeOfDay.now(),
          );
          onChanged(selectedTime);
        },
        child: Container(
          padding: const EdgeInsets.all(16.0),
          decoration: BoxDecoration(
            color: FlutterFlowTheme.of(context).primaryBackground,
            borderRadius: BorderRadius.circular(8.0),
            border: Border.all(
              color: FlutterFlowTheme.of(context).alternate,
            ),
          ),
          child: Row(
            children: [
              Text(
                mealType,
                style: FlutterFlowTheme.of(context).bodyMedium.override(
                      fontFamily: 'Inter',
                      letterSpacing: 0.0,
                      fontWeight: FontWeight.w500,
                    ),
              ),
              const Spacer(),
              Text(
                time != null ? '${time.hour.toString().padLeft(2, '0')}:${time.minute.toString().padLeft(2, '0')}' : '시간 설정',
                style: FlutterFlowTheme.of(context).bodyMedium.override(
                      fontFamily: 'Inter',
                      letterSpacing: 0.0,
                      color: time != null ? FlutterFlowTheme.of(context).primaryText : FlutterFlowTheme.of(context).secondaryText,
                    ),
              ),
              const SizedBox(width: 8.0),
              Icon(
                Icons.access_time,
                color: FlutterFlowTheme.of(context).secondaryText,
                size: 20.0,
              ),
            ],
          ),
        ),
      ),
    );
  }

  Widget _buildThresholdSlider(String title, String value, double currentValue, double min, double max, Function(double) onChanged) {
    return Column(
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
              value,
              style: FlutterFlowTheme.of(context).bodyMedium.override(
                    fontFamily: 'Inter',
                    letterSpacing: 0.0,
                    color: FlutterFlowTheme.of(context).primary,
                    fontWeight: FontWeight.w600,
                  ),
            ),
          ],
        ),
        Slider(
          value: currentValue,
          min: min,
          max: max,
          divisions: ((max - min) / 5).round(),
          activeColor: FlutterFlowTheme.of(context).primary,
          inactiveColor: FlutterFlowTheme.of(context).alternate,
          onChanged: onChanged,
        ),
      ],
    );
  }

  Widget _buildTimeSelector(String label, TimeOfDay? time, Function(TimeOfDay?) onChanged) {
    return InkWell(
      onTap: () async {
        final selectedTime = await showTimePicker(
          context: context,
          initialTime: time ?? TimeOfDay.now(),
        );
        onChanged(selectedTime);
      },
      child: Container(
        padding: const EdgeInsets.all(16.0),
        decoration: BoxDecoration(
          border: Border.all(
            color: FlutterFlowTheme.of(context).alternate,
          ),
          borderRadius: BorderRadius.circular(8.0),
        ),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Text(
              label,
              style: FlutterFlowTheme.of(context).bodySmall.override(
                    fontFamily: 'Inter',
                    letterSpacing: 0.0,
                    color: FlutterFlowTheme.of(context).secondaryText,
                  ),
            ),
            const SizedBox(height: 4.0),
            Text(
              time != null ? '${time.hour.toString().padLeft(2, '0')}:${time.minute.toString().padLeft(2, '0')}' : '시간 선택',
              style: FlutterFlowTheme.of(context).bodyMedium.override(
                    fontFamily: 'Inter',
                    letterSpacing: 0.0,
                    fontWeight: FontWeight.w500,
                  ),
            ),
          ],
        ),
      ),
    );
  }

  Future<void> _saveSettings() async {
    setState(() {
      _model.isLoading = true;
    });

    try {
      final currentUser = currentUserDocument;
      if (currentUser != null) {
        final settingsId = DateTime.now().millisecondsSinceEpoch.toString();
        
        // 기존 설정이 있는지 확인
        final existingSettings = await queryNotificationSettingsRecordOnce(
          queryBuilder: (query) => query
              .where('user_id', isEqualTo: currentUser.uid)
              .limit(1),
        );

        final mealReminderTimes = {
          'breakfast': _model.breakfastTime != null ? '${_model.breakfastTime!.hour}:${_model.breakfastTime!.minute}' : null,
          'lunch': _model.lunchTime != null ? '${_model.lunchTime!.hour}:${_model.lunchTime!.minute}' : null,
          'dinner': _model.dinnerTime != null ? '${_model.dinnerTime!.hour}:${_model.dinnerTime!.minute}' : null,
          'snack': _model.snackTime != null ? '${_model.snackTime!.hour}:${_model.snackTime!.minute}' : null,
        };

        final quietHours = {
          'enabled': _model.quietHoursEnabled,
          'start_time': _model.quietStartTime != null ? '${_model.quietStartTime!.hour}:${_model.quietStartTime!.minute}' : null,
          'end_time': _model.quietEndTime != null ? '${_model.quietEndTime!.hour}:${_model.quietEndTime!.minute}' : null,
        };

        if (existingSettings.isNotEmpty) {
          // 기존 설정 업데이트
          await existingSettings.first.reference.update(createNotificationSettingsRecordData(
            nutritionGoalAlerts: _model.nutritionGoalAlerts,
            mealTimeReminders: _model.mealTimeReminders,
            calorieExcessWarnings: _model.calorieExcessWarnings,
            nutrientDeficiencyAlerts: _model.nutrientDeficiencyAlerts,
            mealReminderTimes: mealReminderTimes,
            calorieThreshold: _model.calorieThreshold,
            nutrientThresholds: {'threshold': _model.nutrientThreshold},
            notificationFrequency: _model.notificationFrequency,
            quietHours: quietHours,
            pushNotifications: _model.pushNotifications,
            emailNotifications: _model.emailNotifications,
            updatedAt: DateTime.now(),
          ));
        } else {
          // 새 설정 생성
          await NotificationSettingsRecord.collection.add(createNotificationSettingsRecordData(
            settingsId: settingsId,
            userId: currentUser.uid,
            nutritionGoalAlerts: _model.nutritionGoalAlerts,
            mealTimeReminders: _model.mealTimeReminders,
            calorieExcessWarnings: _model.calorieExcessWarnings,
            nutrientDeficiencyAlerts: _model.nutrientDeficiencyAlerts,
            mealReminderTimes: mealReminderTimes,
            calorieThreshold: _model.calorieThreshold,
            nutrientThresholds: {'threshold': _model.nutrientThreshold},
            notificationFrequency: _model.notificationFrequency,
            quietHours: quietHours,
            pushNotifications: _model.pushNotifications,
            emailNotifications: _model.emailNotifications,
            createdAt: DateTime.now(),
            updatedAt: DateTime.now(),
          ));
        }

        ScaffoldMessenger.of(context).showSnackBar(
          const SnackBar(content: Text('알림 설정이 저장되었습니다!')),
        );
      }
    } catch (e) {
      ScaffoldMessenger.of(context).showSnackBar(
        SnackBar(content: Text('설정 저장 중 오류가 발생했습니다: $e')),
      );
    } finally {
      setState(() {
        _model.isLoading = false;
      });
    }
  }

  Future<void> _loadSettings() async {
    setState(() {
      _model.isLoading = true;
    });

    try {
      final currentUser = currentUserDocument;
      if (currentUser != null) {
        final settings = await queryNotificationSettingsRecordOnce(
          queryBuilder: (query) => query
              .where('user_id', isEqualTo: currentUser.uid)
              .limit(1),
        );

        if (settings.isNotEmpty) {
          final setting = settings.first;
          setState(() {
            _model.nutritionGoalAlerts = setting.nutritionGoalAlerts;
            _model.mealTimeReminders = setting.mealTimeReminders;
            _model.calorieExcessWarnings = setting.calorieExcessWarnings;
            _model.nutrientDeficiencyAlerts = setting.nutrientDeficiencyAlerts;
            _model.calorieThreshold = setting.calorieThreshold;
            _model.nutrientThreshold = (setting.nutrientThresholds['threshold'] as num?)?.toDouble() ?? 20.0;
            _model.notificationFrequency = setting.notificationFrequency;
            _model.pushNotifications = setting.pushNotifications;
            _model.emailNotifications = setting.emailNotifications;

            // 조용한 시간 설정
            final quietHours = setting.quietHours;
            _model.quietHoursEnabled = quietHours['enabled'] as bool? ?? false;
            
            final startTimeStr = quietHours['start_time'] as String?;
            if (startTimeStr != null) {
              final parts = startTimeStr.split(':');
              _model.quietStartTime = TimeOfDay(hour: int.parse(parts[0]), minute: int.parse(parts[1]));
            }
            
            final endTimeStr = quietHours['end_time'] as String?;
            if (endTimeStr != null) {
              final parts = endTimeStr.split(':');
              _model.quietEndTime = TimeOfDay(hour: int.parse(parts[0]), minute: int.parse(parts[1]));
            }

            // 식사 시간 설정
            final mealTimes = setting.mealReminderTimes;
            final breakfastTimeStr = mealTimes['breakfast'] as String?;
            if (breakfastTimeStr != null) {
              final parts = breakfastTimeStr.split(':');
              _model.breakfastTime = TimeOfDay(hour: int.parse(parts[0]), minute: int.parse(parts[1]));
            }
            
            final lunchTimeStr = mealTimes['lunch'] as String?;
            if (lunchTimeStr != null) {
              final parts = lunchTimeStr.split(':');
              _model.lunchTime = TimeOfDay(hour: int.parse(parts[0]), minute: int.parse(parts[1]));
            }
            
            final dinnerTimeStr = mealTimes['dinner'] as String?;
            if (dinnerTimeStr != null) {
              final parts = dinnerTimeStr.split(':');
              _model.dinnerTime = TimeOfDay(hour: int.parse(parts[0]), minute: int.parse(parts[1]));
            }
            
            final snackTimeStr = mealTimes['snack'] as String?;
            if (snackTimeStr != null) {
              final parts = snackTimeStr.split(':');
              _model.snackTime = TimeOfDay(hour: int.parse(parts[0]), minute: int.parse(parts[1]));
            }
          });
        }
      }
    } catch (e) {
      ScaffoldMessenger.of(context).showSnackBar(
        SnackBar(content: Text('설정 로드 중 오류가 발생했습니다: $e')),
      );
    } finally {
      setState(() {
        _model.isLoading = false;
      });
    }
  }

  @override
  void initState() {
    super.initState();
    _loadSettings();
  }
}
