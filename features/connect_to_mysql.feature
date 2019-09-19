Feature: Connect to a Mysql Database
  In order to be able access backend Data using REST
  the Database REST Api application can connect to a Mysql Database Server on startup

  Background: A running instance of a Mysql Database Server

  Scenario: Connect to Database on startup when Database Server is up
    When I start the Database REST Api application with connection details to the "Mysql Database Server"
    Then I receive a "Healthy" response from the "/healthcheck" endpoint

  Scenario: Startup Error when Database Server is down
    When I start the Database REST Api application with connection details to the "Mysql Database Server"
    Then startup fails with an error message "Mysql Database Server is down"
	
  Scenario: Health endpoint shows unhealthy when "Mysql Database Server" goes down during operation
    When I start the Database REST Api application with connection details to the "Mysql Database Server"
	And "Mysql Database Server" goes down after startup
    Then I receive a "Not Healthy" response from the "/healthcheck" endpoint
