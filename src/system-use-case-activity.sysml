package 'EACS System Use Case Activity'
{
    import 'EACS Item'::*;
    
    // ====================================
    // Definition of Use Case Activities
    // ====================================
    // Main Action
    action def System_Process { in in_ext_accel: Item_External_Acceleration; in in_ext_temp: Item_External_Temperature; out out_alert_sig: Item_Alert_Signal; }
    action def Start_System { out out_alert_sig: Item_Alert_Signal; }
    action def Monitor_Acceleration { in in_ext_accel: Item_External_Acceleration; out out_accel: Item_Captured_Acceleration; }
    action def Monitor_Temperature { in in_ext_temp: Item_External_Temperature; out out_temp: Item_Captured_Temperature; }
    action def Send_Alert_Signal_Periodically { in in_accel: Item_Captured_Acceleration; in in_temp: Item_Captured_Temperature; out out_alert_sig: Item_Alert_Signal; }
    action def Stop_System {}

    // Sub Action
    action def Initialize_Acceleration_Sensor {}
    action def Initialize_Temperature_Sensor {}
    action def Capture_Acceleration { in in_ext_accel: Item_External_Acceleration; out out_accel: Item_Captured_Acceleration; }
    action def Capture_Temperature { in in_ext_temp: Item_External_Temperature; out out_temp: Item_Captured_Temperature; }
    action def Send_Alert_Signal_ON { out out_alert_sig_on: Item_Alert_Signal; }
    action def Send_Alert_Signal_OFF { out out_alert_sig_off: Item_Alert_Signal; }
    action def Send_Alert_Signal_Initial { out out_alert_sig_off: Item_Alert_Signal; }
    action def Stop_Sending_Alert_Signal{}

    // ====================================
    // Usage of Use Case Activities
    // ====================================
    action system_process: System_Process {
        in item in_ext_accel: Item_External_Acceleration;
        in item in_ext_temp: Item_External_Temperature;
        out item out_alert_sig: Item_Alert_Signal;

        first start;
        then action start_system: Start_System {
            out item out_alert_sig: Item_Alert_Signal;

            first start;
            then fork;
                then initialize_acceleration_sensor;
                then initialization_temperature_sensor;
                then send_alert_signal_init;
            
            action initialize_acceleration_sensor: Initialize_Acceleration_Sensor;
            then joinNode;
            
            action initialization_temperature_sensor: Initialize_Temperature_Sensor;
            then joinNode;

            action send_alert_signal_init: Send_Alert_Signal_Initial {
                out item out_alert_sig_off = start_system::out_alert_sig;
            }
            then joinNode;

            join joinNode;
            then done;
        }
        then fork;
            then monitor_acceleration;
            then monitor_temperature;
            then send_alert_signal_periodically;
        
        action monitor_acceleration: Monitor_Acceleration {
            in item in_ext_accel = system_process::in_ext_accel;
            out item out_accel;
            
            first start;
            then merge continueMonitoring;
            then action capture_acceleration: Capture_Acceleration {
                in item in_ext_accel = monitor_acceleration::in_ext_accel;
                out item out_accel = monitor_acceleration::out_accel;
            }
            then continueMonitoring;
        }
        then joinNode;
        action monitor_temperature: Monitor_Temperature {
            in item in_ext_temp = system_process::in_ext_temp;
            out item out_temp;
            
            first start;
            then merge continueMonitoring;
            then action capture_temperature: Capture_Temperature {
                in item in_ext_temp = monitor_temperature::in_ext_temp;
                out item out_temp = monitor_temperature::out_temp;
            }
            then continueMonitoring;
        }
        then joinNode;
        action send_alert_signal_periodically: Send_Alert_Signal_Periodically {
            in item in_accel = monitor_acceleration.out_accel;
            in item in_temp = monitor_temperature.out_temp;
            out item out_alert_sig: Item_Alert_Signal;

            first start;
            then merge continueSending;
            then decide;
                // @ToDo temporary solution
                if in_temp < -40 then send_alert_signal_off;
                if in_temp > 80 then send_alert_signal_off;
                if in_accel < -50 then send_alert_signal_on;
                if in_accel > 50 then send_alert_signal_on;
                if in_accel >= -50 then send_alert_signal_off;
                if in_accel <= 50 then send_alert_signal_off;
// @ToDo
//                if ((in_temp < -40) || (in_temp > 80)) then send_alert_signal_off;
//                if (((in_accel >= -50) && (in_accel <= 50)) && ((in_temp >= -40) && (in_temp <= 80))) then send_alert_signal_off;
//                if (((in_accel < -50) || (in_accel > 50)) && ((in_temp >= -40) && (in_temp <= 80))) then send_alert_signal_on;
                    
            action send_alert_signal_on: Send_Alert_Signal_ON {
                out item out_alert_sig_on = send_alert_signal_periodically::out_alert_sig;
            }
            then continueSending;
                    
            action send_alert_signal_off: Send_Alert_Signal_OFF {
                out item out_alert_sig_off = send_alert_signal_periodically::out_alert_sig;
            }
            then continueSending;
        }
        then joinNode;

        join joinNode;
        then action stop_system: Stop_System {
            first start;
            then action stop_sending_alert_signal: Stop_Sending_Alert_Signal;
            then done;
        }
        then done;
    }
}
