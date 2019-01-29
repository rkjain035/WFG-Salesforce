/*
This file is generated and isn't the actual source code for this
managed global class.
This read-only file shows the class's global constructors,
methods, variables, and properties.
To enable code to compile, all methods return null.
*/
global class HomepageController {
    global Boolean enableAlertActions {
        get;
    }
    global Boolean jsonIsValid {
        get;
    }
    global String quickStartApplicationPhase {
        get;
    }
    global String quickStartCaseNeedsPhase {
        get;
    }
    global String quickStartCaseSubTitle {
        get;
    }
    global String quickStartIllustrationPhase {
        get;
    }
    global Boolean showAlerts {
        get;
    }
    global Boolean showChart {
        get;
    }
    global Boolean showQuickStartCase {
        get;
    }
    global Boolean showRecentItems {
        get;
    }
    global Boolean showTasks {
        get;
    }
    global Integer tilesCount {
        get;
    }
    @RemoteAction
    global static Boolean completeTask(String taskId) {
        return null;
    }
    @RemoteAction
    global static Boolean dismissAlert(String alertId) {
        return null;
    }
    @RemoteAction
    global static AgentOne.HomepageController.AlertListPanel getAlertListPanel(String currentViewId, Integer maxRecords) {
        return null;
    }
    @RemoteAction
    global static List<AgentOne.HomepageController.NumberCard> getNumberCards(Integer maxCards) {
        return null;
    }
    @RemoteAction
    global static List<AgentOne.HomepageController.RecentlyViewedItem> getRecentItems() {
        return null;
    }
    @RemoteAction
    global static AgentOne.HomepageController.TaskListPanel getTaskListPanel(String currentViewId, Integer maxRecords) {
        return null;
    }
    @RemoteAction
    global static AgentOne.HomepageController.NumberCard getTileInfo(Integer tileIndex) {
        return null;
    }
    @RemoteAction
    global static AgentOne.HomepageController.InsuranceCaseChartData readInsuranceCaseChartData() {
        return null;
    }
    @RemoteAction
    global static String toggleAlertPriority(String alertId) {
        return null;
    }
global class AlertListPanel {
}
global class ChartDataItem {
}
global class InsuranceCaseChartData {
}
global class ListView {
}
global class NumberCard {
    global NumberCard() {

    }
}
global class RecentlyViewedItem {
    global RecentlyViewedItem(RecentlyViewed rv) {

    }
}
global class TaskInfo {
}
global class TaskListPanel {
}
global class homePageSettings {
}
}
