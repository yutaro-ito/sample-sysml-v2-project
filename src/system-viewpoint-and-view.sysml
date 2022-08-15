package 'EACS Viewpoint and View'
{
    import 'EACS Stakeholder'::*;
    viewpoint 'customer quality viewpoint'
    {
        frame 'requirement traceability';
        frame 'requirement and architecture definition';
        frame 'decomposition and allocation';
        require constraint
        {
            doc /* A customer quality viewpoint shall show the hierarchical
                   part decomposition of a system, starting with a
                   specified root part that is linked with requirements.
            */
        }
    }

    viewpoint 'software development viewpoint'
    {
        frame 'desigbable architecture';
        require constraint
        {
            doc /* A software development viewpoint shall show the necessary views
                   for software development such as designable architecture.
            */
        }
    }

    viewpoint 'verification viewpoint'
    {
        frame 'verifiable requirements and architecture';
        require constraint
        {
            doc /* A verifiaction development viewpoint shall show the necessary views
                   for verification of system requirements and architecture.
            */
        }
    }

    /* Views are ToDO */
    view def 'AAA View'
    {
        satisfy 'customer quality viewpoint';
        /* filter xxx */
    }
    view def 'BBB View'
    {
        satisfy 'customer quality viewpoint';
        /* filter xxx */
    }
    view def 'CCC View'
    {
        satisfy 'customer quality viewpoint';
        /* filter xxx */
    }
    view def 'PPP View'
    {
        satisfy 'software development viewpoint';
        /* filter xxx */
    }
    view def 'QQQ View'
    {
        satisfy 'software development viewpoint';
        /* filter xxx */
    }
    view def 'XXX View'
    {
        satisfy 'verification viewpoint';
        /* filter xxx */
    }
    view def 'YYY View'
    {
        satisfy 'verification viewpoint';
        /* filter xxx */
    }
    view def 'ZZZ View'
    {
        satisfy 'verification viewpoint';
        /* filter xxx */
    }
}
