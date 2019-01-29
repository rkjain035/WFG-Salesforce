//(function () {

// Define AgentOne Homepage app
var app = angular.module('homepage', [
]);

//add service for redirect
app.service('RedirectService', function(){
    this.navigateToRecord = function(recordId) {
        if(typeof sforce != 'undefined') {
            sforce.one.navigateToSObject(recordId);
        } else {
            window.parent.location = '/'+ recordId;
        }
    };

    this.navigateToView = function(prefix,viewId,objectName) {
       if(typeof sforce != 'undefined') {
           sforce.one.navigateToList(viewId, 'List View', objectName);
       } else {
           window.parent.location = '/'+ prefix +'?fcf='+ viewId.substring(0, 15);
       }
    };

    this.navigateToUrl = function(win, fullUrl, newWindow) {
       if(typeof sforce != 'undefined') {
           sforce.one.navigateToURL(fullUrl);
       } else {
           if(newWindow) {
             win.open(fullUrl);
           } else {
             window.parent.location = fullUrl;
           }
       }
    };

    this.createRecord = function (objectName, objectPrefix, returnUrl) {
       if(typeof sforce != 'undefined') {
           sforce.one.createRecord(objectName);
       } else {
           window.parent.location = '/' + objectPrefix +  '/e?retURL=' + returnUrl;
       }
    };
});

// Define default Homepage controller
app.controller('HomepageController', ['$scope', function($scope) {
    // Loading test data
//    this.counterCards = counterCards_testdata;
    this.caseSummary = {}; //caseSummary_testdata;
}]);




/******************************************************************************
 * Recent Items (Controller + Service)
 ******************************************************************************/
app.controller('RecentItemsCtrl', ['$window', '$scope', 'fnGetRecentItems', 'RedirectService', function($window, $scope, fnGetRecentItems, RedirectService) {
    // Controller
    $scope.recentItems = [];
    if (fnGetRecentItems != null) {
        fnGetRecentItems().
            then(function(data) {
                // success
                for (var i = 0; i < data.length; i++) {
                    var ri = {};
                    ri.id = data[i].id;
                    ri.name = data[i].name;
                    ri.firstName = data[i].firstName;
                    ri.lastName = data[i].lastName;
                    ri.type = data[i].type;
                    ri.lastViewed = data[i].lastViewed;
                    ri.url = '/#';
                    ri.timepassed = data[i].lastViewed;
                    ri.recordTypeLabel = data[i].recordTypeLabel;
                    $scope.recentItems.push(ri);
                }

                $scope.recentItemsAreLoaded = true;

            }, function(reason) {
                // error
                // alert(' Error on get Recent Items: ' +  reason);
                $scope.recentItemsAreLoaded = true;
            });
    };

    $scope.goToURL = function (url) {
        RedirectService.navigateToUrl($window, url, false);
    };

    $scope.goToRecord = function (recordId) {
        RedirectService.navigateToRecord(recordId);
    };
}]).factory('fnGetRecentItems', ['$window', '$q', '$rootScope', function($window, $q, $rootScope) {
    if (angular.isUndefined($window.fnGetRecentItems)) {
        alert('Visualforce Remoting method "fnGetRecentItems" is not defined.');
        return null;
    } else
        return function() {
            var deferred = $q.defer();
            Visualforce.remoting.Manager.invokeAction(
                $window.fnGetRecentItems,
                function(result, event) {
                    $rootScope.$apply(function() {
                        if (event.status) {
                            deferred.resolve(result);
                        } else {
                            deferred.reject(event);
                        }
                    });
                    //alert(' Error on fnGetRecentItems ' + result);
                },
                { buffer: false, escape: true, timeout: 30000 }
            );

            return deferred.promise;
        }
}]).filter('fromNow', function() {
    return function(dateString) {
        return aone_moment(dateString).fromNow()
    };
});


/******************************************************************************
 * Number Cards (Controller + Service)
 ******************************************************************************/
