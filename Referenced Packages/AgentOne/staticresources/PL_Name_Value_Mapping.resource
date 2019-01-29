<!-- Page Layout Template -->
<Pagelayouts entityName="Setting.NameValueMapping">
    <Layout mode="Edit" entityName="Setting.NameValueMapping">
        <!-- Page Header -->
        <Header />
        <!-- Page Body -->
        <Body id="body">
            <!-- Page Section, Leave cols attribute empty -->
            <UISection cols="" label="Information">
                <UIColumn cols="">
                    <!-- <UIInputField field="name" value="v.entity.name" required="true" id="name" /> -->
                    <UIInputField field="targetapp" value="v.entity.targetapp" id="targetapp"  required="true"/>
                    <UIInputField field="value" value="v.entity.value" id="value"  required="true" />
                </UIColumn>

                <UIColumn cols="">
                    <!-- <UIInputField field="key" value="v.entity.key" id="key"  /> -->
                    <UIInputField field="fieldname" value="v.entity.fieldname" id="fieldname" required="true"/>
                    <UIInputField field="targetvalue" value="v.entity.targetvalue" id="targetvalue" required="true" />
                    <UIInputField field="isdisabled" value="v.entity.isdisabled" id="isdisabled"  />
                </UIColumn>
            </UISection>
        </Body>

        <Footer >
            <UIButton label="Cancel" id="btnCancel" class="slds-button slds-button--neutral" press="c.cancel" />
            <UIButton label="Save" id="btnSave" class="slds-button slds-button--brand" press="c.save" />
        </Footer>
    </Layout>
    <Layout mode="View" entityName="Setting.NameValueMapping">
        <!-- Page Header -->
        <Header>
            <UIButton label="Clone" id="btnClone" class="slds-button slds-button--neutral" press="c.edit" action="RecordClone"/>
            <UIButton label="Edit" id="btnEdit" class="slds-button slds-button--neutral" press="c.edit" action="RecordEdit"/>
            <UIButton label="Delete" id="btnDel" class="slds-button slds-button--neutral" press="c.del" action="RecordDelete"/>
        </Header>
        <!-- Page Body -->
        <Body>
            <!-- Page Section, Leave cols attribute empty -->
            <UISection cols="" label="Information">
                <UIColumn cols="">
                    <UIOutputField field="isdefault" value="v.entity.isdefault" id="isdefault" />
                    <UIOutputField field="name" value="v.entity.name" required="true" id="name" />
                    <UIOutputField field="targetapp" value="v.entity.targetapp" id="targetapp"  />
                    <UIOutputField field="value" value="v.entity.value" id="value"  />
                </UIColumn>

                <UIColumn cols="">
                    <UIOutputField field="isdisabled" value="v.entity.isdisabled" id="isdisabled" />
                    <!-- <UIOutputField field="key" value="v.entity.key" id="key" /> -->
                    <UIOutputField field="fieldname" value="v.entity.fieldname" id="fieldname" />
                    <UIOutputField field="targetvalue" value="v.entity.targetvalue" id="targetvalue"  />
                </UIColumn>
            </UISection>
        </Body>
        <Footer />
    </Layout>
    <Layout mode="List">
        <Header>
            <UIButton label="New" id="btnNew" class="slds-button slds-button--neutral" press="c.createEntity" action="RecordCreate"/>
            <UIButton label="Import" id="btnImport" class="slds-button slds-button--neutral" press="c.import" action="RecordImport" />
            <UIButton label="Export" id="btnExport" class="slds-button slds-button--neutral" press="c.export" action="RecordExport" />
        </Header>
        <Body>
            <UISection cols="1">
                <UIColumn cols="1">
                    <UIList checkbox="True" mode="Full" id="gridView" entitySchema="v.entitySchema" currentViewName="v.currentViewName">
                    </UIList>
                </UIColumn>
            </UISection>
        </Body>
        <Footer />
    </Layout>
</Pagelayouts>
