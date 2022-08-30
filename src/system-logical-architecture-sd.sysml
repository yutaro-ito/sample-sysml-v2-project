package 'EACS Logical Architecture Sequence'
{
    import 'EACS Logical Architecture'::*;
    
    occurrence def EACS_Sequence {
    message sensedAccelMessage
        from eacs_logical_architcture.accel_sensor.sensedAccelSent
        to eacs_logical_architcture.controller.sensedAccelReceived;

    message sensedTempMessage
        from eacs_logical_architcture.temp_sensor.sensedTempSent
        to eacs_logical_architcture.controller.sensedTempReceived;
    }
}