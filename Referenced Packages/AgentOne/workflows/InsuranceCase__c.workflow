<?xml version="1.0" encoding="UTF-8"?>
<Workflow xmlns="http://soap.sforce.com/2006/04/metadata">
    <rules>
        <fullName>iGo Illustration Completed Task</fullName>
        <actions>
            <name>Illustration_Completed</name>
            <type>Task</type>
        </actions>
        <active>true</active>
        <criteriaItems>
            <field>InsuranceCase__c.Event_Trigger__c</field>
            <operation>equals</operation>
            <value>ILLUSTRATION_COMPLETED</value>
        </criteriaItems>
        <description>Create a completed Task when an iGO illustration completed event is received.</description>
        <triggerType>onCreateOrTriggeringUpdate</triggerType>
    </rules>
    <tasks>
        <fullName>Illustration_Completed</fullName>
        <assignedToType>owner</assignedToType>
        <dueDateOffset>0</dueDateOffset>
        <notifyAssignee>false</notifyAssignee>
        <priority>Normal</priority>
        <protected>false</protected>
        <status>Completed</status>
        <subject>Illustration Completed</subject>
    </tasks>
</Workflow>
