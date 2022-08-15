package 'EACS System Use Case'
{
    import 'EACS System Context'::*;

    // ====================================
    // Definition of System Use Cases
    // ====================================
    use case def 'Start the System' {
        subject subject_eacs: EACS[1];
        actor actor_ext_sys: External_System[1];
        objective {
            doc /* The External System wants the EACS to start the system to activate the emergency alert function. */
        }
    }
    use case def 'Stop the System' {
        subject subject_eacs: EACS[1];
        actor actor_ext_sys: External_System[1];
        objective {
            doc /* The External System wants the EACS to stop the system to deactivate the emergency alert function. */
        }
    }
    use case def 'Monitor Acceleration' {
        subject subject_eacs: EACS[1];
        actor actor_ext_env: External_Environment[1..*];
        objective {
            doc /* The External Environment wants the EACS to monitor the acceleration to decide whether emergency alert is issued or not. */
        }
    }
    use case def 'Monitor Temperature' {
        subject subject_eacs: EACS[1];
        actor actor_ext_env: External_Environment[1..*];
        objective {
            doc /* The External Environment wants the EACS to monitor the temperature to decide whether emergency alert is issued or not. */
        }
    }
    use case def 'Send Alert ON/OFF Signals Periodically' {
        subject subject_eacs: EACS[1];
        actor actor_ext_sys: External_System[1];
        objective {
            doc /* The External System wants the EACS to send alert ON/OFF signals periodically to control emergency alert. */
        }
    }

    // ====================================
    // Usage of System Use Cases
    // ====================================
    use case 'start the system': 'Start the System' {
        subject :>> subject_eacs = etac_sys_cxt.eacs;
        actor :>> actor_ext_sys = etac_sys_cxt.ext_sys;
    }
    use case 'stop the system': 'Stop the System' {
        subject :>> subject_eacs = etac_sys_cxt.eacs;
        actor :>> actor_ext_sys = etac_sys_cxt.ext_sys;
    }
    use case 'monitor acceleration': 'Monitor Acceleration' {
        subject :>> subject_eacs = etac_sys_cxt.eacs;
        actor :>> actor_ext_env = etac_sys_cxt.ext_env;
    }
    use case 'monitor temperature': 'Monitor Temperature' {
        subject :>> subject_eacs = etac_sys_cxt.eacs;
        actor :>> actor_ext_env = etac_sys_cxt.ext_env;
    }
    use case 'send alert on/off signals periodically': 'Send Alert ON/OFF Signals Periodically' {
        subject :>> subject_eacs = etac_sys_cxt.eacs;
        actor :>> actor_ext_sys = etac_sys_cxt.ext_sys;
    }
}
