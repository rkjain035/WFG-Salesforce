<!-- Page Layout Template -->
<Pagelayouts entityName="Setting.InsuranceToolReg">
    <Layout mode="Edit" entityName="Setting.InsuranceToolReg">
        <!-- Page Header -->
        <Header />
        <!-- Page Body -->
        <Body id="body">
            <!-- Page Section, Leave cols attribute empty -->
            <UISection cols="" label="Information">
                <UIColumn cols="">
                    <UIInputField field="name" value="v.entity.name" id="name" required="true" />
                    <UIInputField field="adapterclassname" value="v.entity.adapterclassname" id="adapterclassname" />
                    <UIInputField field="adapternamespace" value="v.entity.adapternamespace" id="adapternamespace" />
                    <UIInputField field="displayname" value="v.entity.displayname" id="displayname"  />
                    <UIInputField field="minos" value="v.entity.minos" id="minos" />
                    <UIInputField field="minres" value="v.entity.minres" id="minres" />
                    <UIInputField field="url" value="v.entity.url" id="url" required="true" />
                </UIColumn >
                <UIColumn cols="">
                    <UIInputField field="width" value="v.entity.width" id="width" />
                    <UIInputField field="height" value="v.entity.height" id="height" />
                    <UIInputField field="permissionname" value="v.entity.permissionname" id="permissionname" />
                    <UIInputField field="order" value="v.entity.order" id="order" />
                    <UIInputField field="isactive" value="v.entity.isactive" id="isactive" />
                    <UIInputField field="ishosted" value="v.entity.ishosted" id="ishosted" />
                    <UIInputField field="isnewwindow" value="v.entity.isnewwindow" id="isnewwindow" />
                </UIColumn>
            </UISection>
        </Body>

        <Footer >
            <UIButton label="Cancel" id="btnCancel" class="slds-button slds-button--neutral" press="c.cancel" />
            <UIButton label="Save" id="btnSave" class="slds-button slds-button--brand" press="c.save" />
        </Footer>
    </Layout>
    <Layout mode="View" entityName="Setting.InsuranceToolReg">
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
                    <UIOutputField field="adapterclassname" value="v.entity.adapterclassname" id="adapterclassname" />
                    <UIOutputField field="adapternamespace" value="v.entity.adapternamespace" id="adapternamespace" />
                    <UIOutputField field="displayname" value="v.entity.displayname" id="displayname"  />
                    <UIOutputField field="minos" value="v.entity.minos" id="minos" />
                    <UIOutputField field="minres" value="v.entity.minres" id="minres" />
                    <UIOutputField field="url" value="v.entity.url" id="url" />
                </UIColumn>
                <UIColumn cols="">
                    <UIOutputField field="width" value="v.entity.width" id="width" />
                    <UIOutputField field="height" value="v.entity.height" id="height" />
                    <UIOutputField field="permissionname" value="v.entity.permissionname" id="permissionname" />
                    <UIOutputField field="order" value="v.entity.order" id="order" />
                    <UIOutputField field="isactive" value="v.entity.isactive" id="isactive" />
                    <UIOutputField field="ishosted" value="v.entity.ishosted" id="ishosted" />
                    <UIOutputField field="isnewwindow" value="v.entity.isnewwindow" id="isnewwindow" />
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
