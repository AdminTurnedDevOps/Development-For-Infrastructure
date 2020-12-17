provider "azurerm" {
  version = "<=2.36.0"

  features {}
}

resource "azurerm_resource_group" "youtuberesource"{
    name = "youtubetest92"
    location = "centralus"
}
