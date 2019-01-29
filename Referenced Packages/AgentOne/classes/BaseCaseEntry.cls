/*
This file is generated and isn't the actual source code for this
managed global class.
This read-only file shows the class's global constructors,
methods, variables, and properties.
To enable code to compile, all methods return null.
*/
global abstract class BaseCaseEntry extends AgentOne.EntityEntry {
    global List<AgentOne.EntityEntry> agents {
        get;
    }
    global List<AgentOne.EntityEntry> coverages {
        get;
    }
    global List<AgentOne.EntityEntry> insureds {
        get;
    }
    global List<AgentOne.EntityEntry> parties {
        get;
    }
    global AgentOne.EntityEntry primaryInsured {
        get;
    }
    global BaseCaseEntry() {

    }
    global virtual void setPhase(String phase) {

    }
}
