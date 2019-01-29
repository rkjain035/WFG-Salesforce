<?xml version="1.0" encoding="UTF-8"?>
<CustomMetadata xmlns="http://soap.sforce.com/2006/04/metadata" xmlns:xsi="http://www.w3.org/2001/XMLSchema-instance" xmlns:xsd="http://www.w3.org/2001/XMLSchema">
    <label>iGO.App.PAx.Fld.name</label>
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
        <value xsi:type="xsd:string">$.{t:OWNP|PB|PYR|CB}_FULLNAME__{x:1-}
$.{t:OWNP|PB|PYR|CB}_FIRSTNAME__{x:1-}
$.{t:OWNP|PB|PYR|CB}_MIDDLENAME__{x:1-}
$.{t:OWNP|PB|PYR|CB}_LASTNAME__{x:1-}</value>
    </values>
    <values>
        <field>Match_All__c</field>
        <value xsi:type="xsd:boolean">false</value>
    </values>
    <values>
        <field>Output_Field__c</field>
        <value xsi:type="xsd:string">$.parties[{t+x}].fieldMap.name.value</value>
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
        <value xsi:type="xsd:string">ToFullName($.{t}_FULLNAME__{x}, $.{t}_FIRSTNAME__{x}, $.{t}_MIDDLENAME__{x}, $.{t}_LASTNAME__{x})</value>
    </values>
</CustomMetadata>
