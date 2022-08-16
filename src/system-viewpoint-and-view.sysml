package 'EACS Viewpoint and View'
{
    import 'EACS Stakeholder'::*;

    /* ToDo */

    // ====================================
    // Definition of Viewpoints
    // ====================================
    viewpoint 'customer quality viewpoint' {
        frame 'requirement traceability';
        frame 'requirement and architecture definition';
        frame 'decomposition and allocation';
        require constraint {
            doc /* A customer quality viewpoint shall show the hierarchical
                   part decomposition of a system, starting with a
                   specified root part that is linked with requirements.
            */
        }
    }

    viewpoint 'software development viewpoint' {
        frame 'desigbable architecture';
        require constraint {
            doc /* A software development viewpoint shall show the necessary views
                   for software development such as designable architecture.
            */
        }
    }

    viewpoint 'verification viewpoint' {
        frame 'verifiable requirements and architecture';
        require constraint {
            doc /* A verifiaction development viewpoint shall show the necessary views
                   for verification of system requirements and architecture.
            */
        }
    }

    // ====================================
    // Definition of Views (ToDo)
    // ====================================
    view def 'Customer Quality View' {
        satisfy 'customer quality viewpoint';
    }
    view def 'Software Development View' {
        satisfy 'software development viewpoint';
    }
    view def 'Verification View' {
        satisfy 'verification viewpoint';
    }

    // ====================================
    // Usage of Views (ToDo)
    // ====================================
    view 'customer quality view': 'Customer Quality View' {
        /* ToDo */
    }
    view 'software development view': 'Software Development View' {
        /* ToDo */

    }
    view 'verification view': 'Verification View' {
        /* ToDo */
    }
}
