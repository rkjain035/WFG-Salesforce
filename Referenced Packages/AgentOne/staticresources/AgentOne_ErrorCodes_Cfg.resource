[
   {
      "action":"retry",
      "enabled":true,
      "monitorClass":"SyncEngine",
      "processCode":"-1",
      "retryCount":"2",
      "description":"If the exit code is -1 then retry once."
   },
   {
      "action":"retry",
      "enabled":true,
      "monitorClass":"SyncEngine",
      "processCode":"<empty>",
      "parameter1":"5",
      "parameter2":"",
      "retryCount":"3",
      "description":"If the exit code is empty (most likely a limit error) and 5 mins has passed since start then retry twice."
   }
]