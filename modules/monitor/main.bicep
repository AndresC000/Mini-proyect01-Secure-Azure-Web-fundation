param location string= 'eastus'
param workspaceName string 

resource law 'Microsoft.OperationalInsights/workspaces@2026-03-01' = {
  name: workspaceName 
  location : location 
   properties: {
     sku: {
      name: 'PerGB2018'
     }
     retentionInDays: 30
   }
}


