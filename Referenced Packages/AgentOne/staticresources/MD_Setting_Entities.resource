<!-- Setting Entity Metadata Definitions -->
<SettingEntities>
    <SettingEntity name="Setting.iGOPrefill" ref="iGO_Field_Mapping__c" customSort="true">
        <Fields>
            <Field name="name" ref="Name" />
            <Field name="entityType" label="Entity Entry" ref="Entity_Entry__c" displayType="Picklist" required="true">
                <!-- Required and possible values include: 'illustrationentry' and 'insurancecaseentry' (no blank value) -->
                <!-- should programmatically include or omit the namespace dependent on if it is managed or unmanaged -->
                <Picklist>
                    <Option value="{!NS}insurancecaseentry" name="insurancecaseentry" />
                    <Option value="{!NS}illustrationentry" name="illustrationentry" />
                    <Option value="{!NS}inforcepolicyentry" name="inforcepolicyentry" />
                </Picklist>
            </Field>
            <Field name="fromEntityName" label="" ref="From_Entity_Name__c" displayType="Picklist">
                <!-- Required and possible values include: '.', 'owner', 'primaryinsured', and 'text' (no blank value) -->
                <Picklist>
                    <Option value="." name="-- Current Entity --" parent="{!NS}insurancecaseentry|{!NS}illustrationentry|{!NS}inforcepolicyentry"/>
                    <Option value="agents" name="Agent" parent="{!NS}insurancecaseentry"/>
                    <Option value="coverages" name="Coverage" parent="{!NS}insurancecaseentry"/>
                    <Option value="insureds" name="Insured" parent="{!NS}insurancecaseentry"/>    
                    <Option value="insureds.factfinder" name="Fact Finder" parent="version1"/>                   
                    <Option value="owner" name="Owner" />
                    <Option value="loginuser" name="Login User" />
                    <Option value="insurancecase" name="Insurance Case" parent="{!NS}illustrationentry"/>
                    <Option value="parties" name="Party" parent="{!NS}insurancecaseentry"/>   
                    <Option value="primaryinsured" name="Primary Insured" parent="{!NS}insurancecaseentry|{!NS}illustrationentry"/>
                    <Option value="primaryinsured.factfinder" name="Fact Finder" parent="version1"/>
                    <Option value="primaryinsured.relationship[spouse]" name="Relationship Spouse" parent="{!NS}insurancecaseentry|{!NS}illustrationentry"/>
                    <Option value="primaryinsured.relationship[child]" name="Relationship Child" parent="{!NS}insurancecaseentry|{!NS}illustrationentry"/>
                    <Option value="policyowner" name="Policy Owner" parent="{!NS}inforcepolicyentry"/>
                    <Option value="policyowner.factfinder" name="Policy Owner Fact Finder" parent="version1"/>
                    <Option value="insured" name="Insureds" parent="{!NS}inforcepolicyentry"/>
                    <Option value="primarybeneficiary" name="Primary Beneficiary" parent="{!NS}inforcepolicyentry"/>
                    <Option value="contingentbeneficiary" name="Contingent Beneficiary" parent="{!NS}inforcepolicyentry"/>
                    <Option value="text" name="Text" />
                </Picklist>
            </Field>

            <Field name="selectfieldsfrom" label="Select Fields From" displayType="Picklist" dynamic="true" description="Entity to select Fields From" >
                <Picklist>
                    <Option value="." name="-- Current Entity --"/>                    
                    <Option value="account" name="Account" />
                    <Option value="contact" name="Contact" parent="insureds|parties" />
                    <Option value="factfinder" name="Fact Finder" parent="insureds|primaryinsured"/>
                </Picklist>
            </Field>

            <Field name="recordtype" label="Type" displayType="Picklist" dynamic="true" description="Type">
                <Picklist>
                    <Option value="account" name="Account" />
                    <Option value="contact" name="Contact" />
                </Picklist>
            </Field>

            <Field name="fromFieldName" label="" ref="From_Field_Name__c" displayType="Reference"
                lookupObject="{!NS}Entity_Field_List__c" lookupTextField="field_name__c" dynamic="true" >

                <!-- Required and checks the EFL for existence of the field, -->
                <!-- if not found disallows saving until the EFL record is created -->
                <!-- (unless "text" is entered in From Entity Name, in which case any text can be entered) -->
                <!-- on save removes spacing, punctuation and converts to lower case -->
            </Field>

            <Field name="toSectionName" label="To Section Name" ref="To_Section_Name__c" displayType="Picklist">
                <!-- Required and possible values include: 'ClientData' and 'UserData' (no blank value) -->
                <Picklist>
                    <Option value="ClientData" name="ClientData" />
                    <Option value="UserData" name="UserData" />
                </Picklist>
            </Field>

            <Field name="toFieldName" label="To Field Name" ref="To_Field_Name__c" />
            <Field name="transformAction" label="Transform Action" ref="Transform_Action__c" displayType="Picklist">
                <!-- Possible values include: <blank>, 'ConvertDate', 'ConvertDateTime', 'ConvertPhone', 'ConvertPicklist', 'CustomFunction', and 'IIF' -->
                <Picklist>
                    <Option value="" name="" />
                    <Option value="ConvertDate" name="Convert Date" />
                    <Option value="ConvertDateTime" name="Convert Date Time" />
                    <Option value="ConvertPhone" name="Convert Phone" />
                    <Option value="ConvertPicklistIIF" name="Convert Picklist IIF" />
                    <Option value="ConvertPicklist" name="Convert Picklist" />
                    <Option value="CustomFunction" name="Custom Function" />
                    <Option value="GetAppointmentCode" name="Get Appointment Code" />
                    <Option value="IIF" name="IIF" />
                    <Option value="TextBefore" name="Text Before String" />
                    <Option value="TextAfterLast" name="Text After Last String" />
                </Picklist>
            </Field>
            <Field name="transformArgs" label="Transform Arguments" ref="Transform_Args__c">
                <!-- (yyyy-MM-dd, yy/MM/dd, MM/dd/yy, MM/dd/yyyy, M/d/yyyy, M/d/yy, dd-MMM-yy) -->
                <!--  (dates from above followed by h:mm tt, hh:mm tt, H:mm, HH:mm) -->
                <!--  (<blank>, 'AreaCode', 'DialNumber', or 'Extension') -->
                <Picklist>
                    <Option value="M/d/yy" name="M/d/yy" parent="convertdate"/>
                    <Option value="M/d/yyyy" name="M/d/yyyy" parent="convertdate"/>
                    <Option value="MM/dd/yy" name="MM/dd/yy" parent="convertdate"/>
                    <Option value="MM/dd/yyyy" name="MM/dd/yyyy" parent="convertdate"/>
                    <Option value="dd-MMM-yy" name="dd-MMM-yy" parent="convertdate"/>
                    <Option value="yy/MM/dd" name="yy/MM/dd" parent="convertdate"/>
                    <Option value="yyyy-MM-dd" name="yyyy-MM-dd" parent="convertdate"/>

                    <Option value="M/d/yy h:mm tt" name="M/d/yy h:mm tt" parent="convertdatetime"/>
                    <Option value="M/d/yy hh:mm tt" name="M/d/yy hh:mm tt" parent="convertdatetime"/>
                    <Option value="M/d/yy H:mm" name="M/d/yy H:mm" parent="convertdatetime"/>
                    <Option value="M/d/yy HH:mm" name="M/d/yy HH:mm" parent="convertdatetime"/>
                    <Option value="M/d/yyyy h:mm tt" name="M/d/yyyy h:mm tt" parent="convertdatetime"/>
                    <Option value="M/d/yyyy hh:mm tt" name="M/d/yyyy hh:mm tt" parent="convertdatetime"/>
                    <Option value="M/d/yyyy H:mm" name="M/d/yyyy H:mm" parent="convertdatetime"/>
                    <Option value="M/d/yyyy HH:mm" name="M/d/yyyy HH:mm" parent="convertdatetime"/>
                    <Option value="MM/dd/yy h:mm tt" name="MM/dd/yy h:mm tt" parent="convertdatetime"/>
                    <Option value="MM/dd/yy hh:mm tt" name="MM/dd/yy hh:mm tt" parent="convertdatetime"/>
                    <Option value="MM/dd/yy H:mm" name="MM/dd/yy H:mm" parent="convertdatetime"/>
                    <Option value="MM/dd/yy HH:mm" name="MM/dd/yy HH:mm" parent="convertdatetime"/>
                    <Option value="MM/dd/yyyy h:mm tt" name="MM/dd/yyyy h:mm tt" parent="convertdatetime"/>
                    <Option value="MM/dd/yyyy hh:mm tt" name="MM/dd/yyyy hh:mm tt" parent="convertdatetime"/>
                    <Option value="MM/dd/yyyy H:mm" name="MM/dd/yyyy H:mm" parent="convertdatetime"/>
                    <Option value="MM/dd/yyyy HH:mm" name="MM/dd/yyyy HH:mm" parent="convertdatetime"/>
                    <Option value="dd-MMM-yy h:mm tt" name="dd-MMM-yy h:mm tt" parent="convertdatetime"/>
                    <Option value="dd-MMM-yy hh:mm tt" name="dd-MMM-yy hh:mm tt" parent="convertdatetime"/>
                    <Option value="dd-MMM-yy H:mm" name="dd-MMM-yy H:mm" parent="convertdatetime"/>
                    <Option value="dd-MMM-yy HH:mm" name="dd-MMM-yy HH:mm" parent="convertdatetime"/>
                    <Option value="yy/MM/dd h:mm tt" name="yy/MM/dd h:mm tt" parent="convertdatetime"/>
                    <Option value="yy/MM/dd hh:mm tt" name="yy/MM/dd hh:mm tt" parent="convertdatetime"/>
                    <Option value="yy/MM/dd H:mm" name="yy/MM/dd H:mm" parent="convertdatetime"/>
                    <Option value="yy/MM/dd HH:mm" name="yy/MM/dd HH:mm" parent="convertdatetime"/>
                    <Option value="yyyy-MM-dd h:mm tt" name="yyyy-MM-dd h:mm tt" parent="convertdatetime"/>
                    <Option value="yyyy-MM-dd hh:mm tt" name="yyyy-MM-dd hh:mm tt" parent="convertdatetime"/>
                    <Option value="yyyy-MM-dd H:mm" name="yyyy-MM-dd H:mm" parent="convertdatetime"/>
                    <Option value="yyyy-MM-dd HH:mm" name="yyyy-MM-dd HH:mm" parent="convertdatetime"/>

                    <Option value="" name="--blank--" parent="convertphone"/>
                    <Option value="AreaCode" name="AreaCode" parent="convertphone"/>
                    <Option value="DialNumber" name="DialNumber" parent="convertphone"/>
                    <Option value="Extension" name="Extension" parent="convertphone"/>
                </Picklist>
            </Field>
            <Field name="isDefault" label="Default Mapping" ref="Default_Mapping__c" required="true"/>
            <Field name="isDisabled" label="Disable Mapping" ref="Remove_Map__c" />
            <Field name="validaction" label="Valid Actions" ref="Valid_Actions__c" />
        </Fields>
        <SearchView id="searchView" name="searchView" label="List view for search result">
            <Columns>
                <Field name="name" />
                <Field name="entityType" />
                <Field name="fromEntityName" />
                <Field name="fromFieldName" />
                <Field name="toSectionName" />
                <Field name="toFieldName" />
                <Field name="transformAction" />
                <Field name="transformArgs" />
                <Field name="isDefault" />
                <Field name="isDisabled" />
            </Columns>
            <OrderBy>Name</OrderBy>
        </SearchView>
        <ListViews>
            <ListView id="" name="Insurance Case Entries" label="Insurance Case Entries" >
                <WhereCondition>Entity_Entry__c = '{!NS}insurancecaseentry'</WhereCondition>
                <Columns>
                    <Field name="name" />
                    <!-- <Field name="entityType" /> -->
                    <Field name="fromEntityName" />
                    <Field name="selectfieldsfrom" />
                    <Field name="fromFieldName" />
                    <!-- <Field name="toSectionName" /> -->
                    <Field name="toFieldName" />
                    <Field name="transformAction" />
                    <Field name="transformArgs" />
                    <Field name="isDefault" />
                    <Field name="isDisabled" />
                </Columns>
                <OrderBy>Name</OrderBy>
            </ListView>
            <ListView id="" name="Illustration Entries" label="Illustration Entries" >
                <WhereCondition>Entity_Entry__c = '{!NS}illustrationentry'</WhereCondition>
                <Columns>
                    <Field name="name" />
                    <!-- <Field name="entityType" /> -->
                    <Field name="fromEntityName" />
                    <Field name="selectfieldsfrom" />
                    <Field name="fromFieldName" />
                    <!-- <Field name="toSectionName" /> -->
                    <Field name="toFieldName" />
                    <Field name="transformAction" />
                    <Field name="transformArgs" />
                    <Field name="isDefault" />
                    <Field name="isDisabled" />
                </Columns>
                <OrderBy>Name</OrderBy>
            </ListView>
            <ListView id="" name="Policy Entries" label="Policy Entries" >
                <WhereCondition>Entity_Entry__c = '{!NS}inforcepolicyentry'</WhereCondition>
                <Columns>
                    <Field name="name" />
                    <!-- <Field name="entityType" /> -->
                    <Field name="fromEntityName" />
                    <!-- <Field name="selectfieldsfrom" /> -->
                    <Field name="recordtype" />
                    <Field name="fromFieldName" />
                    <!-- <Field name="toSectionName" /> -->
                    <Field name="toFieldName" />
                    <Field name="transformAction" />
                    <Field name="transformArgs" />
                    <Field name="isDefault" />
                    <Field name="isDisabled" />
                </Columns>
                <OrderBy>Name</OrderBy>
            </ListView>
            <ListView id="" name="All Entries" label="All Entries" >
                <WhereCondition>Entity_Entry__c = '{!NS}illustrationentry' OR Entity_Entry__c = '{!NS}insurancecaseentry' OR Entity_Entry__c = '{!NS}inforcepolicyentry'</WhereCondition>
                <Columns>
                    <Field name="name" />
                    <Field name="entityType" />
                    <Field name="fromEntityName" />
                    <Field name="selectfieldsfrom" />
                    <Field name="recordtype" />
                    <Field name="fromFieldName" />
                    <!-- <Field name="toSectionName" /> -->
                    <Field name="toFieldName" />
                    <Field name="transformAction" />
                    <Field name="transformArgs" />
                    <Field name="isDefault" />
                    <Field name="isDisabled" />
                </Columns>
                <OrderBy>Name</OrderBy>
            </ListView>
        <ListView id="" name="All Custom Entries" label="All Custom Entries" >
                <WhereCondition>Default_Mapping__c = FALSE</WhereCondition>
        <Columns>
                    <Field name="name" />
                    <Field name="entityType" />
                    <Field name="fromEntityName" />
                    <Field name="recordtype" />
                    <Field name="fromFieldName" />
                    <Field name="toFieldName" />
                    <Field name="transformAction" />
                    <Field name="transformArgs" />
                    <Field name="isDisabled" />
                </Columns>
                <OrderBy>Name</OrderBy>
            </ListView>
        </ListViews>
    </SettingEntity>
    <SettingEntity name="Setting.EntityFieldList" ref="Entity_Field_List__c">
        <Fields>
            <Field name="name" ref="Name" />
            <Field name="entityname" label="Entity Name" ref="Entity_Name__c" displayType="Picklist" required="true">
                <!-- Required and possible values include: 'illustrationentry' and 'insurancecaseentry' (no blank value) -->
                <!-- should programmatically include or omit the namespace dependent on if it is managed or unmanaged -->
                <Picklist>
                    <Option value="{!NS}accountentry" name="accountentry" />
                    <Option value="{!NS}alertentry" name="alertentry" />
                    <Option value="{!NS}commissionentry" name="commissionentry" />
                    <Option value="{!NS}commissiondetailentry" name="commissiondetailentry" />
                    <Option value="{!NS}contactentry" name="contactentry" />
                    <Option value="{!NS}coverageentry" name="coverageentry" />
                    <Option value="{!NS}factfinderentry" name="factfinderentry" />
                    <Option value="{!NS}illustrationentry" name="illustrationentry" />
                    <Option value="{!NS}inforcepolicyentry" name="inforcepolicyentry" />
                    <Option value="{!NS}inforcepolicyagententry" name="inforcepolicyagententry" />
                    <Option value="{!NS}inforcepolicycoverageentry" name="inforcepolicycoverageentry" />
                    <Option value="{!NS}inforcepolicyinsuredentry" name="inforcepolicyinsuredentry" />
                    <Option value="{!NS}inforcepolicynoteentry" name="inforcepolicynoteentry" />
                    <Option value="{!NS}inforcepolicypaymententry" name="inforcepolicypaymententry" />
                    <Option value="{!NS}insurancecaseentry" name="insurancecaseentry" />
                    <Option value="{!NS}insurancecasepartyentry" name="insurancecasepartyentry" />
                    <Option value="{!NS}insuredentry" name="insuredentry" />
                    <Option value="{!NS}noteentry" name="noteentry" />
                    <Option value="{!NS}pendingcaseentry" name="pendingcaseentry" />
                    <Option value="{!NS}policyserviceentry" name="policyserviceentry" />
                    <Option value="{!NS}requiremententry" name="requiremententry" />
                    <Option value="{!NS}userentry" name="userentry" />
                </Picklist>
            </Field>
            <Field name="fieldname" label="" ref="Field_Name__c" required="true">

            </Field>
            <Field name="enabled" label="Enabled" ref="Enabled__c"/>
            <Field name="isdefault" label="Default" ref="Default__c"/>
        </Fields>
        <SearchView id="searchView" name="searchView" label="List view for search result">
            <Columns>
                <Field name="name" />
                <Field name="entityname" />
                <Field name="fieldname" />
        <Field name="isdefault" />
                <Field name="enabled" />
            </Columns>
            <OrderBy>Name</OrderBy>
        </SearchView>
        <ListViews>
             <ListView id="" name="Insurance Case Entries" label="Insurance Case Entries" >
                <WhereCondition>Entity_Name__c = '{!NS}insurancecaseentry'</WhereCondition>
                <Columns>
                    <Field name="name" />
                    <Field name="entityname" />
                    <Field name="fieldname" />
            <Field name="isdefault" />
                    <Field name="enabled" />
                </Columns>
                <OrderBy>Name</OrderBy>
            </ListView>
             <ListView id="" name="Illustration Entries" label="Illustration Entries" >
                <WhereCondition>Entity_Name__c = '{!NS}illustrationentry'</WhereCondition>
                <Columns>
                    <Field name="name" />
                    <Field name="entityname" />
                    <Field name="fieldname" />
            <Field name="isdefault" />
                    <Field name="enabled" />
                </Columns>
                <OrderBy>Name</OrderBy>
            </ListView>
            <ListView id="" name="Account Entries" label="Account Entries" >
                <WhereCondition>Entity_Name__c = '{!NS}accountentry'</WhereCondition>
                <Columns>
                    <Field name="name" />
                    <Field name="entityname" />
                    <Field name="fieldname" />
            <Field name="isdefault" />
                    <Field name="enabled" />
                </Columns>
                <OrderBy>Name</OrderBy>
            </ListView>
              <ListView id="" name="Contact Entries" label="Contact Entries" >
                <WhereCondition>Entity_Name__c = '{!NS}contactentry'</WhereCondition>
                <Columns>
                    <Field name="name" />
                    <Field name="entityname" />
                    <Field name="fieldname" />
            <Field name="isdefault" />
                    <Field name="enabled" />
                </Columns>
                <OrderBy>Name</OrderBy>
            </ListView>
              <ListView id="" name="Pending Case Entries" label="Pending Case Entries" >
                <WhereCondition>Entity_Name__c = '{!NS}pendingcaseentry'</WhereCondition>
                <Columns>
                    <Field name="name" />
                    <Field name="entityname" />
                    <Field name="fieldname" />
            <Field name="isdefault" />
                    <Field name="enabled" />
                </Columns>
                <OrderBy>Name</OrderBy>
            </ListView>
              <ListView id="" name="Requirement Entries" label="Requirement Entries" >
                <WhereCondition>Entity_Name__c = '{!NS}requiremententry'</WhereCondition>
                <Columns>
                    <Field name="name" />
                    <Field name="entityname" />
                    <Field name="fieldname" />
            <Field name="isdefault" />
                    <Field name="enabled" />
                </Columns>
                <OrderBy>Name</OrderBy>
            </ListView>
             <ListView id="" name="User Entries" label="User Entries" >
                <WhereCondition>Entity_Name__c = '{!NS}userentry'</WhereCondition>
                <Columns>
                    <Field name="name" />
                    <Field name="entityname" />
                    <Field name="fieldname" />
            <Field name="isdefault" />
                    <Field name="enabled" />
                </Columns>
                <OrderBy>Name</OrderBy>
            </ListView>
            <ListView id="" name="All Entries" label="All Entries" >
                <Columns>
                    <Field name="name" />
                    <Field name="entityname" />
                    <Field name="fieldname" />
            <Field name="isdefault" />
                    <Field name="enabled" />
                </Columns>
                <OrderBy>Name</OrderBy>
            </ListView>
        <ListView id="" name="All Custom Entries" label="All Custom Entries" >
        <WhereCondition>Default__c = FALSE</WhereCondition>
                <Columns>
                    <Field name="name" />
                    <Field name="entityname" />
                    <Field name="fieldname" />
                    <Field name="enabled" />
                </Columns>
                <OrderBy>Name</OrderBy>
            </ListView>
            <ListView id="" name="Invalid Entries" label="Invalid Entries" >
                <Columns>
                    <Field name="name" />
                    <Field name="entityname" />
                    <Field name="fieldname" />
            <Field name="isdefault" />
                    <Field name="enabled" />
                </Columns>
                <OrderBy>Name</OrderBy>
            </ListView>
        </ListViews>
    </SettingEntity>
    <SettingEntity name="Setting.InsuranceToolCfg" ref="InsuranceTool_Product_Config__c">
        <Fields>
            <Field name="name" ref="Name" required="true"/>
            <Field name="toolname" label="Tool" ref="Tool_Name__c" displayType="PICKLIST" required="true"
                lookupObject="{!NS}Insurance_Tool_Registration__c" lookupTextField="display_name__c" lookupIdField="name"
                filterField="Active__c" filterFieldValue="true" >
            </Field>
            <Field name="phase" label="Phase" ref="Phase__c" displayType="PICKLIST" required="true">

                <Picklist>
                    <Option value="needs analysis" name="Needs Analysis" />
                    <Option value="illustration" name="Illustration" />
                    <Option value="application" name="Application" />
                </Picklist>
            </Field>
            <Field name="lineofbusiness" label="Line Of Business" ref="Line_Of_Business__c" displayType="Reference" required="true"
                lookupObject="{!NS}Insurance_Product_Line_of_Business__c" lookupTextField="name" lookupIdField="id">
            </Field>
            <Field name="producttype" label="Product Type" ref="Product_Type__c" displayType="Reference"
                lookupObject="{!NS}Insurance_Product_Type__c" lookupTextField="name" lookupIdField="id">
            </Field>
        </Fields>
        <SearchView id="searchView" name="searchView" label="List view for search result">
            <Columns>
                <Field name="name" />
                <Field name="toolname" />
                <Field name="phase" />
                <Field name="lineofbusiness" />
                <Field name="producttype" />
            </Columns>
            <OrderBy>Name</OrderBy>
        </SearchView>
        <ListViews>
            <ListView id="" name="All" label="All" >
                <Columns>
                    <Field name="name" />
                    <Field name="toolname" />
                    <Field name="phase" />
                    <Field name="lineofbusiness" />
                    <Field name="producttype" />
                </Columns>
                <OrderBy>Name</OrderBy>
            </ListView>

        </ListViews>
    </SettingEntity>
    <SettingEntity name="Setting.ApplicationCfg" ref="Application_Cfg__c">
        <Fields>
            <Field name="name" ref="Name" required="true"/>
            <Field name="key" ref="Key__c" required="true" />
            <Field name="category" ref="Category__c" required="false" />
            <Field name="value" ref="Value__c" required="true" >
                <Picklist>
                <!--
                    <Option value="" name="" parent="pa_recordtype" />
                    <Option value="" name="" parent="ba_recordtype" />
                -->
                    <Option value="0" name="0 - Create but do not update" parent="update_option" />
                    <Option value="1" name="1 - Create and update" parent="update_option" />
                    <Option value="0" name="0 - Do not create or update client" parent="upsert_option" />
                    <Option value="1" name="1 - Create or update person account" parent="upsert_option" />
                    <Option value="2" name="2 - Create or update person/business account" parent="upsert_option" />
                    <Option value="No" name="No - Do not create or update client" parent="yesno_option"/>
                    <Option value="Yes" name="Yes - Create or update client" parent="yesno_option"/>
                    <Option value="True" name="True" parent="truefalse_option"/>
                    <Option value="False" name="False" parent="truefalse_option"/>
                </Picklist>
            </Field>
            <Field name="isdefault" label="Default" ref="Default_Mapping__c" />
        </Fields>
        <SearchView id="searchView" name="searchView" label="List view for search result">
            <Columns>
                <Field name="name" />
                <Field name="key" />
                <Field name="value" />
                <Field name="category" />
                <Field name="isdefault" />
            </Columns>
            <OrderBy>Name</OrderBy>
        </SearchView>
        <ListViews>
            <ListView id="" name="All" label="All Categories" >
                <Columns>
                    <Field name="name" />
                    <Field name="key" />
                    <Field name="value" />
                    <Field name="category" />
                    <Field name="isdefault" />
                </Columns>
                <OrderBy>Name</OrderBy>
            </ListView>
            <ListView id="" name="Client Record" label="Client Record" >
                <WhereCondition>Category__c = 'ClientRecord'</WhereCondition>
                <Columns>
                    <Field name="name" />
                    <Field name="key" />
                    <Field name="value" />
                    <Field name="category" />
                    <Field name="isdefault" />
                </Columns>
                <OrderBy>Name</OrderBy>
            </ListView>
            <ListView id="" name="Debug" label="Debug" >
                <WhereCondition>Category__c = 'Debug'</WhereCondition>
                <Columns>
                    <Field name="name" />
                    <Field name="key" />
                    <Field name="value" />
                    <Field name="category" />
                    <Field name="isdefault" />
                </Columns>
                <OrderBy>Name</OrderBy>
            </ListView>
            <ListView id="" name="Display" label="Display" >
                <WhereCondition>Category__c = 'Display'</WhereCondition>
                <Columns>
                    <Field name="name" />
                    <Field name="key" />
                    <Field name="value" />
                    <Field name="category" />
                    <Field name="isdefault" />
                </Columns>
                <OrderBy>Name</OrderBy>
            </ListView>
            <ListView id="" name="Field ID" label="Field ID" >
                <WhereCondition>Category__c = 'FieldID'</WhereCondition>
                <Columns>
                    <Field name="name" />
                    <Field name="key" />
                    <Field name="value" />
                    <Field name="category" />
                    <Field name="isdefault" />
                </Columns>
                <OrderBy>Name</OrderBy>
            </ListView>
            <ListView id="" name="Match by External ID" label="Match by External ID" >
                <WhereCondition>Category__c = 'Match by External ID'</WhereCondition>
                <Columns>
                    <Field name="name" />
                    <Field name="key" />
                    <Field name="value" />
                    <Field name="category" />
                    <Field name="isdefault" />
                </Columns>
                <OrderBy>Name</OrderBy>
            </ListView>
            <ListView id="" name="Prefill" label="Prefill" >
                <WhereCondition>Category__c = 'Prefill'</WhereCondition>
                <Columns>
                    <Field name="name" />
                    <Field name="key" />
                    <Field name="value" />
                    <Field name="category" />
                    <Field name="isdefault" />
                </Columns>
                <OrderBy>Name</OrderBy>
            </ListView>
            <ListView id="" name="Record Type" label="Record Type" >
                <WhereCondition>Category__c = 'RecordType'</WhereCondition>
                <Columns>
                    <Field name="name" />
                    <Field name="key" />
                    <Field name="value" />
                    <Field name="category" />
                    <Field name="isdefault" />
                </Columns>
                <OrderBy>Name</OrderBy>
            </ListView>
            <ListView id="" name="Relationship Mgmt By Source" label="Relationship Mgmt By Source" >
                <WhereCondition>Category__c = 'Relationship Mgmt By Source'</WhereCondition>
                <Columns>
                    <Field name="name" />
                    <Field name="key" />
                    <Field name="value" />
                    <Field name="category" />
                    <Field name="isdefault" />
                </Columns>
                <OrderBy>Name</OrderBy>
            </ListView>
        </ListViews>
    </SettingEntity>
     <SettingEntity name="Setting.NameValueMapping" ref="Name_Value_Mapping__c">
        <Fields>
            <Field name="name" ref="Name" required="true"/>
            <Field name="isdisabled" label="Disable Mapping" ref="Disable__c" ></Field>
            <Field name="isdefault" label="Default Mapping" ref="Default__c" ></Field>
            <Field name="fieldname" label="Field Name" ref="Field_Name__c" ></Field>
            <Field name="key" label="Key" ref="Key__c" > </Field>
            <Field name="targetvalue" label="Target Value" ref="Target_Value__c"> </Field>
            <Field name="targetapp" label="External Application" ref="Target_App__c" > </Field>
            <Field name="value" label="Value" ref="Value__c" > </Field>
        </Fields>
        <SearchView id="searchView" name="searchView" label="List view for search result">
            <Columns>
                <Field name="name" />
                <Field name="fieldname" />
                <!-- <Field name="key" /> -->
                <Field name="targetvalue" />
                <Field name="targetapp" />
                <Field name="value" />
            </Columns>
            <OrderBy>Name</OrderBy>
        </SearchView>
        <ListViews>
            <ListView id="" name="iGO" label="iGO" >
                <WhereCondition>Target_App__c = 'iGO'</WhereCondition>
                <Columns>
                    <Field name="name" />
                    <!-- <Field name="key" /> -->
                    <Field name="fieldname" />
                    <Field name="targetapp" />
                    <Field name="value" />
                    <Field name="targetvalue" />
                    <Field name="isdefault" />
                    <Field name="isdisabled" />
            </Columns>
                <OrderBy>Name</OrderBy>
            </ListView>
             <ListView id="" name="Acord" label="Acord" >
                <WhereCondition>Target_App__c = 'Acord'</WhereCondition>
                <Columns>
                    <Field name="name" />
                    <!-- <Field name="key" /> -->
                    <Field name="fieldname" />
                    <Field name="targetapp" />
                    <Field name="value" />
                    <Field name="targetvalue" />
                    <Field name="isdefault" />
                    <Field name="isdisabled" />
            </Columns>
                <OrderBy>Name</OrderBy>
            </ListView>
            <ListView id="" name="All" label="All" >
                <Columns>
                    <Field name="name" />
                    <!-- <Field name="key" /> -->
                    <Field name="fieldname" />
                    <Field name="targetapp" />
                    <Field name="value" />
                    <Field name="targetvalue" />
                    <Field name="isdefault" />
                    <Field name="isdisabled" />
            </Columns>
                <OrderBy>Name</OrderBy>
            </ListView>
        <ListView id="" name="All Custom Entries" label="All Custom Entries" >
        <WhereCondition>Default__c = FALSE</WhereCondition>
                <Columns>
                    <Field name="name" />
                    <Field name="fieldname" />
                    <Field name="targetapp" />
                    <Field name="value" />
                    <Field name="targetvalue" />
                    <Field name="isdisabled" />
            </Columns>
                <OrderBy>Name</OrderBy>
            </ListView>
        </ListViews>
    </SettingEntity>


     <SettingEntity name="Setting.GlobalSetting" ref="AgentOneGlobalSettings__c">
        <Fields>
            <Field name="name" ref="Name" required="true"/>
            <Field name="chattercreatealerts" label="Create Chatter Posts for Alerts" ref="Create_Chatter_Post_for_Alerts__c" ></Field>
            <Field name="chatteratmentions" label="Enable at-mentions on chatter post" ref="Enable_Mentions_On_Chatter__c" > </Field>
            <Field name="issharingenabled" label="Create Share for Insurance Case Split" ref="Create_Share_For_Agent_Split__c" ></Field>
            <Field name="numdaystodeactivatecase" label="Deactivate Case X Days After Final Disp." ref="Deactivate_Case_X_Days_After_Final_Disp__c" ></Field>
            <Field name="numdaysbeforebdaynotification" label="Number Days Before Birthday Notification" ref="NumberDaysBeforeBirthdayNotification__c" > </Field>
            <Field name="numdaysbeforeplacementend" label="Number Days Before Placement End Date" ref="NumberDaysBeforePlacementEnd__c" > </Field>
            <Field name="iscaseheaderdisplayed" ref="Show_indicator_in_At_a_Glance_section__c" > </Field>
            <Field name="iscasephaseheaderdisplayed" ref="Show_Case_Phase_Chevron__c" > </Field>
            <Field name="isillustrationdisabled" label="Disable Illustration Button" ref="Disable_Illustrations_Feature__c" > </Field>
            <Field name="isneedsdisabled" label="Disable Needs Analysis Button" ref="Disable_Needs_Analysis_Button__c"> </Field>
            <Field name="isphsdisabled" label="Disable Policy Holder Services Buttons" ref="Disable_PHS_Button__c" > </Field>
            <Field name="isglobaltriggersenabled" label="Global Trigger Execution Enabled" ref="GlobalTriggerExecutionEnabled__c" > </Field>
            <Field name="idp" label="IDP" ref="IDP__c" ></Field>
            <Field name="loglevel" label="Log Level" ref="Log_Level__c"  displayType="Picklist" required="true">
                <Picklist>
                    <Option value="ERROR" name="ERROR" />
                    <Option value="WARN" name="WARN" />
                    <Option value="INFO" name="INFO" />
                    <Option value="DEBUG" name="DEBUG" />
                    <Option value="FINE" name="FINE" />
                </Picklist>
            </Field>
            <Field name="namespace" label="Namespace" ref="Namespace__c" > </Field>
            <!-- <Field name="pendingcasefk" label="PendingCase Foreign Key Field" ref="PendingCase_FK_Field__c" > </Field> -->
            <Field name="pendingcasefk" label="PendingCase Foreign Key Field" ref="PendingCase_FK_Field__c" displayType="Reference"
                lookupObject="{!NS}Entity_Field_List__c" lookupTextField="field_name__c">
            </Field>
            <Field name="bypasspcidvalidationforpi" label="Bypass Pending Case Identity Validation for PI" ref="PendingCase_ByPass_IdValidationForPI__c" > </Field>
            <Field name="allowpcupdateplacedcs" label="Allow Pending Case Updates For Placed Insurance Cases" ref="PendingCase_Allow_UpdatePlacedCs__c" > </Field>


        </Fields>
        <SearchView id="searchView" name="searchView" label="List view for search result">
            <Columns>
                <Field name="name" />
            </Columns>
            <OrderBy>Name</OrderBy>
        </SearchView>
        <ListViews>
            <ListView id="" name="All" label="All" >
                <Columns>
                    <Field name="name" />
            </Columns>
                <OrderBy>Name</OrderBy>
            </ListView>
        </ListViews>
    </SettingEntity>


     <SettingEntity name="Setting.InsuranceToolReg" ref="Insurance_Tool_Registration__c">
        <Fields>
            <Field name="name" ref="Name" required="true"/>
            <Field name="adapterclassname" label="Adapter Class Name" ref="Adapter_Class_Name__c" ></Field>
            <Field name="adapternamespace" label="Adapter Namespace" ref="Adapter_Namespace__c" ></Field>
            <Field name="displayname" label="Display Name" ref="Display_Name__c" > </Field>
            <Field name="height" label="Height" ref="Height__c" defaultValue="2000px"> </Field>
            <Field name="isactive" label="Active" ref="Active__c" ></Field>
            <Field name="ishosted" label="Is Hosted" ref="Is_Hosted__c" > </Field>
            <Field name="isnewwindow" label="Open New Window" ref="Open_New_Window__c" ></Field>
            <Field name="minos" label="Minimum Supported Operating Systems" ref="Minimum_Supported_Operating_Systems__c" > </Field>
            <Field name="minres" label="Minimum Supported Resolution" ref="Minimum_Supported_Resolution__c" ></Field>
            <Field name="order" displayType="Picklist" label="Order" ref="Order__c" >
                <Picklist>
                    <Option value="" name="--blank--" />
                    <Option value="1" name="1" />
                    <Option value="2" name="2" />
                    <Option value="3" name="3" />
                    <Option value="4" name="4" />
                    <Option value="5" name="5" />
                    <Option value="6" name="6" />
                    <Option value="7" name="7" />
                    <Option value="8" name="8" />
                    <Option value="9" name="9" />
                    <Option value="10" name="10" />
                </Picklist>
            </Field>
            <Field name="permissionname" label="Custom Permission" ref="Permission_Name__c" > </Field>
            <Field name="url" label="URL" ref="URL__c" required="true"> </Field>
            <Field name="width" label="Width" ref="Width__c" defaultValue="100%" > </Field>
        </Fields>
        <SearchView id="searchView" name="searchView" label="List view for search result">
            <Columns>
                <Field name="name" />
                <Field name="displayname" />
                <Field name="url" />
                <Field name="width" />
                <Field name="height" />
                <Field name="minos" />
                <Field name="minres" />
                <Field name="permissionname" />
                <Field name="order" />
                <Field name="isactive" />
            </Columns>
            <OrderBy>Name</OrderBy>
        </SearchView>
        <ListViews>
            <ListView id="" name="All" label="All" >
                <Columns>
                    <Field name="name" />
                    <Field name="displayname" />
                    <Field name="url" />
                    <Field name="width" />
                    <Field name="height" />
                    <Field name="minos" />
                    <Field name="minres" />
                    <Field name="permissionname" />
                    <Field name="order" />
                    <Field name="isactive" />
                </Columns>
                <OrderBy>Name</OrderBy>
            </ListView>
        </ListViews>
    </SettingEntity>


      <SettingEntity name="Setting.PluginExtensionReg" ref="Plugin_Registration__c">
        <Fields>
            <Field name="name" ref="Name" required="true"/>
            <Field name="isenabled" label="Enabled" ref="Enabled__c" ></Field>
            <Field name="entityname" label="Entity Name" ref="Entity_Name__c" ></Field>
            <Field name="eventname" label="Event Name" ref="Event_Name__c" ></Field>
            <Field name="order" label="Order" ref="Order__c" > </Field>
            <Field name="pluginclassname" label="Plugin Class Name" ref="Plugin_Class_Name__c"> </Field>
            <Field name="pluginnamespace" label="Plugin Namespace" ref="Plugin_Namespace__c" > </Field>
        </Fields>
        <SearchView id="searchView" name="searchView" label="List view for search result">
            <Columns>
                <Field name="name" />
                <Field name="isenabled" />
                <Field name="entityname" />
                <Field name="eventname" />
                <Field name="order" />
                <Field name="pluginclassname" />
                <Field name="pluginnamespace" />
            </Columns>
            <OrderBy>Name</OrderBy>
        </SearchView>
        <ListViews>
            <ListView id="" name="All" label="All" >
                <Columns>
                    <Field name="name" />
                    <Field name="isenabled" />
                    <Field name="entityname" />
                    <Field name="eventname" />
                    <Field name="order" />
                    <Field name="pluginclassname" />
                    <Field name="pluginnamespace" />
            </Columns>
                <OrderBy>Name</OrderBy>
            </ListView>
        </ListViews>
    </SettingEntity>

 <SettingEntity name="Setting.SourceApplication" ref="Source_Application__c">
        <Fields>
            <Field name="name" ref="Name" required="true"/>
            <Field name="displayname" label="Display Name" ref="DisplayName__c" ></Field>
            <Field name="isdefault" label="Is Default" ref="Default__c" ></Field>
        </Fields>
        <SearchView id="searchView" name="searchView" label="List view for search result">
            <Columns>
                <Field name="name" />
                <Field name="displayname" />
                <Field name="isdefault" />
            </Columns>
            <OrderBy>Name</OrderBy>
        </SearchView>
        <ListViews>
            <ListView id="" name="All" label="All" >
                <Columns>
                    <Field name="name" />
                <Field name="displayname" />
                <Field name="isdefault" />
            </Columns>
                <OrderBy>Name</OrderBy>
            </ListView>
        </ListViews>
    </SettingEntity>


    <SettingEntity name="Setting.RelationshipMap" ref="Party_Relationship_Role__c">
        <Fields>
            <Field name="name" ref="Name" required="true"/>
            <Field name="displayname" label="Display Name" ref="Display_Name__c" ></Field>
            <!-- <Field name="relationshiprole" label="Relationship Role" ref="Relationship_Role__c" ></Field> -->

            <Field name="relationshiprole" label="" ref="Relationship_Role__c" displayType="Reference"
                lookupObject="{!NS}Relationship_Role__c" lookupTextField="To_Role__c"
                filterField="Enabled__c" filterFieldValue="true"/>

            <Field name="isdefault" label="Is Default" ref="Default__c" ></Field>
            <Field name="enabled" label="Enabled" ref="Enabled__c" />
        </Fields>
        <SearchView id="searchView" name="searchView" label="List view for search result">
            <Columns>
                <Field name="name" />
                <Field name="displayname" />
                <Field name="relationshiprole" />
                <Field name="isdefault" />
            </Columns>
            <OrderBy>Name</OrderBy>
        </SearchView>
        <ListViews>
            <ListView id="" name="All" label="All" >
                <Columns>
                    <Field name="name" />
                    <Field name="displayname" />
                    <Field name="relationshiprole" />
                    <Field name="isdefault" />
                </Columns>
                <OrderBy>Name</OrderBy>
            </ListView>
            <ListView id="" name="All Custom Entries" label="All Custom Entries" >
        <WhereCondition>Default__c = FALSE</WhereCondition>
                <Columns>
                    <Field name="name" />
                    <Field name="displayname" />
                    <Field name="relationshiprole" />
                </Columns>
                <OrderBy>Name</OrderBy>
            </ListView>
        </ListViews>
    </SettingEntity>



   <SettingEntity name="Setting.RelationshipRole" ref="Relationship_Role__c">
        <Fields>
            <Field name="name" label="Relationship Role Name" ref="Name" required="true"/>
            <Field name="category" displayType="Picklist" label="Category" ref="Category__c" ></Field>
            <Field name="key" ref="Key__c" required="true" />
            <Field name="fromrole" label="From Role" ref="From_Role__c" required="true"></Field>
            <Field name="reciprocalrole" label="Reciprocal Role" ref="Reciprocal_Role__c" displayType="Reference"
                lookupObject="{!NS}Relationship_Role__c" lookupTextField="name" >
            </Field>
            <Field name="reciprocalroletext" label="Reciprocal  Role" ref="Reciprocal_Role__r.Name"></Field>
            <Field name="torole" label="To Role" ref="To_Role__c" required="true" ></Field>
            <Field name="fromroleapi" label="From Role API" ref="From_Role_API__c" ></Field>
            <Field name="toroleapi" label="To Role API" ref="To_Role_API__c" ></Field>
            <Field name="isdefault" label="Is Default" ref="Default__c" ></Field>
            <Field name="enabled" label="" ref="Enabled__c" />
        </Fields>
        <SearchView id="searchView" name="searchView" label="List view for search result">
            <Columns>
                <Field name="name" />
                <Field name="category" />
                <Field name="fromrole" />
                <Field name="reciprocalroletext" />
                <Field name="torole" />
                <Field name="isdefault" />
                <Field name="enabled" />
            </Columns>
            <OrderBy>Name</OrderBy>
        </SearchView>
        <ListViews>
            <ListView id="" name="All" label="All" >
            <Columns>
                <Field name="name" />
                <Field name="category" />
                <Field name="fromrole" />
                <Field name="reciprocalroletext" />
                <Field name="torole" />
                <Field name="isdefault" />
                <Field name="enabled" />
            </Columns>
                <OrderBy>Name</OrderBy>
            </ListView>
            <ListView id="" name="All Custom Entries" label="All Custom Entries" >
        <WhereCondition>Default__c = FALSE</WhereCondition>
            <Columns>
                <Field name="name" />
                <Field name="category" />
                <Field name="fromrole" />
                <Field name="reciprocalroletext" />
                <Field name="torole" />
                <Field name="enabled" />
            </Columns>
                <OrderBy>Name</OrderBy>
            </ListView>
            <ListView id="" name="Business" label="Business" >
                <WhereCondition>Category__c = 'Business'</WhereCondition>
                <Columns>
                    <Field name="name" />
                    <Field name="category" />
                    <Field name="fromrole" />
                    <Field name="reciprocalroletext" />
                    <Field name="torole" />
                    <Field name="isdefault" />
                    <Field name="enabled" />
                </Columns>
                <OrderBy>Name</OrderBy>
            </ListView>
            <ListView id="" name="Family" label="Family" >
                <WhereCondition>Category__c = 'Family'</WhereCondition>
                <Columns>
                    <Field name="name" />
                    <Field name="category" />
                    <Field name="fromrole" />
                    <Field name="reciprocalroletext" />
                    <Field name="torole" />
                    <Field name="isdefault" />
                    <Field name="enabled" />
                </Columns>
                <OrderBy>Name</OrderBy>
            </ListView><ListView id="" name="Sales" label="Sales" >
                <WhereCondition>Category__c = 'Sales'</WhereCondition>
                <Columns>
                    <Field name="name" />
                    <Field name="category" />
                    <Field name="fromrole" />
                    <Field name="reciprocalroletext" />
                    <Field name="torole" />
                    <Field name="isdefault" />
                    <Field name="enabled" />
                </Columns>
                <OrderBy>Name</OrderBy>
            </ListView>
            <ListView id="" name="Social" label="Social" >
                <WhereCondition>Category__c = 'Social'</WhereCondition>
                <Columns>
                    <Field name="name" />
                    <Field name="category" />
                    <Field name="fromrole" />
                    <Field name="reciprocalroletext" />
                    <Field name="torole" />
                    <Field name="isdefault" />
                    <Field name="enabled" />
                </Columns>
                <OrderBy>Name</OrderBy>
            </ListView>
            <ListView id="" name="Other" label="Other" >
                <WhereCondition>Category__c = 'Other'</WhereCondition>
                <Columns>
                    <Field name="name" />
                    <Field name="category" />
                    <Field name="fromrole" />
                    <Field name="reciprocalroletext" />
                    <Field name="torole" />
                    <Field name="isdefault" />
                    <Field name="enabled" />
                </Columns>
                <OrderBy>Name</OrderBy>
            </ListView>
        </ListViews>
    </SettingEntity>


    <SettingEntity name="Setting.iGOSettings" ref="iGO_AppSetting__c" label="iGO Settings">
        <Fields>
            <Field name="name" ref="Name" required="true"/>
            <Field name="action" label="Action" ref="Action__c" ></Field>
            <Field name="isactionablealertsenabled" label="Actionable Alerts Enabled" ref="Actionable_Alerts_Enabled__c" ></Field>
            <Field name="isesignenabled" label="Allow e-Sign from Related Alert" ref="ESign_Enabled__c" ></Field>
            <Field name="applicationtool" label="Application Tool" ref="Application_Tool__c" displayType="PICKLIST"
                lookupObject="{!NS}Insurance_Tool_Registration__c" lookupTextField="display_name__c" lookupIdField="name"
                filterField="Active__c" filterFieldValue="true" ></Field>
            <Field name="batchsizeforcases" label="Batch Size to Process iGO Cases." ref="Batch_Size_To_Process_iGO_Cases__c" ></Field>
            <Field name="iscaseduplicationenabled" label="Case Duplication Enabled" ref="Case_Duplication_Enabled__c" ></Field>
            <Field name="channelname" label="Channel Name" ref="ChannelName__c" ></Field>
            <Field name="companyidentifier" label="Company Identifier" ref="CompanyIdentifier__c" ></Field>
            <Field name="isdelaydeleteofcaseenabled" label="Delay Delete of iGO Case" ref="Delay_Delete_iGO_Cases__c" ></Field>
            <Field name="isdeleteigowithcaseenabled" label="Delete iGO Case with Insurance Case" ref="Delete_iGO_Case_with_Insurance_Case__c" ></Field>
            <Field name="iseditemailbeforeresendenabled" label="Edit Email Before Resend Enabled" ref="Edit_Email_before_Resend_Enabled__c" ></Field>
            <Field name="isentitysyncenabled" label="EntitySync Enabled" ref="EntitySync_Enabled__c" ></Field>
            <Field name="groups" label="Groups" ref="Groups__c" ></Field>
            <Field name="isonbehalfofenabled" label="On Behalf Of Enabled" ref="On_Behalf_Of_Enabled__c" ></Field>
            <Field name="organizationidentifier" label="Organization Identifier" ref="OrganizationIdentifier__c" ></Field>
            <Field name="isprotectcaseinsuredsenabled" label="Protect Insurance Case Insureds" ref="Protect_Insurance_Case_Insureds__c" ></Field>
            <Field name="isprotectcaseparticipantsenabled" label="Protect Insurance Case Participants" ref="Protect_Insurance_Case_Participants__c" ></Field>
            <Field name="isprotectcaseprimaryinsuredenabled" label="Protect Insurance Case Primary Insured" ref="Protect_Insurance_Case_Primary_Insured__c" ></Field>
            <Field name="redirecturl" label="Redirect URL" ref="RedirectURL__c" ></Field>
            <Field name="isrerunillenabled" label="Re-run Illustration Enabled" ref="Re_run_Illustration_Enabled__c" ></Field>
            <Field name="isresendesignenabled" label="Resend E-Signature Enabled" ref="Resend_E_Signature_Enabled__c" ></Field>
            <Field name="restrictresendemaildomain" label="Restricted Resend Email Domain" ref="Restricted_Resend_Email_Domain__c" ></Field>
            <Field name="isstarteappfromillenabled" label="Start e-App from Illustration Enabled" ref="Start_eApp_from_Illustration_Enabled__c" ></Field>
            <Field name="subcompanyidentifier" label="SubCompany Identifier" ref="SubCompanyIdentifier__c" ></Field>
            <Field name="webserviceendpoint" label="Webservice EndPoint" ref="Webservice_EndPoint__c" ></Field>
            <Field name="webservicetoken" label="WebService Token" ref="iGO_WebService_Token__c" ></Field>


        </Fields>
        <SearchView id="searchView" name="searchView" label="List view for search result">
            <Columns>
                <Field name="name" />
                <Field name="groups" />
                <Field name="subcompanyidentifier" />
                <Field name="redirecturl" />
                <Field name="isentitysyncenabled" />
                <Field name="applicationtool" />
            </Columns>
            <OrderBy>Name</OrderBy>
        </SearchView>
        <ListViews>
            <ListView id="" name="All" label="All" >
                <Columns>
                <Field name="name" />
                <Field name="groups" />
                <Field name="subcompanyidentifier" />
                <Field name="redirecturl" />
                <Field name="isentitysyncenabled" />
                <Field name="applicationtool" />

            </Columns>
                <OrderBy>Name</OrderBy>
            </ListView>
        </ListViews>
    </SettingEntity>


     <SettingEntity name="Setting.SyncMapper" ref="Sync_JSON_Mapper__mdt">
        <Fields>
            <Field name="name" ref="DeveloperName" required="true" label="Sync Mapper Name" />
            <Field name="label" ref="Label" required="true"/>
            <Field name="input" label="Input" ref="Input_Fields__c" ></Field>
            <Field name="output" label="Output" ref="Output_Field__c" ></Field>

            <Field name="inputf" label="Input Fields (User-Friendly)" displayType="STRING"></Field>
            <Field name="outputf" label="Output Field (User-Friendly)" displayType="STRING"></Field>

            <Field name="inputfields" label="Input Fields" ref="Input_Fields__c" description="Input Fields"></Field>
            <Field name="controllingfield" label="Controlling Field" displayType="STRING"></Field>

            <Field name="sourceid" label="Source Id" ref="SourceId__c" ></Field>
            <Field name="entityname" label="Entity Name" ref="Entity_Name__c" displayType="Picklist" required="true">
                <Picklist>
                    <Option value="NeedsAnalysisEntry" name="NeedsAnalysisEntry" />
                    <Option value="InsuranceAppEntry" name="InsuranceAppEntry" />
                    <Option value="IllustrationEntry" name="IllustrationEntry" />
                    <Option value="PolicyServiceEntry" name="PolicyServiceEntry" />
                </Picklist>
            </Field>
            <Field name="transformaction" label="Transform Action" ref="Transform_Action__c" ></Field>
            <Field name="matchall" label="Match All" ref="Match_All__c" ></Field>
            <Field name="isdefault" label="Default" ref="Default__c" ></Field>
            <Field name="enabled" label="Enabled" ref="Enabled__c" ></Field>


        </Fields>
        <SearchView id="searchView" name="searchView" label="List view for search result" showActionButtons="true">
            <Columns>
                <Field name="entityname" />
                <Field name="name" />
                <Field name="outputf" />
                <Field name="inputf" />
                <Field name="isdefault" />
                <Field name="enabled" />
            </Columns>
            <OrderBy>Name</OrderBy>
        </SearchView>
        <ListViews>
            <ListView id="" name="insurancecaseentry" label="Insurance Case Entries" showActionButtons="true">
                <WhereCondition>Entity_Name__c = 'InsuranceAppEntry'</WhereCondition>
                <Columns>
                <Field name="name" />
                <Field name="outputf" />
                <Field name="inputf" />
                <Field name="isdefault" />
                <Field name="enabled" />
            </Columns>
                <OrderBy>Name</OrderBy>
            </ListView>
             <ListView id="" name="illustrationentry" label="Illustration Entries" showActionButtons="true">
                <WhereCondition>Entity_Name__c = 'IllustrationEntry'</WhereCondition>
                <Columns>
                <Field name="name" />
                <Field name="outputf" />
                <Field name="inputf" />
                <Field name="isdefault" />
                <Field name="enabled" />
            </Columns>
                <OrderBy>Name</OrderBy>
            </ListView>
            <ListView id="" name="needsanalysisentry" label="Needs Analysis Entries" showActionButtons="true">
                <WhereCondition>Entity_Name__c = 'NeedsAnalysisEntry'</WhereCondition>
                <Columns>
                <Field name="name" />
                <Field name="outputf" />
                <Field name="inputf" />
                <Field name="isdefault" />
                <Field name="enabled" />
            </Columns>
                <OrderBy>Name</OrderBy>
            </ListView>
             <ListView id="" name="policyserviceentry" label="Policy Entries" showActionButtons="true">
                <WhereCondition>Entity_Name__c = 'PolicyServiceEntry'</WhereCondition>
                <Columns>
                <Field name="name" />
                <Field name="outputf" />
                <Field name="inputf" />
                <Field name="isdefault" />
                <Field name="enabled" />
            </Columns>
                <OrderBy>Name</OrderBy>
            </ListView>
            <ListView id="" name="All" label="All" showActionButtons="true">
                <Columns>
                <Field name="entityname" />
                <Field name="name" />
                <Field name="outputf" />
                <Field name="inputf" />
                <Field name="isdefault" />
                <Field name="enabled" />
            </Columns>
                <OrderBy>Name</OrderBy>
            </ListView>
             <ListView id="" name="custom" label="Custom Entries" showActionButtons="false">
                <WhereCondition>Default__c = FALSE</WhereCondition>
                <Columns>
                <Field name="entityname" />
                <Field name="name" />
                <Field name="outputf" />
                <Field name="inputf" />
                <Field name="isdefault" />
                <Field name="enabled" />
            </Columns>
                <OrderBy>Name</OrderBy>
            </ListView>
        </ListViews>
    </SettingEntity>


</SettingEntities>
