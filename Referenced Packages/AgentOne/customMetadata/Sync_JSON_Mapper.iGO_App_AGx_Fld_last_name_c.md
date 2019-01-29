<?xml version="1.0" encoding="UTF-8"?>
<CustomMetadata xmlns="http://soap.sforce.com/2006/04/metadata" xmlns:xsi="http://www.w3.org/2001/XMLSchema-instance" xmlns:xsd="http://www.w3.org/2001/XMLSchema">
    <label>iGO.App.AGx.Fld.last_name__c</label>
    <protected>false</protected>
    <values>
        <field>Default__c</field>
        <value xsi:type="xsd:boolean">true</value>
    </values>
    <values>
        <field>Enabled__c</field>
        <value xsi:type="xsd:boolean">true</value>
    </values>
    <values>
        <field>Entity_Name__c</field>
        <value xsi:type="xsd:string">InsuranceAppEntry</value>
    </values>
    <values>
        <field>Input_Fields__c</field>
        <value xsi:type="xsd:string">$.{a:AGENT|AAGENT}_LASTNAME__{x:1-}
$.{a:AGENT|AAGENT}_CARRAPPT_COMPANYPRODUCERID__{x:1-}</value>
    </values>
    <values>
        <field>Match_All__c</field>
        <value xsi:type="xsd:boolean">false</value>
    </values>
    <values>
        <field>Output_Field__c</field>
        <value xsi:type="xsd:string">$.agents[{a+x}].fieldMap.{ns}last_name__c.value</value>
    </values>
    <values>
        <field>Person_Type__c</field>
        <value xsi:type="xsd:string">3</value>
    </values>
    <values>
        <field>SourceId__c</field>
        <value xsi:type="xsd:string">iGO</value>
    </values>
    <values>
        <field>Transform_Action__c</field>
        <value xsi:type="xsd:string">$.{a}_LASTNAME__{x}</value>
    </values>
</CustomMetadata>
