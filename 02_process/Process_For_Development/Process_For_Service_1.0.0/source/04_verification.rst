.. 以两个点开始的内容是注释。不会出现编写的文档中。但是能体现文档书写者的思路。
.. 一般一个文件，内容，逻辑的分层，分到三级就可以， 最多四级. 也就是 
   H1. ########
   H2, ********
   H3, =========
   H4. ---------
   
Verifaction
###################################################


#. Process Flow

	.. image::  images/Verification_Process.png

#. Entry Criteria
	Requirement Documentation Ready

	* PRD
	* User Stories
	* Blue Print
	* CoreVisual
	* Test Plan
	* Test Cases
	
#. Exit Criteria

	Test Result Documentation

	* Performance Test Report
	* Funcation Test Report
	* Acceptence Test Report


Task -- Review and Update Test Cases
********

Target
=========
	
	According to the latest requirement document(such as Entry Criteria related), review the planned test cases, check whether we need to update the test cases;
	Note:review the test cases is mandatory, but update is optional;
	
Role
=========
* Feature Scope Owner
* Architect
* Tester

Inputs
=========
* PRD
* User Stories
* Blue Print
* CoreVisual
* Test Plan
* Function Test Cases
* Performance Test Cases
* Acceptance Test Cases
	
Excution
=========
	Although limited time and heavy tasks, but test cases will determine whether an application or sofeware system is working correctly,let's improve them before we start to run;
	just recommend some steps, please execute it by your case:
#. Collect the inputs and book some meetings for review.
#. Check the test cases one by one.

  Send the updated test cases to Architect and Feature Scope Owner for review;
	
Validation
=========
N/A

Outputs
=========
* Function Test Cases
* Performance Test Cases
* Acceptance Test Cases

Task -- Function Test
********

Target
=========
	According to the latest Function Test Cases,check whether our sofeware system is working correctly;

Role
=========
* Feature Scope Owner
* Architect
* Tester

Inputs
=========
* Function Test Cases

Excution
=========
	Excute the function test cases one by one, and record the issues detail info, such as reproduce steps, machine type, device version, application version, browser type, browser version,etc.
	
	Send the report to Architect and Feature Scope Owner;
	
Validation
=========
N/A

Outputs
=========
* Function Test Report

Task -- Performance Test
********

Target
=========
	According to  the Performance Test Cases and selected tools(such as Jmeter,Load Runner), check whether our application system meet the various performance indicators;

Role
=========
* Feature Scope Owner
* Architect
* Tester

Inputs
=========
* Performance Test Cases

Excution
=========
	Execute the Performance Test Cases with selected tools, report the result;
Validation
=========
N/A

Outputs
=========
* Performance Test Report

Task -- Bug Fix
********

Target
=========
	According to the test report documents, which including Function Test Report,Performance Test Report,Acceptance Test Report, fix related issues;

Role
=========
* Feature Scope Owner
* Architect
* Tester
* Developer

Inputs
=========
* Function Test Report
* Performance Test Report
* Acceptance Test Report

Excution
=========
	Any way, firtly, we need to check the priority about all the issues and maybe some issues no need to be fixed;
	Find the rootcause and provide the solution;
	
Validation
=========
	Verify the solution by yourself;
	
Outputs
=========
* Release Note
* Updated Function Test Report
* Updated Performance Test Report
* Updated Acceptance Test Report

Task -- Regression Test
********

Target
=========
	guarantee the fixed issues are really fixed, and no new issues are found;

Role
=========
* Tester

Inputs
=========
* Release Note
* Function Test Report
* Performance Test Report
* Acceptance Test Report

Excution
=========
	Select some related test cases about the fixed issues, Verify whether developer succeed to fix the issues mentioned in Release Note, and whether some new issues are displayed because of the solutions provided by developer;
	
Validation
=========
N/A

Outputs
=========
* Regresstion Test Report

Task -- Acceptance Test
********

Target
=========
	determine if the requirements of a specification  are met;
	
Role
=========
* Business Worker

Inputs
=========
* Function Test Report
* Performance Test Report
* Acceptance Test Cases

Excution
=========
	execute the Acceptance Test Cases;
	
Validation
=========
N/A

Outputs
=========
* Acceptance Test Report







