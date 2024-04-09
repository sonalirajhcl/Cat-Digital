# README

New Rails app:
• Create a new model with a name and data of your choosing with some basic validations
• Create a controller for this model that contains endpoints for create and update
o No authentication is required
o Include some basic verification for submitted parameters
• Available third-party API endpoints should be configurable (backend support only, no need for GUI)
• When new data is stored or updated, all configured endpoints should be notified of the changes
• Third parties should be provided with means to verify the authenticity of the webhook request

Setup
-----------------

1. rails new CatDigital

2. rails g model CatDigital name:string email:string

3. rails db:migrate

4. rails g controller CatDigital

Add webhook_endpoints.yml and access it from application.rb. Update model to check notification sent succesfully or not.

