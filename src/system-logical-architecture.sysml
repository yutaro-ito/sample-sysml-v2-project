package 'EACS Logical Architecture'
{
    import 'EACS System Context'::*;
    import 'EACS Item'::*;
    import 'EACS System Use Case Activity'::*;

    // ====================================
    // Definitions of System Logical Architecture
    // ====================================
    part def EACS_Logical_Architcture :> EACS;
    part eacs_logical_architcture: EACS_Logical_Architcture {
        // Part with Actions
        perform action perf_system_process :> system_process;
        part accel_sensor: Acceleration_Sensor[1] {
            // Action
            perform perf_system_process.start_system.initialize_acceleration_sensor;
            perform perf_system_process.monitor_acceleration.capture_acceleration;
            // Event
            event occurrence sensedAccelSent;
        }
        part temp_sensor: Temperature_Sensor[1] {
            // Action
            perform perf_system_process.start_system.initialization_temperature_sensor;
            perform perf_system_process.monitor_temperature.capture_temperature;
            // Event
            event occurrence sensedTempSent;            
        }
        part controller: Controller[1] {
            // Action
            perform perf_system_process.start_system.send_alert_signal_init;
            perform perf_system_process.send_alert_signal_periodically.send_alert_signal_off;
            perform perf_system_process.send_alert_signal_periodically.send_alert_signal_on;
            perform perf_system_process.stop_system.stop_sending_alert_signal;
            // Event
            event occurrence sensedAccelReceived;
            then event occurrence sensedTempReceived;            
        }

        // Port (External Interfaces)
        port p_ext_in_ext_accel: ~Port_External_Acceleration;
        port p_ext_in_ext_temp: ~Port_External_Temperature;
        port p_ext_out_alert_sig: Port_Alert_Signal;

        // Internal Interface Connection
        interface: IF_Captured_Acceleration connect
            end_out_cap_accel ::> accel_sensor.p_cap_accel to
            end_in_cap_accel ::> controller.p_cap_accel;
        interface: IF_Captured_Temperature connect
            end_out_cap_temp ::> temp_sensor.p_cap_temp to
            end_in_cap_temp ::> controller.p_cap_temp;
    }

    // ====================================
    // Definitions of Parts in System
    // ====================================
    part def Acceleration_Sensor {
        port p_ext_accel: ~Port_External_Acceleration = eacs_logical_architcture.p_ext_in_ext_accel;
        port p_cap_accel: Port_Captured_Acceleration;
    }
    part def Temperature_Sensor {
        port p_ext_temp: ~Port_External_Temperature = eacs_logical_architcture.p_ext_in_ext_temp;
        port p_cap_temp: Port_Captured_Temperature;
    }
    part def Controller {
        port p_cap_accel: ~Port_Captured_Acceleration;
        port p_cap_temp: ~Port_Captured_Temperature;
        port p_alert_sig: Port_Alert_Signal = eacs_logical_architcture.p_ext_out_alert_sig;
    }

    // ====================================
    // Definition of Port
    // ====================================
    port def Port_External_Acceleration {
        out item item_ext_accel: Item_External_Acceleration;
    }
    port def Port_External_Temperature {
        out item item_ext_temp: Item_External_Temperature;
    }
    port def Port_Captured_Acceleration {
        out item item_cap_accel: Item_Captured_Acceleration;
    }
    port def Port_Captured_Temperature {
        out item item_cap_temp: Item_Captured_Temperature;
    }
    port def Port_Alert_Signal {
        out item item_alert_sig: Item_Alert_Signal;
    }

    // ====================================
    // Definitions of Interfaces
    // ====================================
    interface def IF_Captured_Acceleration {
        end end_out_cap_accel: Port_Captured_Acceleration;
        end end_in_cap_accel: ~Port_Captured_Acceleration;
    }
    interface def IF_Captured_Temperature {
        end end_out_cap_temp: Port_Captured_Temperature;
        end end_in_cap_temp: ~Port_Captured_Temperature;
    }
}