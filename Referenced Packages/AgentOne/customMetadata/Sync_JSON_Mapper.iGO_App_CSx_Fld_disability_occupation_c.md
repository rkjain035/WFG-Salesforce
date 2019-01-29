<?xml version="1.0" encoding="UTF-8"?>
<CustomMetadata xmlns="http://soap.sforce.com/2006/04/metadata" xmlns:xsi="http://www.w3.org/2001/XMLSchema-instance" xmlns:xsd="http://www.w3.org/2001/XMLSchema">
    <label>iGO.App.CSx.Fld.disability_occupation__c</label>
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
        <value xsi:type="xsd:string">$.PI_{p:1|2|3|4|5|6|7|8|9|10|11|12|13|14|15|16|17|18|19|20}_POL_PART_OCCUPATION__1
$.POL_{p:1|2|3|4|5|6|7|8|9|10|11|12|13|14|15|16|17|18|19|20}_INSURANCECASEID</value>
    </values>
    <values>
        <field>Match_All__c</field>
        <value xsi:type="xsd:boolean">false</value>
    </values>
    <values>
        <field>Output_Field__c</field>
        <value xsi:type="xsd:string">$.insurancecases[{p}].fieldMap.{ns}disability_occupation__c.value</value>
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
        <value xsi:type="xsd:string">$.PI_{p}_POL_PART_OCCUPATION__1</value>
    </values>
</CustomMetadata>
