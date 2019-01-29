<!-- Page Layout Template -->
<Pagelayouts entityName="Setting.iGOSettings">
    <Layout mode="Edit" entityName="Setting.iGOSettings">
        <!-- Page Header -->
        <Header />
        <!-- Page Body -->
        <Body id="body">
            <!-- Page Section, Leave cols attribute empty -->
            <UISection cols="" label="Information">
                <UIColumn cols="">
                    <UIInputField field="batchsizeforcases" value="v.entity.batchsizeforcases" id="batchsizeforcases" />
                    <UIInputField field="restrictresendemaildomain" value="v.entity.restrictresendemaildomain" id="restrictresendemaildomain" />
                    <UIInputField field="isonbehalfofenabled" value="v.entity.isonbehalfofenabled" id="isonbehalfofenabled" />
                    <UIInputField field="isactionablealertsenabled" value="v.entity.isactionablealertsenabled" id="isactionablealertsenabled" />
                    <UIInputField field="isesignenabled" value="v.entity.isesignenabled" id="isesignenabled" />
                    <UIInputField field="isstarteappfromillenabled" value="v.entity.isstarteappfromillenabled" id="isstarteappfromillenabled" />
                    <UIInputField field="isrerunillenabled" value="v.entity.isrerunillenabled" id="isrerunillenabled" />                   
                </UIColumn>

                <UIColumn cols="">                    
                    <UIInputField field="isresendesignenabled" value="v.entity.isresendesignenabled" id="isresendesignenabled" />
                    <UIInputField field="iseditemailbeforeresendenabled" value="v.entity.iseditemailbeforeresendenabled" id="iseditemailbeforeresendenabled" /> 
                    <UIInputField field="iscaseduplicationenabled" value="v.entity.iscaseduplicationenabled" id="iscaseduplicationenabled" />
                    <UIInputField field="isdelaydeleteofcaseenabled" value="v.entity.isdelaydeleteofcaseenabled" id="isdelaydeleteofcaseenabled" />
                    <UIInputField field="isdeleteigowithcaseenabled" value="v.entity.isdeleteigowithcaseenabled" id="isdeleteigowithcaseenabled" /> 
                    <UIInputField field="isprotectcaseinsuredsenabled" value="v.entity.isprotectcaseinsuredsenabled" id="isprotectcaseinsuredsenabled" />
                    <UIInputField field="isprotectcaseparticipantsenabled" value="v.entity.isprotectcaseparticipantsenabled" id="isprotectcaseparticipantsenabled" />
                    <UIInputField field="isprotectcaseprimaryinsuredenabled" value="v.entity.isprotectcaseprimaryinsuredenabled" id="isprotectcaseprimaryinsuredenabled" />                                  
                </UIColumn>
            </UISection>
        </Body>

        <Footer >
            <UIButton label="Cancel" id="btnCancel" class="slds-button slds-button--neutral" press="c.cancel" />
            <UIButton label="Save" id="btnSave" class="slds-button slds-button--brand" press="c.save" />
        </Footer>
    </Layout>
    <Layout mode="View" entityName="Setting.iGOSettings" label="iGO Functional Settings">
        <!-- Page Header -->
        <Header>
            <UIButton label="Edit" id="btnEdit" class="slds-button slds-button--neutral" press="c.edit" action="RecordEdit"/>
        </Header>
        <!-- Page Body -->
        <Body>
            <!-- Page Section, Leave cols attribute empty -->
            <UISection cols="" label="Information">
                <UIColumn cols="">                 
                    <UIOutputField field="batchsizeforcases" value="v.entity.batchsizeforcases" id="batchsizeforcases" />
                    <UIOutputField field="restrictresendemaildomain" value="v.entity.restrictresendemaildomain" id="restrictresendemaildomain" />
                    <UIOutputField field="isonbehalfofenabled" value="v.entity.isonbehalfofenabled" id="isonbehalfofenabled" />
                    <UIOutputField field="isactionablealertsenabled" value="v.entity.isactionablealertsenabled" id="isactionablealertsenabled" />
                    <UIOutputField field="isesignenabled" value="v.entity.isesignenabled" id="isesignenabled" />
                    <UIOutputField field="isstarteappfromillenabled" value="v.entity.isstarteappfromillenabled" id="isstarteappfromillenabled" />
                    <UIOutputField field="isrerunillenabled" value="v.entity.isrerunillenabled" id="isrerunillenabled" />                    
                </UIColumn>
                <UIColumn cols="">  
                    <UIOutputField field="isresendesignenabled" value="v.entity.isresendesignenabled" id="isresendesignenabled" />
                    <UIOutputField field="iseditemailbeforeresendenabled" value="v.entity.iseditemailbeforeresendenabled" id="iseditemailbeforeresendenabled" /> 
                    <UIOutputField field="iscaseduplicationenabled" value="v.entity.iscaseduplicationenabled" id="iscaseduplicationenabled" />
                    <UIOutputField field="isdelaydeleteofcaseenabled" value="v.entity.isdelaydeleteofcaseenabled" id="isdelaydeleteofcaseenabled" />
                    <UIOutputField field="isdeleteigowithcaseenabled" value="v.entity.isdeleteigowithcaseenabled" id="isdeleteigowithcaseenabled" /> 
                    <UIOutputField field="isprotectcaseinsuredsenabled" value="v.entity.isprotectcaseinsuredsenabled" id="isprotectcaseinsuredsenabled" />
                    <UIOutputField field="isprotectcaseparticipantsenabled" value="v.entity.isprotectcaseparticipantsenabled" id="isprotectcaseparticipantsenabled" />
                    <UIOutputField field="isprotectcaseprimaryinsuredenabled" value="v.entity.isprotectcaseprimaryinsuredenabled" id="isprotectcaseprimaryinsuredenabled" />
                </UIColumn>
            </UISection>
        </Body>
        <Footer />
    </Layout>
    <Layout mode="List">
            <Header>

        </Header>
        <!-- Page Body -->
        <Body>

        </Body>
        <Footer />
    </Layout>
</Pagelayouts>
