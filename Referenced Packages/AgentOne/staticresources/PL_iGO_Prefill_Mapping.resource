<!-- Page Layout Template -->
<Pagelayouts entityName="Setting.iGOPrefill">
    <Layout mode="Edit" entityName="Setting.iGOPrefill">
        <!-- Page Header -->
        <Header />
        <!-- Page Body -->
        <Body id="body">
            <!-- Page Section, Leave cols attribute empty -->
            <UISection cols="" label="Information">
                <UIColumn cols="">

                    <UIInputField field="name" value="v.entity.name" required="true" id="name" blur="c.handleFieldBlur">
                        <ValidationRules>
                            <Rule name="range" minValue="" maxValue="" message=""/>
                        </ValidationRules>
                    </UIInputField>
                     <UIInputField field="entityType" value="v.entity.entitytype" id="entityType"
                        change="c.handlePrefillEntityEntryChange"/>
                
                    <UIInputField field="fromEntityName" value="v.entity.fromentityname" id="fromEntityName"
                        change="c.handlePrefillFromEntityNameChange" />

                    <UIInputField field="selectfieldsfrom" value="v.entity.selectfieldsfrom" id="selectfieldsfrom" 
                        change="c.handlePrefillFormChange"/>
                        
                    <UIInputField field="recordtype" value="v.entity.recordtype" id="recordtype" 
                        change="c.handlePrefillFormChange" />


                    <UIInputField field="fromFieldName" value="v.entity.fromfieldname" id="fromFieldName"
                        required="true" />

                </UIColumn>

                <UIColumn cols="">
                    <UIInputField field="toSectionName" value="v.entity.tosectionname" id="toSectionName"
                        change="c.handleFieldChange"/>
                    <UIInputField field="toFieldName" value="v.entity.tofieldname" id="toFieldName" required="true" />
                    <UIInputField field="transformAction" value="v.entity.transformaction" id="transformAction"
                        change="c.handlePrefillTransformActionFieldChange" />

                    <UIInputField field="transformArgs" value="v.entity.transformargs" id="transformArgs"
                        change="c.handleFieldChange" />

                    <UIInputField field="isDisabled" value="v.entity.isdisabled" id="isDisabled" />


                </UIColumn>
            </UISection>
        </Body>

        <Footer >
            <UIButton label="Cancel" id="btnCancel" class="slds-button slds-button--neutral" press="c.cancel" />
            <UIButton label="Save" id="btnSave" class="slds-button slds-button--brand" press="c.save" />
        </Footer>
    </Layout>
    <Layout mode="View" entityName="Setting.iGOPrefill">
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
                    <UIOutputField field="isDefault" value="v.entity.isdefault" id="isDefault" />
                    <UIOutputField field="name" value="v.entity.name" required="true" id="name" />
                    <UIOutputField field="fromEntityName" value="v.entity.fromentityname" id="fromEntityName" />
                    <UIOutputField field="selectfieldsfrom" value="v.entity.selectfieldsfrom" id="selectfieldsfrom" />
                    <UIOutputField field="recordtype" value="v.entity.recordtype" id="recordtype" />
                    <UIOutputField field="fromFieldName" value="v.entity.fromfieldname" id="fromFieldName" />
                    <UIOutputField field="transformAction" value="v.entity.transformaction" id="transformAction" />
                </UIColumn>
                <UIColumn cols="">
                    <UIOutputField field="isDisabled" value="v.entity.isdisabled" id="isDisabled" />
                    <UIOutputField field="entityType" value="v.entity.entitytype" id="entityType"/>
                    <UIOutputField field="toSectionName" value="v.entity.tosectionname" id="toSectionName" />
                    <UIOutputField field="toFieldName" value="v.entity.tofieldname" id="toFieldName" />
                    <UIOutputField field="transformArgs" value="v.entity.transformargs" id="transformArgs" />
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