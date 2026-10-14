param location string = 'eastus'

param vmName string = 'vm-web-01'
param adminUsername string = 'AzureUser'
param adminPassword string
param vmSize string = 'Standard_B1s'
param computerName string

param PublicIPName string = 'Pip-web-01'
param NicName string = 'Nic-web-01'
param subnetId string

resource  publicIPAddress 'Microsoft.Network/publicIPAddresses@2025-03-11' = {
  name: PublicIPName 
     location: location
      sku:{ 
          name: 'Standard'
      }
      properties: {
               publicIPAllocationMethod: 'Static'
      }
}

resource Nic 'Microsoft.Network/networkInterfaces@2025-09-01' = {
  name: NicName
  location: location 
  properties: {
     ipConfigurations: [
        {
          name: 'ipconfig1'
          properties: {
             subnet: {
               id: subnetId
             }

             publicIPAddress: {
               id: publicIPAddress.id
             }
          }
        }

     ]
  }
}

resource VM 'Microsoft.Compute/virtualMachines@2023-07-01' = {
   name: vmName
   location:location
   properties: {
    hardwareProfile: {
      vmSize: vmSize
    }
    networkProfile: {
       networkInterfaces: [
         {
           id: Nic.id
         }
       ]
    }
    osProfile: {
       adminUsername: adminUsername
       adminPassword: adminPassword 
       computerName: computerName
    }
    storageProfile: {
       imageReference: {
         offer: 'ubuntu-22.04-LTS'
         publisher: 'Canonical'
         sku: 'server'
         version: 'latest'
       }
    }

   }   
}
