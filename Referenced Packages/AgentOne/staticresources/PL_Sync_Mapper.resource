<!-- Page Layout Template -->
<Pagelayouts entityName="Setting.SyncMapper">
    <Layout mode="Edit" entityName="Setting.SyncMapper">
        <!-- Page Header -->
        <Header />
        <!-- Page Body -->
        <Body id="body">
            <!-- Page Section, Leave cols attribute empty -->
            <UISection cols="" label="Information">
                <UIColumn cols="">
                    <UIInputField field="label" value="v.entity.label" required="true" id="label" />
                    <UIInputField field="entityname" value="v.entity.entityname" id="entityname" change="c.handleFieldChange" />
                    <UIInputField field="inputfields" value="v.entity.inputfields" id="inputfields" label="Input Fields" />
                    <UIInputField field="output" value="v.entity.output" id="output" label="Output Field" />
                    <UIInputField field="transformaction" value="v.entity.transformaction" id="transformaction"  />
                    <UIInputField field="sourceid" value="v.entity.sourceid" id="sourceid" />
                    <UIInputField field="enabled" value="v.entity.enabled" id="enabled" />
                    <UIInputField field="matchall" value="v.entity.matchall" id="matchall" />
                </UIColumn>

            </UISection>
        </Body>

        <Footer >
            <UIButton label="Cancel" id="btnCancel" class="slds-button slds-button--neutral" press="c.cancel" />
            <UIButton label="Save" id="btnSave" class="slds-button slds-button--brand" press="c.save" />
        </Footer>
    </Layout>
    <Layout mode="View" entityName="Setting.SyncMapper">
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

                    <UIOutputField field="label" value="v.entity.label" id="label" />                    
                    <UIOutputField field="output" value="v.entity.output" id="output" label="Output Field" />
                    <UIOutputField field="outputf" value="v.entity.outputf" id="outputf" label="Output Field (User-Friendly)" />
                    <UIOutputField field="entityname" value="v.entity.entityname" id="entityname" />
                    <UIOutputField field="sourceid" value="v.entity.sourceid" id="sourceid" />
                    <UIOutputField field="transformaction" value="v.entity.transformaction" id="transformaction"  />
                    <UIOutputField field="inputfields" value="v.entity.inputfields" id="inputfields" label="Input Fields" />
                    <UIOutputField field="inputf" value="v.entity.inputf" id="inputf" label="Input Fields (User-Friendly)" />
                    <UIOutputField field="enabled" value="v.entity.enabled" id="enabled" />

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
