package 'EACS Domain Knowledge'
{
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
    // Definition of Item
    // ====================================
    item def Item_Acceleration :> ScalarValues::Integer;
    item def Item_Temperature :> ScalarValues::Integer;
}
