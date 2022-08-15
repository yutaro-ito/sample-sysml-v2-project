package 'EACS System Context'
{
    import 'EACS System Definition'::*;

    // ====================================
    // Definitions of System Context
    // ====================================
    part def EACS_System_Context {
        part eacs: EACS[1];
        part ext_sys: External_System[1];
        part ext_env: External_Environment[1..*];
    }
}