app.controller('NumberCardsCtrl', ['$scope', '$filter', 'fnGetNumberCards', 'RedirectService', function($scope, $filter, fnGetNumberCards, RedirectService) {
    // Controller
    $scope.numberCards = [];
    if (fnGetNumberCards != null) {

        // need to call it x number of times for each tile
        console.log('PYAN tiles: ' + numberOfTiles);

        for (var t=0; t<numberOfTiles; t++) {
            // make a call to fnGetSingleCard for each tile and add back?
            fnGetNumberCards(t, $filter).
                then (function(data) {

                    console.log(data);

                    var card = {};
                    // $scope.numberCards.push(data);
                    $scope.numberCards[parseFloat(data.displayOrder)] = data;
                    
                    data.formattedCount = data.count;

                    if (data.aggregateResultFormat != null) {
                        if (data.aggregateResultFormat.toLowerCase() == 'currency')
                            data.formattedCount =  $filter('currency')(data.count);
                    }

                    if (t==numberOfTiles)
                         $scope.numberCardsAreLoaded = true;
                }, function(reason) {
                    // error
                    $scope.numberCardsAreLoaded = true;
                    // alert(' Error in number cards controller' + reason);
                });
        }
        /*
        fnGetNumberCards(t, $filter).
            then(function(data) {

                // success
                for (var i = 0; i < data.length; i++) {
                    var card = {};
                    $scope.numberCards.push(data[i]);
                    // format the result

                    data[i].formattedCount = data[i].count;

                    if (data[i].aggregateResultFormat != null) {
                        if (data[i].aggregateResultFormat.toLowerCase() == 'currency')
                            data[i].formattedCount =  $filter('currency')(data[i].count);
                    }

                    $scope.numberCardsAreLoaded = true;
                    console.log(data[i]);

                }
            }, function(reason) {
                // error
                $scope.numberCardsAreLoaded = true;
                // alert(' Error in number cards controller' + reason);
            });

            */

    }

    $scope.goToListView = function (prefix,viewId,objectName) {
        RedirectService.navigateToView(prefix,viewId,objectName);
    };
}]).factory('fnGetNumberCards', ['$window', '$q', '$rootScope', function($window, $q, $rootScope) {
    if (angular.isUndefined($window.fnGetTileInfo)) {
        alert('Visualforce Remoting method "fnGetNumberCards" is not defined.');
        return null;
    } else
        return function(tileIndex) {
            var deferred = $q.defer();
            Visualforce.remoting.Manager.invokeAction(
                $window.fnGetTileInfo,
                tileIndex,
                function(result, event) {
                    $rootScope.$apply(function() {
                        if (event.status) {
                            deferred.resolve(result);
                        } else {
                            deferred.reject(event);
                        }
                    });
                    //alert(' error in fnGetnumbercards' + result);
                },
                { buffer: false, escape: true, timeout: 30000 }
            );

            return deferred.promise;
        }
}]).filter('toId15', function() {
    return function(id) {
        return id.substring(0, 15);
    }
});


/******************************************************************************
 * Alerts (Controller + Service)
 ******************************************************************************/
