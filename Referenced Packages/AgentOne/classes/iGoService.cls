/*
This file is generated and isn't the actual source code for this
managed global class.
This read-only file shows the class's global constructors,
methods, variables, and properties.
To enable code to compile, all methods return null.
*/
global class iGoService {
    global iGoService() {

    }
    global List<AgentOne.EntityServiceResult> deleteInsuranceCases(List<Id> entityIds) {
        return null;
    }
    global Id duplicateInsuranceCase(Id originalCaseId, Id duplicateCaseId) {
        return null;
    }
    global String geteSignUrl(Id insuranceCaseId) {
        return null;
    }
    webService static Boolean reRunIllustration(String illuId) {
        return null;
    }
global class CustomField {
    global String entityName {
        get;
        set;
    }
    global String fieldName {
        get;
        set;
    }
    global CustomField(String eName, String fName) {

    }
}
global virtual class FieldTransformation implements AgentOne.IFieldValueTransformer {
    global FieldTransformation() {

    }
}
global interface IPrefillPlugin {
    Object onFieldPrefilling(String param0, String param1, String param2, String param3, Object param4);
    String onPrefilling(AgentOne.EntityEntry param0, AgentOne.EntityEntry param1, String param2);
}
}
