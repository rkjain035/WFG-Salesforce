//This is the global function to update the Case Namw when the Insured change
function updateCaseName () {
    var insuredId = document.getElementById(insuredLookupNameId);
    var caseName = document.getElementById('caseNameInput');
    if(insuredId.value != 'null')
    caseName.value = caseNameTemplateLable.replace('{0}', insuredId.value);
}

//This is the global function to refresh the Phases and Tools UI after User Select Product Type
function refreshPhasesAndTools () {
    var nj_scope = angular.element(document.getElementById('divNgCtrl')).scope();

    manipulateToolName = 'CLEAR_TOOL';

    //uncheck all the radiobox
    var inputs = document.getElementsByTagName("input");
    if(inputs) {
        for (var i = 0; i < inputs.length; i++) {
            if (inputs[i].type == "radio") {
                if(inputs[i].name) {
                    if(inputs[i].name.indexOf('_rad') > -1) {
                        inputs[i].checked = false;
                    }
                }
            }
        }
    }

    var needsToolsEle = document.getElementById('phaseTools');
    var startBtn = document.getElementById('startAppBtn');
    //var toolsDiv = document.getElementsByName("tools_div");
    // var toolsLabel = document.getElementsByName("tools_label");
    var toolsDiv = document.getElementById("portlets").getElementsByClassName("tools_div");
    var toolsLabel = document.getElementById("tools_label");


    //extra Logic here
    if(passedInPhase) {
        var lineOfBusiId = productTypesMapJSON[document.getElementById(productTypeLookupValueId).value];
        var prodTypeId = document.getElementById(productTypeLookupValueId).value;
        var targetTool= [];
        var numTool = 0;

        if(toolsCfgJSON) {
            for(i = 0; i < toolsCfgJSON.length; i++) {
                if(toolsCfgJSON[i].phase == passedInPhase && ((toolsCfgJSON[i].lobId == lineOfBusiId && toolsCfgJSON[i].productTypeId == null) ||
                    (toolsCfgJSON[i].productTypeId != null && toolsCfgJSON[i].productTypeId.indexOf(prodTypeId) > -1))) {
                    targetTool[numTool] = toolsCfgJSON[i].tool;
                    numTool ++;
                }
            }
        }



        if(numTool == 0){
            startBtn.disabled = true;
        } if(numTool == 1) {
            manipulateToolName = 'SET_TOOL';
            uniqueToolName = targetTool[0];
            startBtn.disabled = false;
            if(!(typeof needsToolsEle === 'undefined')) needsToolsEle.className = 'slds-form-element ng-hide';
        } else {
            startBtn.disabled = true;
            if(!(typeof needsToolsEle === 'undefined')) needsToolsEle.className = 'slds-form-element';
            var foundTool = false;
            if(toolsDiv) {
                var tm = {};
                for(i = 0; i < toolsDiv.length; i++ ){
                    toolsDiv[i].className = 'slds-form-element__control ng-scope ng-hide tools_div';

                    if(targetTool && targetTool.length > 0) {
                        for(j = 0; j < targetTool.length; j++) {
                            if(toolsDiv[i].childNodes[0].childNodes[0].value == targetTool[j]) {
                                if(tm[toolsDiv[i].childNodes[0].childNodes[0].value] != 'true') {
                                    toolsDiv[i].className = 'slds-form-element__control ng-scope tools_div';
                                    foundTool = true;
                                    tm[toolsDiv[i].childNodes[0].childNodes[0].value] = 'true';
                                }

                            }
                        }
                    }
                }
            }

            if(foundTool == false) {
                //hide the tool title also
                toolsLabel.className = 'slds-form-element__label slds-form-element__label--top ng-binding ng-hide';
            } else {
                toolsLabel.className = 'slds-form-element__label slds-form-element__label--top ng-binding';
            }
        }
    } else {
        if(!(typeof needsToolsEle === 'undefined')) needsToolsEle.className = 'slds-form-element ng-hide';
        startBtn.disabled = true;
    }
}

var app = angular.module('launchCase', []);

