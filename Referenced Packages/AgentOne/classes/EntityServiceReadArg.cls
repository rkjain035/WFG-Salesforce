/*
This file is generated and isn't the actual source code for this
managed global class.
This read-only file shows the class's global constructors,
methods, variables, and properties.
To enable code to compile, all methods return null.
*/
global class EntityServiceReadArg {
    global Boolean enableFLS {
        get;
    }
    global AgentOne.EntityQueryBase readQuery {
        get;
    }
    global List<AgentOne.EntityEntry> retrievedEntities {
        get;
        set;
    }
    global EntityServiceReadArg(AgentOne.EntityIdQuery readQuery, Boolean enableFLS) {

    }
}
