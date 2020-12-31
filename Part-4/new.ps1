function New-ResourceGroup {
    [cmdletbinding(SupportsShouldProcess = $true)]
    param (
        [parameter(mandatory)]
        [string]$location,

        [parameter(mandatory)]
        [string]$resourceGroupName
    )

    if ($pscmdlet.ShouldProcess('location')) {
        try {
            az group create --location $location `
                --name $resourceGroupName
        }
    
        catch {
            $pscmdlet.ThrowTerminatingError($_)
        }   
    }
}