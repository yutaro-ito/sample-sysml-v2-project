package 'EACS System Use Case Activity'
{
    import 'EACS Domain Knowledge'::*;
    
    // ====================================
    // Definition of Use Case Activities
    // ====================================
    // Main Action
    action def Start_System();
    action def Stop_System();
    action def Monitor_Acceleration(out out_accel: Item_Acceleration);
    action def Monitor_Temperature(out out_temp: Item_Temperature);
    action def Send_Alert_Signal_Periodically(in in_accel: Item_Acceleration, in in_temp: Item_Temperature);

    // Sub Action
    action def Initialize_Acceleration_Sensor();
    action def Initialize_Temperature_Sensor();
    action def Stop_Sending_Alert_Signal();
    action def Capture_Acceleration(out out_accel: Item_Acceleration);
    action def Capture_Temperature(out out_temp: Item_Temperature);
    action def Send_Alert_Signal_ON();
    action def Send_Alert_Signal_OFF();
    
    // ====================================
    // Usage of Use Case Activities
    // ====================================
    action start_system: Start_System {
        first start;
        then fork;
            then initialize_acceleration_sensor;
            then initialization_temperature_sensor;
        
        action initialize_acceleration_sensor: Initialize_Acceleration_Sensor;
        then joinNode;
        
        action initialization_temperature_sensor: Initialize_Temperature_Sensor;
        then joinNode;
        
        join joinNode;
        then done;
    }
    action stop_system: Stop_System {
        first start;
        then action stop_sending_alert_signal: Stop_Sending_Alert_Signal;
        then done;
    }
    action monitor_acceleration: Monitor_Acceleration {
        first start;
        then merge continueMonitoring;
        then action capture_acceleration: Capture_Acceleration {
            out out_accel = monitor_acceleration.out_accel;
        }
        then continueMonitoring;
    }
    action monitor_temperature: Monitor_Temperature {
        first start;
        then merge continueMonitoring;
        then action capture_temperature: Capture_Temperature {
            out out_temp = monitor_temperature.out_temp;
        }
        then continueMonitoring;
    }
    action send_alert_signal_periodically: Send_Alert_Signal_Periodically {
        first start;
        then merge continueSending;
        
        in in_accel = monitor_acceleration.out_accel;
        in in_temp = monitor_temperature.out_temp;

        then decide;
            if ((in_temp < -40) || (in_temp > 80)) then send_alert_signal_off;
            if (((in_accel >= -50) && (in_accel <= 50)) && ((in_temp >= -40) && (in_temp <= 80))) then send_alert_signal_off;
            if (((in_accel < -50) || (in_accel > 50)) && ((in_temp >= -40) && (in_temp <= 80))) then send_alert_signal_on;
                
        action send_alert_signal_on: Send_Alert_Signal_ON;
        then continueSending;
                
        action send_alert_signal_off: Send_Alert_Signal_OFF;
        then continueSending;
    }
}