app.controller('AlertListPanelCtrl', ['$window', '$scope', '$location', 'fnGetAlertListPanel', 'fnDismissAlert', 'fnToggleAlertPriority', 'RedirectService', function($window, $scope, $location, fnGetAlertListPanel, fnDismissAlert, fnToggleAlertPriority, RedirectService) {
    var alertViewCookie = '';
    var name = 'currentAlertView' + "=";
    var ca = $window.document.cookie.split(';');
    for(var i=0; i<ca.length; i++) {
        var c = ca[i];
        while (c.charAt(0)==' ') c = c.substring(1);
        if (c.indexOf(name) == 0) alertViewCookie = c.substring(name.length,c.length);
    }

    // Controller
    $scope.maxNumberOfAlerts = 6;
    $scope.currentViewId = alertViewCookie;


    $scope.currentViewName = ''; // Id of current list view
    $scope.listViews = [];
    $scope.alerts = [];
    $scope.getShortId = function (id) {
        return id.subString(0, 15);
    };


    //
    $scope.execAlertAction = function(index) {

        var namespace = $scope.alerts[index].namespace;
        // alert(namespace);
       // var root = $window.location.protocol + '//' + $window.location.host;
        // need to get namespace for managed orgs
        var actionUrl =   "/apex/AlertAction?id=" + $scope.alerts[index].alertId + "&caseId=" + $scope.alerts[index].insuranceCaseId ;


        if (namespace && name.length > 0 && namespace !== '') {
            var actionPageString = namespace + '__AlertAction';
             actionUrl =   "/apex/" + actionPageString + "?id=" + $scope.alerts[index].alertId + "&caseId=" + $scope.alerts[index].insuranceCaseId ;
         }

        // var fullUrl = root + actionUrl;

        //var actionUrl = alertUrl + '?id=' + $scope.alerts[index].alertId + "&caseId=" + $scope.alerts[index].insuranceCaseId ;
        // can't seem to reset this URL
        // it always appends to the current path using $location.path - it is using relative URL instead of full Url

        //$location.path(actionUrl);

        RedirectService.navigateToUrl($window, actionUrl, true);

    };

    $scope.goToRecord = function (recordId) {
        RedirectService.navigateToRecord(recordId);
    };

    $scope.goToListView = function (prefix,viewId,objectName) {
        RedirectService.navigateToView(prefix,viewId,objectName);
    };

    $scope.goToURL = function (url) {
        RedirectService.navigateToUrl($window, url, false);
    };

    //
    $scope.switchAlertView = function(index) {
        var lv = $scope.listViews[index];
        fnGetAlertListPanel(lv.id, $scope.maxNumberOfAlerts).
            then(function(data) {
                // success
                $scope.listViews = data.viewList;
                $scope.alerts = data.alertList;
                $scope.currentViewId = data.currentViewId;
                $scope.currentViewName = data.currentViewName;

                var d = new Date();
                d.setTime(d.getTime() + (24*60*60*1000));
                var expires = "expires=" + d.toUTCString();
                $window.document.cookie = 'currentAlertView' + "=" + data.currentViewId + "; " + expires;

                console.log(data);
            }, function(reason) {
                // error
                //alert(reason);
            });
    };
    //
    $scope.dismissAlert = function(index) {
        var al = $scope.alerts[index];
        fnDismissAlert(al.alertId).
            then(function(success) {
                // alert('success can remove alert from list');
                $scope.alerts.splice(index, 1);

            }, function(reason) {
            });
    };

    $scope.toggleAlertPriority = function(index) {
        var al = $scope.alerts[index];
        fnToggleAlertPriority(al.alertId).
            then(function(success) {
                al.alertPriority = success;
            }, function(reason) {
            });
    };

    //
    if (fnGetAlertListPanel != null) {
        fnGetAlertListPanel($scope.currentViewId, $scope.maxNumberOfAlerts).
            then(function(data) {
                // success
                $scope.listViews = data.viewList;
                $scope.alerts = data.alertList;
                $scope.currentViewId = data.currentViewId;
                $scope.currentViewName = data.currentViewName;
                $scope.alertsAreLoaded = true;

                console.log(data);
            }, function(reason) {
                $scope.alertsAreLoaded = true;

                //alert('Error in fnGetAlertListPanel: ' + reason);
            });
    }

}]).factory('fnGetAlertListPanel', ['$window', '$q', '$rootScope', function($window, $q, $rootScope) {
    if (angular.isUndefined($window.fnGetAlertListPanel)) {
        alert('Visualforce Remoting method "fnGetAlertListPanel" is not defined.');
        return null;
    } else
        return function(viewId, maxRecords) {
            var deferred = $q.defer();
            Visualforce.remoting.Manager.invokeAction(
                $window.fnGetAlertListPanel,
                viewId,
                maxRecords,
                function(result, event) {
                    $rootScope.$apply(function() {
                        if (event.status) {
                            deferred.resolve(result);
                        } else {
                            deferred.reject(event);
                        }
                    });
                    //alert(result);
                },
                { buffer: false, escape: true, timeout: 30000 }
            );

            return deferred.promise;
        }
}]).factory('fnDismissAlert', ['$window', '$q', '$rootScope', function($window, $q, $rootScope) {
    if (angular.isUndefined($window.fnDismissAlert)) {
        alert('Visualforce Remoting method "fnDismissAlert" is not defined.');
        return null;
    } else {
        return function(alertId) {
            var deferred = $q.defer();
            Visualforce.remoting.Manager.invokeAction(
                $window.fnDismissAlert,
                alertId,
                function(result, event) {
                    $rootScope.$apply(function() {
                        if (event.status) {
                            deferred.resolve(result);
                        } else {
                            deferred.reject(event);
                        }
                    });
                    //alert(result);
                },
                { buffer: false, escape: true, timeout: 30000 }
            );

            return deferred.promise;
        }
    }
}]).factory('fnToggleAlertPriority', ['$window', '$q', '$rootScope', function($window, $q, $rootScope) {
    if (angular.isUndefined($window.fnToggleAlertPriority)) {
        alert('Visualforce Remoting method "fnToggleAlertPriority" is not defined.');
        return null;
    } else {
        return function(alertId) {
            var deferred = $q.defer();
            Visualforce.remoting.Manager.invokeAction(
                $window.fnToggleAlertPriority,
                alertId,
                function(result, event) {
                    $rootScope.$apply(function() {
                        if (event.status) {
                            deferred.resolve(result);
                        } else {
                            deferred.reject(event);
                        }
                    });
                },
                { buffer: false, escape: true, timeout: 30000 }
            );

            return deferred.promise;
        }
    }

}]).filter('fromNow', function() {
    return function(dateString) {
        return aone_moment(dateString).fromNow()
    };
}).filter('Id15', function() {
    return function(id) {
        return id.substring(0, 15);
    }
}).filter('toPhaseImage', function() {
    return function(phase) {
        if (phase === 'Needs Analysis') {
            return 'Phase-INNNN.png';
        }
        else if (phase === 'Illustration') {
            return 'Phase-CINNN.png';
        } else if (phase === 'Application') {
            return 'Phase-CCINN.png';
        } else if (phase === 'Underwriting') {
            return 'Phase-CCCIN.png';
        } else if (phase === 'Delivery') {
            return 'Phase-CCCCI.png';
        } else {
            return 'Phase-NNNNN.png';
        }
    }
}).filter('toPriorityImage', function() {
    return function(priority) {
        if (priority === 'Urgent') {
            return 'Alert_Urgent.png';
        } else {
            return 'Alert_NotUrgent.png';
        }
    }
}).filter('daysFromNow', function() {
    return function(day) {
        if(day <= 1) {
            return day + ' day ago';
        } else {
            return day + ' days ago';
        }
    }
});



