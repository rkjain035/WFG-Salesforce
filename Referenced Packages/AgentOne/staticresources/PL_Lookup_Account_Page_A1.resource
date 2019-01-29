<!-- Page Layout Template -->
<Pagelayouts entityName="Lookup.Account">
    <Layout mode="Edit" entityName="Lookup.Account">
        <!-- Page Header -->
        <Header />
        <!-- Page Body -->
        <Body id="body">
            <!-- Page Section, Leave cols attribute empty -->
            <UISection cols="" label="Information">
                <UIColumn cols="">

                    <UIInputField field="salutation" value="v.entity.salutation" id="salutation" change="c.handleFieldChange"/>
                    <UIInputField field="firstname" value="v.entity.firstname" id="firstname" required="true"/>
                    <UIInputField field="lastname" value="v.entity.lastname" id="lastname" required="true" />

                </UIColumn>

                <UIColumn cols="">
                    <UIInputField field="personmobilephone" value="v.entity.personmobilephone" id="personmobilephone" label="Mobile Phone"/>
                    <UIInputField field="phone" value="v.entity.phone" id="phone" />
                    <UIInputField field="personemail" value="v.entity.personemail" id="personemail" />


                </UIColumn>
            </UISection>
        </Body>

        <Footer >
            <UIButton label="Cancel" id="btnCancel" class="slds-button slds-button--neutral" press="c.cancel" />
            <UIButton label="Save" id="btnSave" class="slds-button slds-button--brand" press="c.save" />
        </Footer>
    </Layout>
    <Layout mode="View" entityName="Lookup.Account">
        <!-- Page Header -->
        <Header>
            <UIButton label="Edit" id="btnEdit" class="slds-button slds-button--neutral" press="c.edit" action="RecordEdit"/>
            <UIButton label="Delete" id="btnDel" class="slds-button slds-button--neutral" press="c.del" action="RecordDelete"/>
        </Header>
        <!-- Page Body -->
        <Body>
            <!-- Page Section, Leave cols attribute empty -->
            <UISection cols="" label="Information">
                  <UIColumn cols="">

                    <UIOutputField field="salutation" value="v.entity.salutation" id="salutation" />
                    <UIOutputField field="firstname" value="v.entity.firstname" id="firstname" required="true"/>
                    <UIOutputField field="lastname" value="v.entity.lastname" id="lastname" required="true" />

                </UIColumn>

                <UIColumn cols="">
                    <UIOutputField field="personmobilephone" value="v.entity.personmobilephone" id="personmobilephone" label="Mobile Phone"/>
                    <UIOutputField field="phone" value="v.entity.phone" id="phone" />
                    <UIOutputField field="personemail" value="v.entity.personemail" id="personemail" />


                </UIColumn>
            </UISection>
        </Body>
        <Footer />
    </Layout>
    <Layout mode="List">
        <Header />
        <Body>
            <UISection cols="1">
                <UIColumn cols="1">
                    <UIList checkbox="True" mode="Full" id="gridView" entitySchema="v.entitySchema" currentViewName="v.currentViewName">
                    </UIList>
                </UIColumn>
            </UISection>
        </Body>
          <Footer >
            <UIButton label="Cancel" id="btnCancel" class="slds-button slds-button--neutral" press="c.cancel" />
            <UIButton label="Save" id="btnSave" class="slds-button slds-button--brand" press="c.save" />
        </Footer>
    </Layout>
</Pagelayouts>
