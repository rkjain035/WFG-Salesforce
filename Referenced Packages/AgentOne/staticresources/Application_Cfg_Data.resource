NAME,KEY__C,VALUE__C,CATEGORY__c,PERSON_TYPE
Illustration__c.PrimaryInsuredName,AgentOne__Illustration__c.AgentOne__Primary_Insured_Annuitant_Name__c,[Replace with field Id],FieldID,3
Illustration__c.InsuranceCase__c,AgentOne__Illustration__c.AgentOne__InsuranceCase__c,[Replace with field Id],FieldID,3
Illustration__c.Product_Type__c,AgentOne__Illustration__c.AgentOne__Product_Type__c,[Replace with field Id],FieldID,3
Case Owner Record Type,PA.RecordType.CaseOwner,PersonAccount,RecordType,1
Case Owner Record Type,PA.RecordType.CaseOwner,IndustriesIndividual,RecordType,2
Primary Insured Record Type,PA.RecordType.PrimaryInsured,PersonAccount,RecordType,1
Primary Insured Record Type,PA.RecordType.PrimaryInsured,IndustriesIndividual,RecordType,2
Beneficiary Record Type,PA.RecordType.CaseBeneficiary,PersonAccount,RecordType,1
Beneficiary Record Type,PA.RecordType.CaseBeneficiary,IndustriesIndividual,RecordType,2
Payor Record Type,PA.RecordType.CasePayor,PersonAccount,RecordType,1
Payor Record Type,PA.RecordType.CasePayor,IndustriesIndividual,RecordType,2
Entity Case Owner Record Type,BA.RecordType.CaseOwner,Business_Account,RecordType,1
Entity Case Owner Record Type,BA.RecordType.CaseOwner,IndustriesBusiness,RecordType,2
Entity Beneficiary Record Type,BA.RecordType.CaseBeneficiary,Business_Account,RecordType,1
Entity Beneficiary Record Type,BA.RecordType.CaseBeneficiary,IndustriesBusiness,RecordType,2
Entity Payor Record Type,BA.RecordType.CasePayor,Business_Account,RecordType,1
Entity Payor Record Type,BA.RecordType.CasePayor,IndustriesBusiness,RecordType,2
Additional Insured Record Type,PA.RecordType.AdditionalInsured,PersonAccount,RecordType,1
Additional Insured Record Type,PA.RecordType.AdditionalInsured,IndustriesIndividual,RecordType,2
Application - Beneficiary Client,PA.App.Beneficiary.Upsert,2,Client Record,3
Application - Owner Client,PA.App.Owner.Upsert,2,Client Record,3
Application - Payor Client,PA.App.Payor.Upsert,2,Client Record,3
Application - Spouse Client,PA.App.Spouse.Upsert,2,Client Record,3
Application - Child Client,PA.App.Child.Upsert,2,Client Record,3
Pending Case - Primary Insured Client,PA.PC.PrimaryInsured.Update,1,Client Record,3
Pending Case - Beneficiary Client,PA.PC.Beneficiary.Upsert,2,Client Record,3
Pending Case - Owner Client,PA.PC.Owner.Upsert,2,Client Record,3
Pending Case - Payor Client,PA.PC.Payor.Upsert,2,Client Record,3
Inforce - Primary Insured Client,PA.Inforce.PrimaryInsured.Update,1,Client Record,3
Inforce - Beneficiary Client,PA.Inforce.Beneficiary.Upsert,2,Client Record,3
Inforce - Owner Client,PA.Inforce.Owner.Upsert,2,Client Record,3
Inforce - Payor Client,PA.Inforce.Payor.Upsert,2,Client Record,3
e-App - Create,Relationship.eApp.Upsert,Yes,Relationship Mgmt By Source,3
Pending Case - Create,Relationship.PC.Upsert,Yes,Relationship Mgmt By Source,3
Inforce Policy - Create,Relationship.Inforce.Upsert,Yes,Relationship Mgmt By Source,3
Joint Insured Record Type,PA.RecordType.JointInsured,PersonAccount,RecordType,1
Joint Insured Record Type,PA.RecordType.JointInsured,IndustriesIndividual,RecordType,2
Application - Joint Insured Client,PA.App.JointInsured.Upsert,1,Client Record,3
Pending Case - Joint Insured Client,PA.PC.JointInsured.Upsert,1,Client Record,3
Inforce - Joint Insured Client,PA.Inforce.JointInsured.Upsert,1,Client Record,3
Ext Id of Account in Policy,Feed.Policy.Account.ExternalId,FALSE,Match by External ID,3
Ext Id of child objs in Policy,Feed.Policy.Children.ExternalId,FALSE,Match by External ID,3
Ext Id of Account in Pending Case,Feed.PendingCase.Account.ExternalId,FALSE,Match by External ID,3
Ext Id of child objs in Pending Case,Feed.PendingCase.Children.ExternalId,FALSE,Match by External ID,3
# of Sync Records in the batch,Feed.Policy.Batchsize,100,Match by External ID,3
Display - ProductAsHyperLinks,Display.DisplayProductAsHyperLink,TRUE,Display,3
Sync Monitor - Default Batch Size,Sync.Monitor.Process.BatchSize,1000,Process Monitoring,3
Prefill Transform - GetAppointmentCode,Prefill.Transforms.GetAppointmentCode,GetAppointmentCode,Prefill,3