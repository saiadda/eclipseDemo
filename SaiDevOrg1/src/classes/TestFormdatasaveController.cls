@isTest
public class TestFormdatasaveController {

static testMethod void myUnitTest() {

    FormData__c fData = new FormData__c();
 
    fData.User_Name__c = 'Pritish';
    fData.Password__c = 'Sahu';
    
    //Test.startTest();

    insert fData ;
    //Test.stopTest();
   
    System.assertEquals(fData.User_Name__c, 'Pritish');
    
    
  } 

}