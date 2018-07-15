public with sharing class MyController {

    public Id selectedAccount {get; set; }
    public List<contact> contactsInformation {get; set; }

    public list<Account> getMyaccounts() {
        return [select id,name,accountnumber from account order by LastModifiedDate desc limit 10];
    }
    
    public void accountClicked(){
        contactsInformation = [select firstname,lastname from contact
                                where accountid=:selectedAccount];
    }
}