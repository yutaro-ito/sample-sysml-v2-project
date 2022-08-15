package 'EACS System Use Case'
{
    import 'EACS System Context'::*;

    // ====================================
    // Definition of System Use Cases
    // ====================================
    use case def 'Start_System' {
        subject subject_eacs: EACS[1];
        actor actor_ext_sys: External_System[1];
        objective {
            doc /* The External System wants the EACS to start the system to activate the emergency alert function. */
        }
    }
    use case def 'Stop_System' {
        subject subject_eacs: EACS[1];
        actor actor_ext_sys: External_System[1];
        objective {
            doc /* The External System wants the EACS to stop the system to deactivate the emergency alert function. */
        }
    }
    use case def 'Monitor_Acceleration' {
        subject subject_eacs: EACS[1];
        actor actor_ext_env: External_Environment[1..*];
        objective {
            doc /* The External Environment wants the EACS to monitor the acceleration to decide whether emergency alert is issued or not. */
        }
    }
    use case def 'Monitor_Temperature' {
        subject subject_eacs: EACS[1];
        actor actor_ext_env: External_Environment[1..*];
        objective {
            doc /* The External Environment wants the EACS to monitor the temperature to decide whether emergency alert is issued or not. */
        }
    }
    use case def 'Send_Alert_Signal_Periodically' {
        subject subject_eacs: EACS[1];
        actor actor_ext_sys: External_System[1];
        objective {
            doc /* The External System wants the EACS to send alert ON/OFF signals periodically to control emergency alert. */
        }
    }

    // ====================================
    // Usage of System Use Cases
    // ====================================
    use case 'start_system': 'Start_System' {
        subject :>> subject_eacs = etac_sys_cxt.eacs;
        actor :>> actor_ext_sys = etac_sys_cxt.ext_sys;
    }
    use case 'stop_system': 'Stop_System' {
        subject :>> subject_eacs = etac_sys_cxt.eacs;
        actor :>> actor_ext_sys = etac_sys_cxt.ext_sys;
    }
    use case 'monitor_acceleration': 'Monitor_Acceleration' {
        subject :>> subject_eacs = etac_sys_cxt.eacs;
        actor :>> actor_ext_env = etac_sys_cxt.ext_env;
    }
    use case 'monitor_temperature': 'Monitor_Temperature' {
        subject :>> subject_eacs = etac_sys_cxt.eacs;
        actor :>> actor_ext_env = etac_sys_cxt.ext_env;
    }
    use case 'send_alert_signal_periodically': 'Send_Alert_Signal_Periodically' {
        subject :>> subject_eacs = etac_sys_cxt.eacs;
        actor :>> actor_ext_sys = etac_sys_cxt.ext_sys;
    }
}
