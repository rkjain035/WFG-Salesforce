<?xml version="1.0" encoding="UTF-8"?>
<CustomMetadata xmlns="http://soap.sforce.com/2006/04/metadata" xmlns:xsi="http://www.w3.org/2001/XMLSchema-instance" xmlns:xsd="http://www.w3.org/2001/XMLSchema">
    <label>iGO.App.INx.RE.CON.employer_addr_stre</label>
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
        <value xsi:type="xsd:string">$.EMP_ADDR_BUS_LINE1__{x:1-}
$.EMP_ADDR_BUS_LINE2__{x:1-}
$.EMP_ADDR_BUS_LINE3__{x:1-}
$.EMP_ADDR_BUS_LINE4__{x:1-}
$.EMP_ADDR_BUS_LINE5__{x:1-}
$.PI_LASTNAME__{x:1-}</value>
    </values>
    <values>
        <field>Match_All__c</field>
        <value xsi:type="xsd:boolean">false</value>
    </values>
    <values>
        <field>Output_Field__c</field>
        <value xsi:type="xsd:string">$.insureds[{x}].relatedEntryMap.contact.relatedEntryMap.factfinder.fieldMap.{ns}employer_address_street__c.value</value>
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
        <value xsi:type="xsd:string">ToMultiline($.EMP_ADDR_BUS_LINE1__{x}, $.EMP_ADDR_BUS_LINE2__{x}, $.EMP_ADDR_BUS_LINE3__{x}, $.EMP_ADDR_BUS_LINE4__{x}, $.EMP_ADDR_BUS_LINE5__{x})</value>
    </values>
</CustomMetadata>