/******************************************************************************
 * Tasks (Controller + Service)
 ******************************************************************************/
app.controller('TaskListPanelCtrl', ['$window', '$scope', 'fnGetTaskListPanel', 'fnCompleteTask', 'RedirectService',  function($window, $scope, fnGetTaskListPanel, fnCompleteTask, RedirectService) {
    // Controller
    $scope.maxNumberOfTasks = 6;
    $scope.currentViewId = ''; // Id of current list view
    $scope.currentViewName = ''; // Name of current list view
    $scope.listViews = [];
    $scope.tasks = [];

    //
    $scope.switchTaskView = function(index) {
        var lv = $scope.listViews[index];
        fnGetTaskListPanel(lv.id, $scope.maxNumberOfTasks).
            then(function(data) {
                // success
                $scope.listViews = data.viewList;
                $scope.tasks = data.taskList;
                $scope.currentViewId = data.currentViewId;
                $scope.currentViewName = data.currentViewName;

                console.log(data);
            }, function(reason) {
                // error
                //alert(reason);
            });
    };
    //
    $scope.completeTask = function(index) {
        var tk = $scope.tasks[index];
        fnCompleteTask(tk.taskId).
            then(function(success) {
//              alert('success');
                $scope.tasks.splice(index, 1);
            }, function(reason) {
            });
    }

    //
    if (fnGetTaskListPanel != null) {
        fnGetTaskListPanel($scope.currentViewId, $scope.maxNumberOfTasks).
            then(function(data) {
                // success
                $scope.listViews = data.viewList;
                $scope.tasks = data.taskList;
                $scope.currentViewId = data.currentViewId;
                $scope.currentViewName = data.currentViewName;
                $scope.tasksAreLoaded = true;

                console.log(data);
            }, function(reason) {
                $scope.tasksAreLoaded = true;
                // error
                //alert(reason);
            });
    }

    $scope.goToRecord = function (recordId) {
        RedirectService.navigateToRecord(recordId);
    };

    $scope.goToListView = function (prefix,viewId,objectName) {
        RedirectService.navigateToView(prefix,viewId,objectName);
    };

    $scope.goToURL = function (url) {
        RedirectService.navigateToUrl($window, url, false);
    };

    $scope.createNewRecord = function (objectName, objectPrefix, returnUrl) {
       RedirectService.createRecord(objectName, objectPrefix, returnUrl);
    };

}]).factory('fnGetTaskListPanel', ['$window', '$q', '$rootScope', function($window, $q, $rootScope) {
    if (angular.isUndefined($window.fnGetTaskListPanel)) {
        alert('Visualforce Remoting method "fnGetTaskListPanel" is not defined.');
        return null;
    } else
        return function(viewId, maxRecords) {
            var deferred = $q.defer();
            Visualforce.remoting.Manager.invokeAction(
                $window.fnGetTaskListPanel,
                viewId,
                maxRecords,
                function(result, event) {
                    $rootScope.$apply(function() {
                        if (event.status) {
                            deferred.resolve(result);
                        } else {
                            deferred.reject(event);
                        }
                    });
                    //alert(result);
                },
                { buffer: false, escape: true, timeout: 30000 }
            );

            return deferred.promise;
        }
}]).factory('fnCompleteTask', ['$window', '$q', '$rootScope', function($window, $q, $rootScope) {
    if (angular.isUndefined($window.fnCompleteTask)) {
        alert('Visualforce Remoting method "completeTask" is not defined.');
        return null;
    } else {
        return function(taskId) {
            var deferred = $q.defer();
            Visualforce.remoting.Manager.invokeAction(
                $window.fnCompleteTask,
                taskId,
                function(result, event) {
                    $rootScope.$apply(function() {
                        if (event.status) {
                            deferred.resolve(result);
                        } else {
                            deferred.reject(event);
                        }
                    });
                    //alert(result);
                },
                { buffer: false, escape: true, timeout: 30000 }
            );

            return deferred.promise;
        }
    }
}]).filter('fromNow', function() {
    return function(dateString) {
        return dateString;
//      return aone_moment(dateString).fromNow()
    };
}).filter('Id15', function() {
    return function(id) {
        return id.substring(0, 15);
    }
});

