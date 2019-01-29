window.ps = window.ps || {};
ps.service = ps.service || {};
ps.service.IsAllowedToDeactivate = function () {
	{!REQUIRESCRIPT("/soap/ajax/29.0/connection.js")}
	{!REQUIRESCRIPT("/soap/ajax/29.0/apex.js")}	
    var allow = true;
	var queryString='SELECT Allow_Deactivate_Reactivate_Case__c FROM AgentOneGlobalSettings__c WHERE SetupOwnerId = ';
	var strQuery = queryString.concat("'{!$User.ProfileId}'");	
	var customSetting=sforce.connection.query(strQuery);

	var customRecord=customSetting.getArray('records');
	if (customRecord.length > 0) {
		var value=customRecord[0].Allow_Deactivate_Reactivate_Case__c;
		allow = value;
	}
	return allow;
}