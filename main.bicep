module network 'modules/network/main.bicep' = {
   name: 'network'
}

module compute 'modules/compute/main.bicep' = {
   name: 'compute'
}

module storage 'modules/storage/main.bicep' = {
   name: 'storage'
}

module keyvault 'modules/keyvault/main.bicep' = {
   name: 'keyVault'
}

module monitor  'modules/monitor/main.bicep' = {
   name:'monitor'
}


