Describe "New-ResourceGroup" {
    $location = 'eastus'
    $name = 'youtube92'

    It "Name should be youtube92" {
        $name | Should Be 'youtube92'
    }

    It "location should be eastus" {
        $location | Should Be 'eastus'
    }
}