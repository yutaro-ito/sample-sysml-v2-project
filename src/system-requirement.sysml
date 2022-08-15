package 'EACS System Requirement'
{
    import 'EACS System Definition'::*;

    // ====================================
    // Definition of Attribute
    // ====================================
    attribute def Signal_Output_Period :> ScalarValues::Integer;
    attribute def Acceleration_Sampling_Period :> ScalarValues::Integer;
    attribute def Temperature_Sampling_Period :> ScalarValues::Integer;
    attribute def Acceleration_Low :> ScalarValues::Real;
    attribute def Acceleration_High :> ScalarValues::Real;
    attribute def Temperature_Low :> ScalarValues::Real;
    attribute def Temperature_High :> ScalarValues::Real;

    // ====================================
    // Definition of Requirement
    // ====================================
    requirement def <'REQ_01'> 'Startup Requirement' {
        doc /* After the power ON, the EACS shall initialize its sensors. */
    }
    requirement def <'REQ_02'> 'Initialization Requirement - Signal Output' {
        doc /* During the initialization, the EACS shall send the Alert OFF signal to External System every required period. */
        attribute atr_sig_out_period: Signal_Output_Period;
    }
    requirement def <'REQ_03'> 'Initialization Requirement - Acceleration Sensoring' {
        doc /* During the runtime (i.e. after the initialization), the EACS shall sample the acceleration of the EACS every required period. */
        attribute atr_accel_sample_period: Acceleration_Sampling_Period;
    }
    requirement def <'REQ_04'> 'Initialization Requirement - Temperature Sensoring' {
        doc /* After the initialization, the EACS shall sample the acceleration of the EACS every required period. */
        attribute atr_temp_sample_period: Temperature_Sampling_Period;
    }
    requirement def <'REQ_05'> 'Runtime Requirement - Alert OFF' {
        doc /* During the runtime (i.e. after the initialization), the EACS shall send the Alert OFF signal to External System every required period if the acceleration is between required range and the temperature is between required range. */
        attribute atr_sig_out_period: Signal_Output_Period;
        attribute atr_accel_low: Acceleration_Low;
        attribute atr_accel_high: Acceleration_High;
        attribute atr_temp_low: Temperature_Low;
        attribute atr_temp_high: Temperature_High;
        require constraint { atr_accel_low <= atr_accel_high }
        require constraint { atr_temp_low <= atr_temp_high }
    }
    requirement def <'REQ_06'> 'Runtime Requirement - Alert ON' {
        doc /* During the runtime (i.e. after the initialization), the EACS shall send the Alert ON signal to External System every required period if the acceleration is outside the range and the temperature is between required range. */
        attribute atr_sig_out_period: Signal_Output_Period;
        attribute atr_accel_low: Acceleration_Low;
        attribute atr_accel_high: Acceleration_High;
        attribute atr_temp_low: Temperature_Low;
        attribute atr_temp_high: Temperature_High;
        require constraint { atr_accel_low <= atr_accel_high }
        require constraint { atr_temp_low <= atr_temp_high }
    }
    requirement def <'REQ_07'> 'Runtime Requirement - Temperature Abnormal' {
        doc /* During the runtime (i.e. after the initialization), the EACS shall send the Alert OFF signal to External System every required period if the temperature is outside the range. */
        attribute atr_sig_out_period: Signal_Output_Period;
        attribute atr_temp_low: Temperature_Low;
        attribute atr_temp_high: Temperature_High;
        require constraint { atr_temp_low <= atr_temp_high }
    }
    requirement def <'REQ_08'> 'Shutdown Requirement' {
        doc /* After the power OFF, the EACS shall stop sending the Alert signals to External System. */
    }

    // ====================================
    // Usage of Requirement
    // ====================================
    requirement <'REQ_01.01'> startup_req: 'Startup Requirement' {
        subject eacs: EACS;
    }
    requirement <'REQ_02.01'> init_req_sig_out: 'Initialization Requirement - Signal Output' {
        subject eacs: EACS;
        attribute :>> atr_sig_out_period = 100;
    }
    requirement <'REQ_03.01'> init_req_accel_sample: 'Initialization Requirement - Acceleration Sensoring' {
        subject eacs: EACS;
        attribute :>> atr_accel_sample_period = 100;
    }
    requirement <'REQ_04.01'> init_req_temp_sample: 'Initialization Requirement - Temperature Sensoring' {
        subject eacs: EACS;
        attribute :>> atr_temp_sample_period = 100;
    }
    requirement <'REQ_05.01'> run_req_alert_off: 'Runtime Requirement - Alert OFF' {
        subject eacs: EACS;
        attribute :>> atr_sig_out_period = 100;
        attribute :>> atr_accel_low = -50.0;
        attribute :>> atr_accel_high = 50.0;
        attribute :>> atr_temp_low = -40.0;
        attribute :>> atr_temp_high = 80.0;
    }
    requirement <'REQ_06.01'> run_req_alert_on: 'Runtime Requirement - Alert ON' {
        subject eacs: EACS;
        attribute :>> atr_sig_out_period = 100;
        attribute :>> atr_accel_low = -50.0;
        attribute :>> atr_accel_high = 50.0;
        attribute :>> atr_temp_low = -40.0;
        attribute :>> atr_temp_high = 80.0;
    }
    requirement <'REQ_07.01'> run_req_temp_abnormal: 'Runtime Requirement - Temperature Abnormal' {
        subject eacs: EACS;
        attribute :>> atr_sig_out_period = 100;
        attribute :>> atr_temp_low = -40.0;
        attribute :>> atr_temp_high = 80.0;
    }
    requirement <'REQ_08.01'> shutdown_req: 'Shutdown Requirement' {
        subject eacs: EACS;
    }
}
