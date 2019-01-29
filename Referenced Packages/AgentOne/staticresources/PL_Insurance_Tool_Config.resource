<!-- Page Layout Template -->
<Pagelayouts entityName="Setting.InsuranceToolCfg">
    <Layout mode="Edit" entityName="Setting.InsuranceToolCfg">
        <!-- Page Header -->
        <Header />
        <!-- Page Body -->
        <Body id="body">
            <!-- Page Section, Leave cols attribute empty -->
            <UISection cols="" label="Information">
                <UIColumn cols="">

                    <UIInputField field="name" value="v.entity.name" required="true" id="name"></UIInputField>
                    <UIInputField field="toolname" value="v.entity.toolname" id="toolname" required="true" change="c.handleFieldChange"/>
                    <UIInputField field="phase" value="v.entity.phase" id="enabled"  required="true" change="c.handleFieldChange"/>
                    <UIInputField field="lineofbusiness" value="v.entity.lineofbusiness" id="lineofbusiness" required="true" />
                    <UIInputField field="producttype" value="v.entity.producttype" id="producttype" />

                </UIColumn>

            </UISection>
        </Body>

        <Footer >
            <UIButton label="Cancel" id="btnCancel" class="slds-button slds-button--neutral" press="c.cancel" />
            <UIButton label="Save" id="btnSave" class="slds-button slds-button--brand" press="c.save" />
        </Footer>
    </Layout>
    <Layout mode="View" entityName="Setting.InsuranceToolCfg">
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
                    <UIOutputField field="toolname" value="v.entity.toolname" id="toolname" />
                    <UIOutputField field="phase" value="v.entity.phase" id="enabled" />
                    <UIOutputField field="lineofbusiness" value="v.entity.lineofbusiness" id="lineofbusiness" />
                    <UIOutputField field="producttype" value="v.entity.producttype" id="producttype" />
                </UIColumn>
            </UISection>
        </Body>
        <Footer />
    </Layout>
    <Layout mode="List">
        <Header>
            <UIButton label="New" id="btnNew" class="slds-button slds-button--neutral" press="c.createEntity" action="RecordCreate"/>
            <UIButton label="Import" id="btnImport" class="slds-button slds-button--neutral" press="c.import" action="RecordImport"/>
            <UIButton label="Export" id="btnExport" class="slds-button slds-button--neutral" press="c.export" action="RecordExport"/>
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