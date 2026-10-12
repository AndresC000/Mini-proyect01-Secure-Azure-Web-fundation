param location string = 'eastus'
param  keyVaultName string
param tenantId string = '11111111-2222-3333-4444-555555555555'

resource keyVault 'Microsoft.KeyVault/vaults@2026-02-01' = {
  name: keyVaultName
  location: location 
  properties: {
    sku: {
      name: 'standard'
      family: 'A'
    }
    tenantId: tenantId
  }

}
