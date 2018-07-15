@isTest
public class TestForcating1{
    static testMethod void insertNewUser(){
        User userToCreate = new User();
        
        userToCreate.FirstName='Mahindra';
        userToCreate.LastName='Dhoni';
       
        
       userToCreate.Email     = 'dvdkliu+sfdc99@gmail.com';
       userToCreate.Username  = 'seshasaiat@gmail.com';
       userToCreate.Alias     = 'fatty';
      userToCreate.profileId = '005900000025RVX';
       
       insert userToCreate ;
        
    }
}