/******************************************************************************
 * Case Bar Chart (Controller + Service)
 ******************************************************************************/
app.controller('InsuranceCaseBarChartCtrl', ['$scope', 'fnReadCsBarChart', function($scope, fnReadCsBarChart) {
    // Controller
    $scope.chartData = {};
    if (fnReadCsBarChart != null) {
        fnReadCsBarChart().
            then(function(data) {
                $scope.chartData = data;
                $scope.chartIsLoaded = true;

                console.log($scope.chartData);
                // Draw chart
                var data = {
                    labels: [''],
                    datasets: [
                        {
                            label: 'Needs Analysis',
                            fillColor: data.needsanalysis.color,
                            data: [data.needsanalysis.value]
                        },
                        {
                            label: 'Illustration',
                            fillColor: data.illustration.color,
                            data: [data.illustration.value]
                        },
                        {
                            label: 'application',
                            fillColor: data.application.color,
                            data: [data.application.value]
                        },
                        {
                            label: data.underwriting.label,
                            fillColor: data.underwriting.color,
                            data: [data.underwriting.value]
                        },
                        {
                            label: data.delivery.value,
                            fillColor: data.delivery.color,
                            data: [data.delivery.value]
                        }
                    ]
                };

                var ctx = document.getElementById("myChart").getContext("2d");
                var myNewChart = new Chart(ctx).Bar(data);

            }, function(reason) {
                // error
                $scope.chartIsLoaded = true;
                console.log(reason);
                // alert(reason);
            });
    }
}]).factory('fnReadCsBarChart', ['$window', '$q', '$rootScope', function($window, $q, $rootScope) {
    if (angular.isUndefined($window.fnReadCsBarChart)) {
        alert('Visualforce Remoting method "fnReadCsBarChart" is not defined.');
        return null;
    } else
        return function() {
            var deferred = $q.defer();
            Visualforce.remoting.Manager.invokeAction(
                $window.fnReadCsBarChart,
                function(result, event) {
                    $rootScope.$apply(function() {
                        if (event.status) {
                            deferred.resolve(result);
                        } else {
                            deferred.reject(event);
                        }
                    });
                    //alert(result);
                },
                { buffer: false, escape: true, timeout: 30000 }
            );

            return deferred.promise;
        }
}]).filter('fromNow', function() {
    return function(dateString) {
        return aone_moment(dateString).fromNow()
    };
});

//})();
