trigger updateContacts on Account (after insert) {
    list<Contact> clis=new list<Contact>();
if(Trigger.isInsert){    
    for(Account a:Trigger.new){
        if(a.Rating=='Hot'){
            Contact c=new Contact();
            c.accountid=a.id;
            c.LastName=a.name;
            clis.add(c);
        }
    }
    insert clis;
}
}