app.service('AppService', ['$window', '$q', '$rootScope', '$sce', function($window, $q, $rootScope, $sce) {
    //The call the apex Controller function to upsert the Insurance Case
    this.upsertInsuranceCaseRemoteFunction = function (remoteFunc, args, launchTool, $scope) {
        Visualforce.remoting.Manager.invokeAction(
            remoteFunc,
            args,
            function(result, event) {
                if (event.status) {
                    if (!launchTool) {
                         if ($scope.casePhase == 'Illustration' || $scope.casePhase == 'illustration') {

                            // Open Illustratio screen with fields filled in.
                            var illustrationEditPage = '/' + illustrationObjectCode + '/e';

                             // Primary Insured/Annuitant Contact
                             if(primaryInsuredName) {
                                illustrationEditPage += '?CF'+insuredNameFieldId+'=' + primaryInsuredName;
                             } else if (document.getElementById(insuredLookupNameId) != null) {
                                illustrationEditPage += '?CF'+insuredNameFieldId+'=' + document.getElementById(insuredLookupNameId).value;
                             } else {
                                //this is the legacy code, not sure if we needed
                                illustrationEditPage += '?CF'+insuredNameFieldId+'=' + result[contactRelstionshipName].Name;
                             }
                                illustrationEditPage += '&CF'+insuredNameFieldId+'_lkid=' + result[caseContactName];

                            // InsuranceCase
                            illustrationEditPage += '&CF'+insuranceCaseFieldId+'='+ result.Name;
                            illustrationEditPage += '&CF'+insuranceCaseFieldId+'_lkid=' + result.Id;


                            // Product Type
                            var productType = document.getElementById(productTypeLookupNameId);
                            var productTypeText = productType.value;

                            illustrationEditPage += '&CF'+productTypeFieldId +'=' + productTypeText;
                            illustrationEditPage += '&CF'+productTypeFieldId +'_lkid=' + result[productTypeNameFieldId];

                            // Return URL
                            illustrationEditPage += '&saveURL=%2F' + result.Id;
                            illustrationEditPage += '&retURL=%2F' + result.Id;

                            if ($scope.isSF1)
                                sforce.one.navigateToURL(illustrationEditPage);
                            else {

                                if (sforce.console.isInConsole()) {



                                    // // need to get focused PrimaryTabId first
                                    // sforce.console.getFocusedPrimaryTabId(
                                    //     function(tabInfo) {
                                    //     // console.log('launch case / ' + url);
                                    //     sforce.console.openSubtab(tabInfo.id, illustrationEditPage, true, result.Name, null);
                                    //     });
                                    sforce.console.getEnclosingTabId( function (enclosingTabInfo) {

                                        var enclosingTabId = enclosingTabInfo.id;
                                        
                                        sforce.console.getEnclosingPrimaryTabId(function (primaryTabInfo) {
                                            sforce.console.openSubtab(primaryTabInfo.id, illustrationEditPage, true, result.Name, enclosingTabId);
                                        });

                                    });
                                
                                } else {   
                                    window.parent.location = illustrationEditPage;
                                }

                            }

                            // End of Illustration Section

                        } else {

                            if ($scope.isSF1)
                                sforce.one.navigateToSObject(result.Id);
                            else{

                                 if (sforce.console.isInConsole()) {
                                  
                                   sforce.console.getEnclosingTabId( function (enclosingTabInfo) {

                                        var enclosingTabId = enclosingTabInfo.id;
                                        
                                        sforce.console.getEnclosingPrimaryTabId(function (primaryTabInfo) {
                                            sforce.console.openSubtab(primaryTabInfo.id, '/' + result.Id, true, result.Name, enclosingTabId);
                                        });

                                    });



                                } else {   
                                    //window.parent.location = illustrationEditPage;
                                    window.parent.location = '/' + result.Id;
                                }
                                
                            }
                        }
                    // end of SAVE only function

                }
                else {
                    var toolName = '';
                    var newWindow = false;
                    if ($scope.casePhase.toLowerCase() === 'application') {
                        toolName = result[caseToolFieldName];
                        for (var i = 0; i < $scope.tools.length; i++) {
                            if ($scope.tools[i].name === toolName) {
                                newWindow = $scope.tools[i].openNewWindow;
                                break;
                            }
                        }

                    }
                    else if ($scope.casePhase.toLowerCase() === 'illustration') {
                        toolName = result[illuToolFieldName];
                        for (var i = 0; i < $scope.tools.length; i++) {
                            if ($scope.tools[i].name === toolName) {
                                newWindow = $scope.tools[i].openNewWindow;
                                break;
                            }
                        }
                    }
                    else if ($scope.casePhase.toLowerCase() === 'needs analysis') {
                        toolName = result[needsToolFieldName];
                        for (var i = 0; i < $scope.tools.length; i++) {
                            if ($scope.tools[i].name === toolName) {
                                newWindow = $scope.tools[i].openNewWindow;
                                break;
                            }
                        }
                    }                    

                    var url = applicationDispatcherPageURL;

                    if (url.indexOf('?') == -1)
                        url = url + '?sc=1&id=' + result.Id + '&entity=InsuranceCase&tool=' + toolName + '&phase=' + $scope.casePhase.toLowerCase();
                    else    // sforce one added ?isdtp=1 to the url
                        url = url + '&sc=1&id=' + result.Id + '&entity=InsuranceCase&tool=' + toolName + '&phase=' + $scope.casePhase.toLowerCase();
                    if (newWindow) {
                        var tool = null;
                        for (var i = 0; i < $scope.tools.length; i++) {
                            if ($scope.tools[i].name === toolName) {
                                tool = $scope.tools[i];
                                break;
                            }
                        }
                        var win = null;
                        var specs = 'resizable=yes,scrollbars=yes';

                        if (tool != null) {
                            if (typeof(tool.width) !== 'undefined' && tool.width != null) specs = specs + ',width=' + tool.width;
                            else specs = specs + ',width=600';
                            if (typeof(tool.height) !== 'undefined' && tool.height != null) specs = specs + ',height=' + tool.height;
                        }
                        // if( (typeof sforce != 'undefined') && (sforce != null) ) {
                        if ($scope.isSF1) {

                            // check if ipad or native app on ipad
                            if (navigator.userAgent.indexOf('Salesforce') != -1)
                                sforce.one.navigateToURL(url);
                            else {
                                if (specs == '') spec = 'fullscreen=yes';
                                // comment out open in new window
                                win = window.open(url, toolName, specs);
                                sforce.one.navigateToSObject(result.Id);
                            }
                       } else {

                            if (sforce.console.isInConsole()) {
                           

                                 sforce.console.getEnclosingTabId( function (enclosingTabInfo) {

                                        var enclosingTabId = enclosingTabInfo.id;
                                        
                                        sforce.console.getEnclosingPrimaryTabId(function (primaryTabInfo) {
                                            sforce.console.openSubtab(primaryTabInfo.id, url, true, 'New ' + toolName, enclosingTabId);
                                        });

                                    });



                                
                            } else {  
                                //win = window.open(url, toolName, specs);
                                win = window.open(url, '', specs);//IE does not support middle argument.
                                window.parent.location = '/' + result.Id; // Redirect to case window
                            }

                       }
                      if (win != null) win.focus();
                    } else {
                        // open in same window
                        if ($scope.isSF1) {
                             sforce.one.navigateToURL(url);
                        } else {

                             if (sforce.console.isInConsole()) {
                               

                                 sforce.console.getEnclosingTabId( function (enclosingTabInfo) {

                                        var enclosingTabId = enclosingTabInfo.id;
                                        
                                        sforce.console.getEnclosingPrimaryTabId(function (primaryTabInfo) {
                                            sforce.console.openSubtab(primaryTabInfo.id, url, true, result.Name, enclosingTabId);
                                        });

                                    });


                             
                            } else {                    
                                window.parent.location = url;
                            }

                        }
                    }
                }
            } else if (event.type === 'exception') {
                 // event.where, event.message
                document.getElementById('errDiv_ep').style.display = 'flex';
                var newDiv = document.createElement('div');
                //newDiv.innerHTML = caseErrorWhenClientReadOnly;
		    	newDiv.innerHTML = event.message; 
                document.getElementById('errDiv_ep').appendChild(newDiv);
            } else {
                // event.message
                document.getElementById('errDiv_ep').style.display = 'flex';
                var newDiv = document.createElement('div');
                newDiv.innerHTML = caseErrorWhenClientReadOnly;
                document.getElementById('errDiv_ep').appendChild(newDiv);
            }
        },
        {escape: true}
        );
    };

    //Call the Apex Controller function to check Compatibility
    this.checkCompatibilityAndLaunchTool = function (screenWidth, screenHeight, $scope) {
        var deferred = $q.defer();
        //console.log(navigator.userAgent);
        //console.log($scope.selectedTool);
        Visualforce.remoting.Manager.invokeAction(
            checkCompatibilityFunction,
            navigator.userAgent,
            screenWidth+'x'+screenHeight,
            $scope.selectedTool,
            function(result, event) {
            //console.log(result);
            $rootScope.$apply(function() {
                    if (event.status) {
                        if (result[0] == 'y') {
                            //console.log('compatible OS and resolution.');
                            $scope.save(true);
                        } else if (result[0] == 'n'){
                            $scope.promptType = 'OK';
                            $scope.promptStyle = 'Warn';
                            $scope.promptMessage = $sce.trustAsHtml(result[3]);

                            //console.log('incompatible OS.');
                            $scope.showPrompt = true;
                            $scope.promptHeaderStyle = 'slds-theme--error';
                            $scope.promptOS = true;

                        }else if(result[0] == 'p') {
                            $scope.promptType = 'OK';
                            $scope.promptStyle = 'Warn';
                            $scope.promptMessage = $sce.trustAsHtml(result[3]);
                            //console.log('incompatible resolution.');
                            $scope.showPrompt = true;
                            $scope.promptHeaderStyle = 'slds-theme--warning';
                        }
                        deferred.resolve(result);
                    } else {
                        deferred.reject(event);
                    }                           
                });
            });
    };


}]);

