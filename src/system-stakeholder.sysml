package 'EACS Stakeholder'
{
    // ====================================
    // Definition of Stakeholders
    // ====================================
    part def 'Customer';
    part def 'Software Engineer';
    part def 'Verification Engineer';

    // ====================================
    // Definition of Stakeholders' Concerns
    // ====================================
    concern 'requirement traceability' {
        doc /* Will the traceable requirements in the system be completely and correctly defined? */
        stakeholder 'Customer';
    }

    concern 'decomposition and allocation' {
        doc /* Will you decompose system to sub-systems and allocate them to HW and SW correctly? */
        stakeholder 'Customer';
        stakeholder 'Software Engineer';
    }

    concern 'requirement and architecture definition' {
        doc /* Will the requirements and architecture in the system be completely and correctly defined? */
        stakeholder 'Customer';
        stakeholder 'Software Engineer';
    }

    concern 'desigbable architecture' {
        doc /* Will you create architecture with which software engineers can define their software requirements and architecture? */
        stakeholder 'Software Engineer';
    }

    concern 'verifiable requirements and architecture' {
        doc /* Will you create requirements and architecture with which verification engineers can define their test scenarios? */
        stakeholder 'Verification Engineer';
    }
}
