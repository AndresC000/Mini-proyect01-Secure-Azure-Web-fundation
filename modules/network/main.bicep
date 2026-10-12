param location string = 'eastus'
param vnetName string = 'vnet-production'
param addressSpace string = '10.0.0.0/16'

param webSubnetName string = 'web-subnet'
param webSubnetPrefix string = '10.0.1.0/24'

param mgtSubnetName string = 'mgt-subnet'
param mgtSubnetPrefix string = '10.0.2.0/24'
param nsgName string = 'NSG-web'

resource vnet 'Microsoft.Network/virtualNetworks@2025-09-01' = {
     name: vnetName
      location: location   
      properties: {
        addressSpace: {
            addressPrefixes: [
                addressSpace             
    ]    
  }
        subnets: [
            {
                name: webSubnetName 
                properties: {
                     addressPrefix: webSubnetPrefix
                     networkSecurityGroup: {
                         id: nsg.id
                     }
                }
            }
            {name: mgtSubnetName 
             properties: {
                 addressPrefix: mgtSubnetPrefix   
    }
   }
  ]
 }     
}
       

resource nsg 'Microsoft.Network/networkSecurityGroups@2025-09-01' = {
     name: nsgName 
      location: location 
       properties: {
         securityRules: [
             {
                name: 'Allow-SSH'
                properties: {
                    access: 'Allow'
                    direction:  'Inbound'
                    priority:  100
                    protocol: 'Tcp'
                    sourceAddressPrefix: '*'
                    destinationAddressPrefix: webSubnetPrefix
                    sourcePortRange:'*'
                    destinationPortRange: '22'
                }
             }
             {
                name:'Allow-HTTP'
                properties: {
                    access: 'Allow'
                    direction: 'Inbound'
                    priority: 200
                    protocol: 'Tcp'
                    sourceAddressPrefix:'*'
                    destinationAddressPrefix: webSubnetPrefix
                    sourcePortRange:'*'
                    destinationPortRange: '80'
                }
            }
         ]
       }
}

output webSubnetName string= webSubnetName

