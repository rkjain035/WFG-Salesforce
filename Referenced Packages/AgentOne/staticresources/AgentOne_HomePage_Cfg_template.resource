{  
"layout" : {   
   "left": [],
   "middle":[],
   "right": [],
   "bottom": []
 },
"configuration" : {
"QuickStartCaseSection": {
		"SubTitle": "Start an evaluation, illustration or application now",
		"NeedsAnalysisPhase": "Evaluate Needs",
		"IllustrationPhase": "Run Illustration",
		"ApplicationPhase": "Begin Application",
		"enabled": true
	},
"RecentItemsSection" : {
		"ItemCount" : 7, "enabled" : true
	},
	"TilesSection" : {
		"TileCount" : 3, 
		"Tiles" : [
			{
				"Name" : "My Alerts",
				"TileObject" : "AgentOne__Alert__c",
				"SubTitle" : "Over 5 days old",
				"ColorInd" : "#EA7600",
				"Icon" : "assets/img/Icon_Alert.png",
				"IconResourceType" : "NgBS_Homepage",
				"ListViewId" : "00Bj00000010Tcc"					
			},
			{
				"Name" : "My Underwriting Cases",
				"TileObject" : "InsuranceCase__c",
				"SubTitle" : "Underwriting cases",
				"ColorInd" : "#298FC2",
				"Icon" : "Nav_bgReq_2016",
				"IconResourceType" : "document__type",
				"ListViewId" : "00Bj00000010Tcs",
				"AggregateFunc" : "Count"
			},
			{
				"Name" : "My Cases Inforce",
				"TileObject" : "InsuranceCase__c",
				"SubTitle" : "Placed",
				"ColorInd" : "#38C288",
				"Icon" : "assets/img/Icon_CsInforce.png",
				"IconResourceType" : "NgBS_Homepage",				
				"ListViewId" : "00Bj00000010Tcs",
				"AggregateFunc" : "Count"
			},			
			{
				"Name" : "My Cases with Recent Activity",
				"TileObject" : "InsuranceCase__c",
				"SubTitle" : "Recent activity",
				"ColorInd" : "#EA7600",
				"Icon" : "/img/icon/trophy32.png",
				"ListViewId" : "00Bo0000000wfi3",
				"AggregateFunc" : "Avg",
				"AggregateField" : "coverageamount__c",
				"AggregateResultFormat" : "Currency"		
			},
			{
				"Name" : "My Customers",
				"TileObject" : "Account",
				"SubTitle" : "Active Customers Added this week",
				"ColorInd" : "#EA7600",
				"Icon" : "agent_24x24",
				"IconResourceType" : "document__type",
				"ListViewId" : "00Bo00000033AJ4",
				"AggregateFunc" : "Count"
			}
			
		]
	},
	"AlertsSection" : {
		"enabled" : true
	},
	"TasksSection" : {
		"enabled" : true
	}, 
	"ChartsSection" : {
	"enabled" : true,
		"InsuranceCaseChart" : {
			"IllustrationColor" : "aliceblue",
			"ApplicationColor" : "darkgray",
			"UnderwritingColor" : "cornflowerblue",
			"DeliveryColor" : "darkslateblue"
		}
	}
   }
}
