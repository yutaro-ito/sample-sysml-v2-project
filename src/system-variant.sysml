package 'EACS System Variant'
{
    import 'EACS System Context'::*;
    import 'EACS Item'::*;
    import 'EACS Logical Architecture'::*;

    // ====================================
    // Definitions of Variant Parts in System
    // ====================================
    part low_end_accel_sensor: Acceleration_Sensor[1];
    part high_end_accel_sensor: Acceleration_Sensor[1];
    part low_end_temp_sensor: Temperature_Sensor[1];
    part high_end_temp_sensor: Temperature_Sensor[1];
    part low_end_controller: Controller[1];
    part high_end_controller: Controller[1];

    // ====================================
    // Variability Model
    // ====================================
    variation part def Acceleration_Sensor_Choices :> Acceleration_Sensor {
        variant low_end_accel_sensor;
        variant high_end_accel_sensor;
    }
    variation part def Temperature_Sensor_Choices :> Temperature_Sensor {
        variant low_end_temp_sensor;
        variant high_end_temp_sensor;
    }
    variation part def Controller_Sensor_Choices :> Controller {
        variant low_end_controller;
        variant high_end_controller;
    }

    // ====================================
    // Variant Configuration
    // ====================================
    part var_accel_sensor: Acceleration_Sensor_Choices[1];
    part var_temp_sensor: Temperature_Sensor_Choices[1];
    part var_controller: Controller_Sensor_Choices[1];

    abstract part EACS_Family: EACS {
        part accel_sensor: Acceleration_Sensor_Choices;
        part temp_sensor: Temperature_Sensor_Choices;
        part controller: Controller_Sensor_Choices;
    }

    // Patern #1 Super Low End
    part EACS_Super_Low_End :> EACS_Family {
        part redefines accel_sensor = var_accel_sensor::low_end_accel_sensor;
        part redefines temp_sensor = var_temp_sensor::low_end_temp_sensor;
        part redefines controller = var_controller::low_end_controller;
    }

    // Patern #2 Intelligent Controller
    part EACS_Intelligent_COntroller :> EACS_Family {
        part redefines accel_sensor = var_accel_sensor::low_end_accel_sensor;
        part redefines temp_sensor = var_temp_sensor::low_end_temp_sensor;
        part redefines controller = var_controller::high_end_controller;
    }

    // Patern #3 Super High End
    part EACS_Super_High_End :> EACS_Family {
        part redefines accel_sensor = var_accel_sensor::high_end_accel_sensor;
        part redefines temp_sensor = var_temp_sensor::high_end_temp_sensor;
        part redefines controller = var_controller::high_end_controller;
    }
}
