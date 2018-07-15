public class FormdatasaveController{

public FormdatasaveController(){
}

public string username {get;set;}
public string password {get;set;}

public void saveForm(){

FormData__c fData = new FormData__c();

fData.User_Name__c = username;
fData.Password__c = password;

system.debug('The username value '+username);
system.debug('The password value '+password);

//list<FormData__c> listForm = new list<FormData__c>();
//listform.add(fData);

insert fData ;

}

}