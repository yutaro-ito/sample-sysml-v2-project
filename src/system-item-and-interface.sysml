package 'EACS Item and Interface'
{
    // ====================================
    // Definition of Item
    // ====================================
    item def Item_External_Acceleration :> ScalarValues::Integer;
    item def Item_External_Temperature :> ScalarValues::Integer;
    item def Item_Captured_Acceleration :> ScalarValues::Integer;
    item def Item_Captured_Temperature :> ScalarValues::Integer;
    item def Item_Alert_Signal :> ScalarValues::Boolean;

    // ====================================
    // Definition of Port
    // ====================================
    port def Port_External_Acceleration {
        in item item_ext_accel: Item_External_Acceleration;
    }
    port def Port_External_Temperature {
        in item item_ext_temp: Item_External_Temperature;
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
}
