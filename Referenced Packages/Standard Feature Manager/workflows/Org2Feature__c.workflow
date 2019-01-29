<?xml version="1.0" encoding="UTF-8"?>
<Workflow xmlns="http://soap.sforce.com/2006/04/metadata">
    <alerts>
        <fullName>Send_eMail_to_Business_Owner</fullName>
        <description>Send eMail to Business Owner</description>
        <protected>false</protected>
        <recipients>
            <field>Business_Owner__c</field>
            <type>userLookup</type>
        </recipients>
        <senderType>CurrentUser</senderType>
        <template>Standard_Feature_Manager/Initial_Email_Task_Assignment</template>
    </alerts>
    <alerts>
        <fullName>Send_email_to_IT_Owner</fullName>
        <description>Send email to IT Owner</description>
        <protected>false</protected>
        <recipients>
            <field>IT_Owner__c</field>
            <type>userLookup</type>
        </recipients>
        <senderType>CurrentUser</senderType>
        <template>Standard_Feature_Manager/Initial_Email_Task_Assignment</template>
    </alerts>
    <rules>
        <fullName>Business Owner Assignment</fullName>
        <actions>
            <name>Send_eMail_to_Business_Owner</name>
            <type>Alert</type>
        </actions>
        <active>true</active>
        <description>Notify Business Owner that they have a Org2Feature assignment to review.</description>
        <formula>AND(NOT(ISNULL(Business_Owner__c)),   (ISPICKVAL(Status__c, &quot;0. Not Reviewed&quot;)))</formula>
        <triggerType>onCreateOrTriggeringUpdate</triggerType>
    </rules>
    <rules>
        <fullName>IT Owner Assignment</fullName>
        <actions>
            <name>Send_email_to_IT_Owner</name>
            <type>Alert</type>
        </actions>
        <active>true</active>
        <description>Notify IT Owner that they have a Org2Feature assignment to review.</description>
        <formula>AND(NOT(ISNULL(IT_Owner__c)),   ISPICKVAL(Status__c, &quot;0. Not Reviewed&quot;))</formula>
        <triggerType>onCreateOrTriggeringUpdate</triggerType>
    </rules>
</Workflow>
