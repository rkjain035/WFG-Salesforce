<!-- Page Layout Template -->
<Pagelayouts entityName="Setting.ApplicationCfg">
    <Layout mode="Edit" entityName="Setting.ApplicationCfg">
        <!-- Page Header -->
        <Header />
        <!-- Page Body -->
        <Body id="body">
            <!-- Page Section, Leave cols attribute empty -->
            <UISection cols="" label="Information">
                <UIColumn cols="">
                    <UIInputField field="name" value="v.entity.name" required="true" id="name"/>
                    <UIInputField field="key" value="v.entity.key" id="key" required="true" />
                    <UIInputField field="category" value="v.entity.category" id="category" />
                    <UIInputField field="value" value="v.entity.value" id="value" required="true" change="c.handleFieldChange" />
                </UIColumn>
            </UISection>
        </Body>

        <Footer >
            <UIButton label="Cancel" id="btnCancel" class="slds-button slds-button--neutral" press="c.cancel" />
            <UIButton label="Save" id="btnSave" class="slds-button slds-button--brand" press="c.save" />
        </Footer>
    </Layout>
    <Layout mode="View" entityName="Setting.ApplicationCfg">
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
                    <UIOutputField field="name" value="v.entity.name" id="name" />
                    <UIOutputField field="key" value="v.entity.key" id="key" />
                    <UIOutputField field="category" value="v.entity.category" id="category" />
                    <UIOutputField field="value" value="v.entity.value" id="value" />
                    <UIOutputField field="isdefault" value="v.entity.isdefault" id="isdefault" />
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