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
                    <UIInputField field="action" value="v.entity.action" id="action" />
                    <UIInputField field="applicationtool" value="v.entity.applicationtool" id="applicationtool" change="c.handleFieldChange"/>
                    <UIInputField field="channelname" value="v.entity.channelname" id="channelname" />
                    <UIInputField field="organizationidentifier" value="v.entity.organizationidentifier" id="organizationidentifier" />
                    <UIInputField field="companyidentifier" value="v.entity.companyidentifier" id="companyidentifier" />
                    <UIInputField field="subcompanyidentifier" value="v.entity.subcompanyidentifier" id="subcompanyidentifier" />
                 </UIColumn>

                <UIColumn cols="">
                    <UIInputField field="groups" value="v.entity.groups" id="groups" />
                    <UIInputField field="redirecturl" value="v.entity.redirecturl" id="redirecturl" />
                    <UIInputField field="webserviceendpoint" value="v.entity.webserviceendpoint" id="webserviceendpoint" />
                    <UIInputField field="webservicetoken" value="v.entity.webservicetoken" id="webservicetoken" />
                    <UIInputField field="isentitysyncenabled" value="v.entity.isentitysyncenabled" id="isentitysyncenabled" />
                 </UIColumn>
            </UISection>
        </Body>

        <Footer >
            <UIButton label="Cancel" id="btnCancel" class="slds-button slds-button--neutral" press="c.cancel" />
            <UIButton label="Save" id="btnSave" class="slds-button slds-button--brand" press="c.save" />
        </Footer>
    </Layout>
    <Layout mode="View" entityName="Setting.iGOSettings" label="iGO Server Settings">
        <!-- Page Header -->
        <Header>
            <UIButton label="Edit" id="btnEdit" class="slds-button slds-button--neutral" press="c.edit" action="RecordEdit"/>
        </Header>
        <!-- Page Body -->
        <Body>
            <!-- Page Section, Leave cols attribute empty -->
            <UISection cols="" label="Information">
                <UIColumn cols="">
                    <UIOutputField field="action" value="v.entity.action" id="action" />
                    <UIOutputField field="applicationtool" value="v.entity.applicationtool" id="applicationtool" />
                    <UIOutputField field="channelname" value="v.entity.channelname" id="channelname" />
                    <UIOutputField field="organizationidentifier" value="v.entity.organizationidentifier" id="organizationidentifier" />
                    <UIOutputField field="companyidentifier" value="v.entity.companyidentifier" id="companyidentifier" />
                    <UIOutputField field="subcompanyidentifier" value="v.entity.subcompanyidentifier" id="subcompanyidentifier" />
                  </UIColumn>
                <UIColumn cols="">
                    <UIOutputField field="groups" value="v.entity.groups" id="groups" />
                    <UIOutputField field="redirecturl" value="v.entity.redirecturl" id="redirecturl" />
                    <UIOutputField field="webserviceendpoint" value="v.entity.webserviceendpoint" id="webserviceendpoint" />
                    <UIOutputField field="webservicetoken" value="v.entity.webservicetoken" id="webservicetoken" />
                    <UIOutputField field="isentitysyncenabled" value="v.entity.isentitysyncenabled" id="isentitysyncenabled" />
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
