.. 以两个点开始的内容是注释。不会出现编写的文档中。但是能体现文档书写者的思路。
.. 一般一个文件，内容，逻辑的分层，分到三级就可以， 最多四级. 也就是 
   H1. ########
   H2, ********
   H3, =================================================================
   H4. ---------
   
Deploy
###################################################

#. Process Flow

	.. image:: images/07_deploy_intro.png

#. Entry Criteria

	Deploy Documentation Ready

    * Application deploy packages
	* Deploy Guide(Optional)
	* Deployment Steps
	* Deployment Test Cases
	* Feature list & Bug Fixed list 

#. Exit Criteria

	Release Applications

	* New version application online
	* Release notes documents

Task -- Test Server Pre-Deploy
********

Target: What we want?
=================================================================

* Verify the SQL sequence used to update the database
* Verify the new application delpoy steps
* Check the deploy packages run well in new enviorment.
* Update the latest applications on test server.

Roles: Who will join in this task?
=================================================================

* Server Administrator

Inputs: What we need before we go ahead?
=================================================================

* Application deploy packages
* Deploy Guide
* DataBase Documents(Update parts)



Execution: How we should do
=================================================================
#. Check the application running environment(Optional).
#. Update the database(Optional).
#. Deploy application packages.
#. Normal check the new application deployment.
#. Notify Developer to do sanity test of the new deployment.

Validation
=================================================================

* Sanity test on test server is OK.

Outputs: What we will delivery for next task?
=================================================================

* New version Application on Test Server

* Production Deployment Plan

Task -- Apply For Publish Online
********

Target: What we want?
=================================================================
Confirm with Project Manager and others current changes needs to update to production server

Roles: Who will join in this task?
=================================================================

* Project Manager

Inputs: What we need before we go ahead?
=================================================================
* Deployment Steps
* Deployment Test Cases
* Production Deployment Plan
* Application deploy packages


Execution: How we should do
=================================================================
Send the applying email

Validation
=================================================================
NA

Outputs: What we will delivery for next task?
=================================================================

* approvement email

Task -- Production Server Deploy
********

Target: What we want?
=================================================================
Upgrade our latest application on production server.

Roles: Who will join in this task?
=================================================================

* Server Administrator

Inputs: What we need before we go ahead?
=================================================================
* Deployment Steps
* Deployment Test Cases
* Production Deployment Plan
* Application deploy packages
* approvement email

Execution: How we should do
=================================================================
#. Check the application running environment(Optional).
#. Update the database(Optional).
#. Deploy application packages.
#. Normal check the new application deployment.
#. Take the sanity test via deployment test cases.

Validation
=================================================================
Deployment test is OK.

Outputs: What we will delivery for next task?
=================================================================

* New version application on production server.

Task -- Publish Release Notes
********

Target: What we want?
=================================================================
Notify all the project memebers our upgraded application version codes, fixed bugs and new features.

Roles: Who will join in this task?
=================================================================

* Project Manager

Inputs: What we need before we go ahead?
=================================================================
* Production Deployment Plan
* Feature list & Bug Fixed list 

Execution: How we should do
=================================================================
#. send the release notes to project members via email
#. Add the release notes in project system

Validation
=================================================================
NA

Outputs: What we will delivery for next task?
=================================================================

* Release notes









