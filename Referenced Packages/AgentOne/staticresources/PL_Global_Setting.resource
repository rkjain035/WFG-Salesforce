<!-- Page Layout Template -->
<Pagelayouts entityName="Setting.GlobalSetting">
    <Layout mode="Edit" entityName="Setting.GlobalSetting">
        <!-- Page Header -->
        <Header />
        <!-- Page Body -->
        <Body id="body">
            <!-- Page Section, Leave cols attribute empty -->
            <UISection cols="" label="Information">
                 <UIColumn cols="">

                    <UIInputField field="namespace" value="v.entity.namespace" id="namespace" />
                    <UIInputField field="idp" value="v.entity.idp" id="idp"/>
                    <UIInputField field="pendingcasefk" value="v.entity.pendingcasefk" id="pendingcasefk" />
                    <UIInputField field="loglevel" value="v.entity.loglevel" id="loglevel" change="c.handleFieldChange"/>
                    <UIInputField field="numdaysbeforebdaynotification" value="v.entity.numdaysbeforebdaynotification" id="numdaysbeforebdaynotification" />
                    <UIInputField field="numdaysbeforeplacementend" value="v.entity.numdaysbeforeplacementend" id="numdaysbeforeplacementend" />
                    <UIInputField field="numdaystodeactivatecase" value="v.entity.numdaystodeactivatecase" id="numdaystodeactivatecase" />

                </UIColumn>
                 <UIColumn cols="">

                    <UIInputField field="isglobaltriggersenabled" value="v.entity.isglobaltriggersenabled" id="isglobaltriggersenabled" />
                    <UIInputField field="iscaseheaderdisplayed" value="v.entity.iscaseheaderdisplayed" id="iscaseheaderdisplayed" click="c.handleCheckboxDependency"/>
                    <UIInputField field="iscasephaseheaderdisplayed" value="v.entity.iscasephaseheaderdisplayed" id="iscasephaseheaderdisplayed"/>
                    <!-- <UIInputField field="issharingenabled" value="v.entity.issharingenabled" id="issharingenabled" /> -->
                    <UIInputField field="chattercreatealerts" value="v.entity.chattercreatealerts" id="chattercreatealerts" />
                    <UIInputField field="chatteratmentions" value="v.entity.chatteratmentions" id="chatteratmentions" />
                    <UIInputField field="isillustrationdisabled" value="v.entity.isillustrationdisabled" id="isillustrationdisabled" />
                    <UIInputField field="isneedsdisabled" value="v.entity.isneedsdisabled" id="isneedsdisabled" />
                    <UIInputField field="isphsdisabled" value="v.entity.isphsdisabled" id="isphsdisabled" />
                    <UIInputField field="bypasspcidvalidationforpi" value="v.entity.bypasspcidvalidationforpi" id="bypasspcidvalidationforpi" />
                    <UIInputField field="allowpcupdateplacedcs" value="v.entity.allowpcupdateplacedcs" id="allowpcupdateplacedcs" />
                </UIColumn>

            </UISection>
        </Body>

        <Footer >
            <UIButton label="Cancel" id="btnCancel" class="slds-button slds-button--neutral" press="c.cancel" />
            <UIButton label="Save" id="btnSave" class="slds-button slds-button--brand" press="c.save" />
        </Footer>
    </Layout>
    <Layout mode="View" entityName="Setting.EntityFieldList">
        <!-- Page Header -->
        <Header>
            <UIButton label="Edit" id="btnEdit" class="slds-button slds-button--neutral" press="c.edit" action="RecordEdit"/>
        </Header>
        <!-- Page Body -->
        <Body>
            <!-- Page Section, Leave cols attribute empty -->
            <UISection cols="" label="Information">
                <UIColumn cols="">

                    <UIOutputField field="namespace" value="v.entity.namespace" id="namespace" />
                    <UIOutputField field="idp" value="v.entity.idp" id="idp"/>
                    <UIOutputField field="pendingcasefk" value="v.entity.pendingcasefk" id="pendingcasefk" />
                    <UIOutputField field="loglevel" value="v.entity.loglevel" id="loglevel" />
                    <UIOutputField field="numdaysbeforebdaynotification" value="v.entity.numdaysbeforebdaynotification" id="numdaysbeforebdaynotification" />
                    <UIOutputField field="numdaysbeforeplacementend" value="v.entity.numdaysbeforeplacementend" id="numdaysbeforeplacementend" />
                    <UIOutputField field="numdaystodeactivatecase" value="v.entity.numdaystodeactivatecase" id="numdaystodeactivatecase" />
                   
                </UIColumn>
                 <UIColumn cols="">

                    <UIOutputField field="isglobaltriggersenabled" value="v.entity.isglobaltriggersenabled" id="isglobaltriggersenabled" />
                    <UIOutputField field="iscaseheaderdisplayed" value="v.entity.iscaseheaderdisplayed" id="iscaseheaderdisplayed"/>
                    <UIOutputField field="iscasephaseheaderdisplayed" value="v.entity.iscasephaseheaderdisplayed" id="iscasephaseheaderdisplayed"/>
                    <!-- <UIOutputField field="issharingenabled" value="v.entity.issharingenabled" id="issharingenabled" /> -->
                    <UIOutputField field="chattercreatealerts" value="v.entity.chattercreatealerts" id="chattercreatealerts" />
                    <UIOutputField field="chatteratmentions" value="v.entity.chatteratmentions" id="chatteratmentions" />
                    <UIOutputField field="isillustrationdisabled" value="v.entity.isillustrationdisabled" id="isillustrationdisabled" />
                    <UIOutputField field="isneedsdisabled" value="v.entity.isneedsdisabled" id="isneedsdisabled" />
                    <UIOutputField field="isphsdisabled" value="v.entity.isphsdisabled" id="isphsdisabled" />
                    <UIOutputField field="bypasspcidvalidationforpi" value="v.entity.bypasspcidvalidationforpi" id="bypasspcidvalidationforpi" />
                    <UIOutputField field="allowpcupdateplacedcs" value="v.entity.allowpcupdateplacedcs" id="allowpcupdateplacedcs" />
                </UIColumn>

            </UISection>
        </Body>
        <Footer />
    </Layout>
    <Layout mode="List">
        <Header>
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
