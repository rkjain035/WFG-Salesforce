<?xml version="1.0" encoding="UTF-8"?>
<CustomMetadata xmlns="http://soap.sforce.com/2006/04/metadata" xmlns:xsi="http://www.w3.org/2001/XMLSchema-instance" xmlns:xsd="http://www.w3.org/2001/XMLSchema">
    <label>iGO.App.PAx.RE.ACC.billingcountry</label>
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
        <value xsi:type="xsd:string">$.{t:OWNP|PB|PYR|CB}_ADDR_BUS_ADDRESSCOUNTRYTC_TC__{x:1-}
$.{t:OWNP|PB|PYR|CB}_PARTYTYPECODE_TC__{x:1-}</value>
    </values>
    <values>
        <field>Match_All__c</field>
        <value xsi:type="xsd:boolean">true</value>
    </values>
    <values>
        <field>Output_Field__c</field>
        <value xsi:type="xsd:string">$.parties[{t+x}].relatedEntryMap.account.fieldMap.billingcountry.value</value>
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
        <value xsi:type="xsd:string">MapIf($.{t}_PARTYTYPECODE_TC__{x}==&quot;2&quot;, ToAcordName($.{t}_ADDR_BUS_ADDRESSCOUNTRYTC_TC__{x}, &quot;nation_tc&quot;))</value>
    </values>
</CustomMetadata>