app.controller('LaunchCaseController', ['$scope', '$compile', 'AppService', '$window', '$location', function($scope, $compile, AppService, $window, $location) {
    $scope.showPrompt = false;

    $scope.closePrompt = function() {
        $scope.showPrompt = false;
     };

    $scope.continuePrompt = function() {
        //console.log('click continue');
        $scope.save(true);

    };

    //return to the previous page when user click Cancel
    $scope.cancel = function() {
        var qryStr = window.location.search.substring(1);
        var returnUrl = '', i, l, temp;
        var queries = qryStr.split('&');
        for (i = 0, l = queries.length; i < l; i++) {
                    temp = queries[i].split('=');
                    if (temp[0] === 'retURL') {
                        returnUrl = decodeURIComponent(temp[1]);
                        break;
                    }
        }
        
        if (sforce.console.isInConsole()) {
            // we will simply close the subtab
            sforce.console.getEnclosingTabId( function (tabInfo) {
                sforce.console.closeTab(tabInfo.id);
            });

            return false;
        }

        if (returnUrl !== '') {
           if($scope.isSF1) {
               sforce.one.navigateToURL(returnUrl);
           } else {

                // close tab
                // need to get focused PrimaryTabId first
                // sforce.console.getFocusedPrimaryTabId(
                //         function(result) {
                //             // console.log('return' + returnUrl);
                //             sforce.console.openPrimaryTab(result.id, returnUrl, true, '');
                //         });
                // } else {
                //     window.parent.location = returnUrl;
                // }

                window.parent.location = returnUrl;
           }
        }
        else if (caseId !== '') {
           if($scope.isSF1) {
             sforce.one.navigateToSObject(caseId);
           } else {

                // if (sforce.console.isInConsole()) {
                //     // need to get focused PrimaryTabId first
                //     sforce.console.getFocusedPrimaryTabId(
                //         function(result) {
                //             // console.log('return caseId ' + caseId);
                //             sforce.console.openPrimaryTab(result.id, '/' + caseId, true, $scope.caseNameText);
                //         });
                // } else {                    
                //     window.parent.location = '/'+ caseId; // Redirect to case window
                // }

                window.parent.location = '/'+ caseId; // Redirect to case window

           }
        }
        else if (personAccountId !== '') {
           if($scope.isSF1) {
              sforce.one.navigateToSObject(personAccountId); // Redirect to case window
           } else {

                // if (sforce.console.isInConsole()) {
                //     // need to get focused PrimaryTabId first
                //     sforce.console.getFocusedPrimaryTabId(
                //         function(result) {
                //             // console.log('return personAccountId ' + personAccountId);
                //             sforce.console.openPrimaryTab(result.id, '/' + personAccountId, true, primaryInsuredName);
                //         });
                // } else {                    
            
                //     window.parent.location = '/' + personAccountId; // Redirect to case window
                // }

                window.parent.location = '/' + personAccountId; // Redirect to case window

           }
        }
        else {
            if($scope.isSF1) {
                sforce.one.navigateToURL(insuranceCaseRecentItemViewURL);
            } else {

                // if (sforce.console.isInConsole()) {
                //     // need to get focused PrimaryTabId first
                //     sforce.console.getFocusedPrimaryTabId(
                //         function(result) {
                //             // console.log('return / ' + personAccountId);
                //             sforce.console.openPrimaryTab(result.id, '/', true, '');
                //         });
                // } else {                    
                //     window.parent.location = '/';
                // }

                window.parent.location = '/';
                
            }
        }
        return false;
    };

    //Validate the Required fields before user click Save or Start button
    $scope.validate = function() {

        var hasError = false;
        var requiredMsg = 'All fields are required!';

        // Check required field
        if (caseId === '') {
            // new case
            if(primaryInsuredId === '') {
                if (document.getElementById(insuredLookupValueId).value.substring(0, 3) === '000') {
                    hasError = true;
                }
            }

        }

        if (document.getElementById(productTypeLookupValueId).value.substring(0, 3) === '000' || document.getElementById(productTypeLookupId).value == '') {
            hasError = true;
        } else if (document.getElementById('caseNameInput').value === '') {
            hasError = true;
        }

        /*else if ($scope.casePhase != 'Needs Analysis' && $scope.casePhase != 'Illustration' && $scope.casePhase != 'Application') {
            hasError = true;
        } else if ($scope.selectedTool == '') {
            hasError = true;
        }*/


        if (hasError) {
            document.getElementById('errDiv_ep').style.display = 'flex';
            var newDiv = document.createElement('div');
            newDiv.innerHTML = requiredMsg;
            document.getElementById('errDiv_ep').appendChild(newDiv);
        }
        else {
            document.getElementById('errDiv_ep').style.display = 'none';
            document.getElementById('errDiv_ep').innerHTML = '';
        }

        return hasError;
    };

    //Upsert the Insurance Case after user click Save button, user will be redirect to Edit Illustration page or Case detail page
    $scope.save = function(launchTool) {

        //reset the selected tool
        if(manipulateToolName == 'CLEAR_TOOL') {
            $scope.selectedTool = '';
        } else if(manipulateToolName == 'SET_TOOL') {
            $scope.selectedTool = uniqueToolName;
        }

        //first remove the error msg if exists
        var errorDiv = document.getElementById('errDiv_ep');

        if(typeof errorDiv.childNodes[2]  != 'undefined') {
            errorDiv.removeChild(errorDiv.childNodes[2]);
        }

        if ($scope.validate()) return false;
        var enId = '';
        var enName = '';

        if (caseId == '') {
            if(!primaryInsuredId) {
                enId = document.getElementById(insuredLookupValueId).value;
            } else {
                enId = primaryInsuredId;
            }
            enName = 'Contact';
        } else {
            enId = caseId;
            enName = 'InsuranceCase';
        }

        var productTypeId = document.getElementById(productTypeLookupValueId).value;
        var caseName = document.getElementById('caseNameInput').value;
        var lobId = $scope.productTypesMap[productTypeId];

        var tool = $scope.selectedTool;
        var thePhase = '';

        if($scope.casePhase) {
            thePhase= $scope.casePhase.toLowerCase();
        }

        var args = [
            thePhase,
            enName,
            enId,
            caseName,
            lobId,
            productTypeId,
            tool
        ];

        //console.log(args);

        var remoteFunc;

        if (caseId !== '') {
            remoteFunc = updateCaseRemoteFunction;
        } else {
            remoteFunc = createCaseRemoteFunction;
        }

        //Remember the Id of the Most recent product type
        localStorage.setItem("LaunchInsuranceCaseTool_ProductTypeId", productTypeId);
        //call the remote action here
        AppService.upsertInsuranceCaseRemoteFunction(remoteFunc, args, launchTool, $scope);

        return false; // no postback from the button click*/
    };

    //Call the ApplicationDispatcher page to load iGO after user click Start button
    $scope.saveAndLaunch = function() {

        // Reset the error messages
        document.getElementById('errDiv_ep').innerHTML = '';

        if(manipulateToolName == 'CLEAR_TOOL') {
            $scope.selectedTool = '';
        } else if(manipulateToolName == 'SET_TOOL') {
            $scope.selectedTool = uniqueToolName;
        }

        if($scope.selectedTool != '') {
            // Check for OS version and resolution compatibility for the selected tool
            var scale = window.devicePixelRatio || window.screen.deviceXDPI / window.screen.logicalXDPI;
            var screenWidth = screen.width;
            var screenHeight = screen.height;

            // Add check for SF1
            if (scale && !$scope.isSF1 && navigator.userAgent.indexOf('iPad') != -1) {
                screenWidth = screenWidth * (1/scale);
                screenHeight = screenHeight * (1/scale);
            }

            //call the remote action here
            AppService.checkCompatibilityAndLaunchTool(screenWidth, screenHeight, $scope);
        }

        return false; // no postback from the button click
    }

    //The Helper function to check if the page is on SF1
    $scope.isSF1 = function() {
         if ( (typeof sforce != 'undefined') && (sforce != null) && (sforce.one) )                        
            return true;
         else
            return false;
    };


    //The helper function to decode the data from Apex Controller
    $scope.htmlDecode = function (input) {
        var e = document.createElement('div');
        e.innerHTML = input;
        return e.childNodes.length === 0 ? "" : e.innerHTML;
    };


    //Enable the Start button after user select one of the application tool
    $scope.clickTool = function (toolName) {
        manipulateToolName = 'DEFAULT';
        $scope.selectedTool = toolName;
        var startAppButton = document.getElementById('startAppBtn');
        startAppButton.disabled = false;
    };

    //Parse the LOB, ProductType, ToolCfg from Apex Controller
    $scope.lobs = JSON.parse($scope.htmlDecode(lobsStr));
    var productTypesArray = JSON.parse($scope.htmlDecode(productTypesStr));
    var productMap = {};
    for (i = 0; i < productTypesArray.length; i++) {
        productMap[productTypesArray[i].Id.substring(0,15)] =  productTypesArray[i].lobId;
    }
    $scope.productTypesMap = productMap;
    productTypesMapJSON = $scope.productTypesMap;
    $scope.toolCfgs = JSON.parse($scope.htmlDecode(toolCfgsStr));
    toolsCfgJSON = $scope.toolCfgs;
    $scope.tools = JSON.parse($scope.htmlDecode(toolsStr));
    $scope.isSF1 = $scope.isSF1();    
    $scope.selectedTool = '';

    //auto populate the ProductType Id here
    var recentProductTypeId = localStorage.getItem("LaunchInsuranceCaseTool_ProductTypeId");
    if(!(typeof recentProductTypeId === 'undefined')) {
        for(i = 0; i < productTypesArray.length; i++) {
            if(productTypesArray[i].Id.substring(0,15) == recentProductTypeId) {
                if(document.getElementById(productTypeLookupId).value == '') {
                    document.getElementById(productTypeLookupValueId).value = recentProductTypeId;
                    document.getElementById(productTypeLookupNameId).value = productTypesArray[i].name;
                    document.getElementById(productTypeLookupId).value = productTypesArray[i].name;
                }
            }
        }
    }

    $scope.caseNameText = defaultCaseName;

    $scope.showPhase = true;
    $scope.showTools = true;

    if(passedInPhase == 'needs analysis' || passedInPhase == 'application' || passedInPhase == 'illustration') {
        $scope.showPhase = false;
        $scope.casePhase = passedInPhase;
        $scope.lineOfBusiId = $scope.productTypesMap[document.getElementById(productTypeLookupValueId).value];
        $scope.prodTypeId = document.getElementById(productTypeLookupValueId).value;
        var toolsCount = 0;
        var toolIndex = 0;
        for(i = 0; i < $scope.toolCfgs.length; i++) {
            if($scope.toolCfgs[i].phase == $scope.casePhase && (($scope.toolCfgs[i].lobId == $scope.lineOfBusiId && $scope.toolCfgs[i].productTypeId == null) ||
                ($scope.toolCfgs[i].productTypeId != null && $scope.toolCfgs[i].productTypeId.indexOf($scope.prodTypeId) > -1))) {
                //alert($scope.toolCfgs[i].productTypeId  +'*'+ $scope.toolCfgs[i].lobId +'_' + document.getElementById(productTypeLookupValueId).value +'*'+ $scope.lineOfBusiId);
                toolsCount ++;
                toolIndex = i;
            }
        }

        if(toolsCount <= 1) {
            $scope.showTools = false;
            if(toolsCount == 1) {
                manipulateToolName = 'DEFAULT';
                $scope.selectedTool = $scope.toolCfgs[toolIndex].tool;
                var startAppButton = document.getElementById('startAppBtn');
                if($scope.toolCfgs[toolIndex].lobId == $scope.lineOfBusiId) {
                    startAppButton.disabled = false;
                }
            }
        }

    }

}]).directive("ngPortlet", function ($compile) {
    return {
        template: "<label id='tools_label' name='tools_label' ng-show='showTools && lineOfBusiId ' class='slds-form-element__label slds-form-element__label--top'>How would you like to start your {{casePhase}}?</label>"+
                  "<div name='tools_div' ng-show='showTools && toolCfg.phase === casePhase.toLowerCase() && ((toolCfg.lobId == lineOfBusiId && toolCfg.productTypeId == null) || ( toolCfg.productTypeId != null && toolCfg.productTypeId.indexOf(prodTypeId) > -1)) ' class='slds-form-element__control tools_div' ng-repeat='toolCfg in toolCfgs | orderBy:&quot;-displayOrder&quot;' >" +
                        "<label class='slds-radio'>" +
                            "<input type='radio' name='tools_rad'  ng-model='selectedTool' ng-value='toolCfg.tool' ng-click='clickTool(toolCfg.tool)'/>" +
                            "<span class='slds-radio--faux'></span>" +
                            "<span class='slds-form-element__label'> {{toolCfg.toolDisplayName}}</span>" +
                         "</label>"+
                  "</div>",
        restrict: 'E',
        link: function ($scope, elm) {
            $scope.add = function(){
               $scope.lineOfBusiId = $scope.productTypesMap[document.getElementById('j_id0:theForm:productTypeField:wr:lookup_lkid').value];
               $scope.prodTypeId = document.getElementById('j_id0:theForm:productTypeField:wr:lookup_lkid').value;
               var needsToolsEle = document.getElementById('phaseTools');
               if(!(typeof needsToolsEle === 'undefined')) needsToolsEle.className = 'slds-form-element';

               //if there is only one tool, then do not show the tools
                var matchCount = 0;
                var matchedToolName ='';
                var matchedIndex = '';
                for(i = 0; i < $scope.toolCfgs.length; i++) {
                    if($scope.toolCfgs[i].phase == $scope.casePhase.toLowerCase() && (($scope.toolCfgs[i].lobId == $scope.lineOfBusiId && $scope.toolCfgs[i].productTypeId == null) ||
                        ($scope.toolCfgs[i].productTypeId != null && $scope.toolCfgs[i].productTypeId.indexOf($scope.prodTypeId) > -1))) {
                        matchCount ++;
                        matchedIndex = i;
                    }
                }

                var startAppButton = document.getElementById('startAppBtn');
                if(matchCount == 1) {
                    manipulateToolName = 'DEFAULT';
                    $scope.selectedTool =  $scope.toolCfgs[matchedIndex].tool;
                    startAppButton.disabled = false;
                    $scope.showTools = false;
                } else {
                    manipulateToolName = 'DEFAULT';
                    $scope.selectedTool = '';
                    startAppButton.disabled = true;
                    if(matchCount == 0) {
                        $scope.showTools = false;
                    } else {
                        $scope.showTools = true;
                    }
                }

            }
        }
    };
});
