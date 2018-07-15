trigger duplicateRestrict on Account (before insert) {
	//list<Account> accList = [select id,name from Account];
	list<String> st=new list<String>();
    Account a=new Account();
    for(Account acc:Trigger.new){
        st.add(acc.Name);
        //a.Name=acc.Name;
        //system.debug('The value retrieved by trigger is '+acc.Name);
        //system.debug('a.name'+a.name);
        system.debug('the names are ' +st);
    }
    list<Account> accList = [select id,name from Account where name =:st];
    system.debug('accList'+accList);
    system.debug('accList size'+accList.size());
    for(Account acc:Trigger.new){
    if(accList.size() >= 1){
        system.debug('inside if');
        acc.adderror('Duplicate not alowed');
    }}
}