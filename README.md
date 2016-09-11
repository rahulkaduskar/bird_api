bird_api
==========
Steps for how to Launch the Application:
========================================

Things you will require for launch:
-----------------------------------

 - Ruby Version 2.3.0
 - Rails Version 4.2.7
 - Bundle Install
 - Configuration: mongoid.yml

How to run Application after installation:
------------------------------------------

 - Open two terminal. Go to application path & start your rails application using < rails s > command
 - In another terminal execute below API service,

API specification
=================

Get API: : (get list)
---------------------
curl -v -H “Accept: application/json” -H “Content-type: application/json” -X GET http://localhost:3000/birds.json

Post API: (create)
---------------

curl -v -H "Accept: application/json" -H "Content-type: application/json" -X POST -d ' {"bird":{"name":"birdName5","family":"family","added":"2016-09-11 21:51:07 +0530","visible":true,"continents_attributes":[{"name":"continent11"}]}}'  http://localhost:3000/birds.json

Show API:
---------

curl -v -H “Accept: application/json” -H “Content-type: application/json” -X GET http://localhost:3000/birds/57d588fcd307b81336000003.json

Delete API:
-----------

curl -X "DELETE" http://localhost:3000/birds/57d588fcd307b81336000003.json
 

Testing
==========

Steps to Execute Automated Test Cases
Command :rspec 