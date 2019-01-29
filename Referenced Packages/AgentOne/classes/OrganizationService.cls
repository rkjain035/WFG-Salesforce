/*
This file is generated and isn't the actual source code for this
managed global class.
This read-only file shows the class's global constructors,
methods, variables, and properties.
To enable code to compile, all methods return null.
*/
global class OrganizationService {
    global OrganizationService() {

    }
    global Id createEntity(AgentOne.EntityEntry entity) {
        return null;
    }
    webService static List<Integer> deactivateInsuranceCases(List<Id> caseIds, Boolean isDeactivate) {
        return null;
    }
    global void deleteEntity(Id entityId) {

    }
    webService static List<Integer> dismissAlerts(List<Id> alertIds) {
        return null;
    }
    webService static String duplicateExternalInsuranceCases(List<Id> caseIds, List<String> externalIds, String sourceSystem, Boolean permissionCheck) {
        return null;
    }
    global static String exportSettings(String settingName) {
        return null;
    }
    webService static List<String> hashTaxIds(List<String> taxIds) {
        return null;
    }
    global static List<List<String>> importSettings(String settingName, String csvContents) {
        return null;
    }
    global static void log(String logSource, String logMessage) {

    }
    global AgentOne.EntityEntry retrieveEntity(Id entityId) {
        return null;
    }
    webService static List<Integer> setAlertsPriority(List<Id> alertIds, String priority) {
        return null;
    }
    global void updateEntity(AgentOne.EntityEntry entity) {

    }
global enum AccessLevel {Full, None, Read, ReadWrite}
}
