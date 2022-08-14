package 'Emergency Alert Control System Stakeholder'
{
    part def 'Customer';
    part def 'Software Engineer';
    part def 'Verification Engineer';

    concern 'requirement traceability' {
        doc /* Will the traceable requirements in the system be completely and correctly defined? */
        stakeholder 'Customer';
    }

    concern 'requirement refinement' {
        doc /* Will you refine the requirements and allocate them to HW and SW correctly? */
        stakeholder 'Customer';
        stakeholder 'Software Engineer';
    }

    concern 'requirement and architecture definition' {
        doc /* Will the requirements and architecture in the system be completely and correctly defined? */
        stakeholder 'Customer';
        stakeholder 'Software Engineer';
    }

    concern 'feasible system requirement and architecture' {
        doc /* Will you create system requirements and architecture
               with which software engineers can define their software requirements and  architecture?
         */
        stakeholder 'Software Engineer';
    }

    concern 'verifiable architecture scenario' {
        doc /* Will you create verifiable system architecture scenario?
         */
        stakeholder 'Verification Engineer';
    }
}
