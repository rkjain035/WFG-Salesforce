/*
This file is generated and isn't the actual source code for this
managed global class.
This read-only file shows the class's global constructors,
methods, variables, and properties.
To enable code to compile, all methods return null.
*/
global virtual class EntityEntry implements System.Comparable {
    global String externalId {
        get;
        set;
    }
    global String id {
        get;
        set;
    }
    global String linkId {
        get;
        set;
    }
    global String linkRef {
        get;
        set;
    }
    global String objectType {
        get;
        set;
    }
    global EntityEntry() {

    }
    global EntityEntry(Schema.SObjectType sObjectType) {

    }
    global EntityEntry(String objectType) {

    }
    global void addFieldEntry(AgentOne.EntityEntry.FieldEntry fentry) {

    }
    global virtual AgentOne.EntityEntry addRelatedEntry(String key, AgentOne.EntityEntry relatedEntry) {
        return null;
    }
    global virtual void clearFieldEntries() {

    }
    global virtual Integer compareTo(Object compareTo) {
        return null;
    }
    global Boolean containsField(String fieldName) {
        return null;
    }
    global virtual List<AgentOne.EntityEntry> createRelatedEntryList(String key) {
        return null;
    }
    global static AgentOne.EntityEntry deserialize(String jsonString, System.Type entityType) {
        return null;
    }
    global AgentOne.EntityEntry.FieldEntry getFieldEntry(Schema.SObjectField field) {
        return null;
    }
    global AgentOne.EntityEntry.FieldEntry getFieldEntry(String fieldName) {
        return null;
    }
    global virtual Set<String> getFieldNames() {
        return null;
    }
    global String getFieldValue(Schema.SObjectField field) {
        return null;
    }
    global String getFieldValue(String fieldName) {
        return null;
    }
    global List<AgentOne.EntityEntry.FieldEntry> getFields() {
        return null;
    }
    global virtual AgentOne.EntityEntry getRelatedEntry(String key) {
        return null;
    }
    global virtual List<AgentOne.EntityEntry> getRelatedEntryList(String key) {
        return null;
    }
    global virtual AgentOne.EntityEntry.FieldEntry removeFieldEntry(Schema.SObjectField field) {
        return null;
    }
    global virtual AgentOne.EntityEntry.FieldEntry removeFieldEntry(String fieldName) {
        return null;
    }
    global virtual AgentOne.EntityEntry removeRelatedEntry(String key) {
        return null;
    }
    global virtual List<AgentOne.EntityEntry> removeRelatedEntryList(String key) {
        return null;
    }
    global static String serialize(AgentOne.EntityEntry entity) {
        return null;
    }
    global void setFieldValue(Schema.SObjectField field, String value) {

    }
    global void setFieldValue(String fieldName, String value) {

    }
global virtual class FieldEntry {
    global String name {
        get;
        set;
    }
    global String value {
        get;
        set;
    }
    global FieldEntry() {

    }
    global FieldEntry(String name, String value) {

    }
}
}
