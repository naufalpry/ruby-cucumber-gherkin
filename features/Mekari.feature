@Mekari
Feature: Create automated test for creating jurnal sales invoice on

  @MainMenu
  Scenario: Login Mekari
    Given open Mekari
    When User login into Jurnal
    Then validate login
  Scenario: User create sales invoice
    Given Buat Penjualan Baru
    Then Select dropdown existing customer on the list
    Then Select dropdown customer with add new customer
    Then Select dropdown existing product on the list
    Then Select dropdown customer with add new product
    And Select dropdown customer with add new product with selecting other buy account