package 'EACS Logical Architecture State Machine'
{
    state def EACS_State_Machine;

    attribute def TRG_Power_ON;
    attribute def TRG_Power_OFF;
    attribute def TRG_Initialization_Completed;

    state eace_state_machine: EACS_State_Machine {
        // Entry
        entry; then Power_OFF_State;
        // State
        state Power_OFF_State;
        accept TRG_Power_ON then Power_ON_State;

        state Power_ON_State {
            // Entry
            entry; then Initialization_State;
            // State
            state Initialization_State;
            accept TRG_Initialization_Completed then Runtime_State;
            state Runtime_State;
        }
        accept TRG_Power_OFF then Power_OFF_State;
    }
}
