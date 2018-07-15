public class DataInsert 
{
    public void insertMethod(String a,String b,String c)
    {
        Country__C con = new Country__c();
        Id i=null;
        list<Country__C> conlis = [select id,name from Country__c where name=:a];
               
        if(conlis.size()==0)
        {
            con.name=a;
            system.debug('The country inserted ' + con);
            insert con;
            system.debug('The country id is' + con.id);           
        }
        
        else
        {
            for(Country__c cc:conlis)
            {
                con.id=cc.id;
                system.debug('The countrylist id is' + con.id);
            }
        }
        
        State__C st = new State__c();
        list<State__C> stlis = [select id,name,Country__c from State__C where name=:b and Country__r.name=:a];
        
        if(stlis.size()==0 )
        {
            system.debug('The size is '+stlis.size());
            system.debug('The country mapped is '+st.Country__c);
            system.debug('The country id is----- ' + con.id);
            st.name=b;
            system.debug('The country id is' + con.id);
            st.Country__c=con.id;
            system.debug('The state inserted ' + st);
            insert st;
            system.debug('The state id' + st.id);
        }
        
        else
        {
            for(State__c sc:stlis)
            {
                st.id=sc.id;
                system.debug('The state id in else is --' + st.id);
            }
        }
        

        City__c ct = new City__C();
        list<City__C> ctlis = [select name,State__c from City__C where name=:c and State__r.name=:b and State__r.Country__r.name=:a];

        if(ctlis.size()==0)
        {
            ct.name=c;        
            ct.State__c=st.id;
            system.debug('The city inserted ' + ct);
            insert ct;
            system.debug('The city id ' + ct.id);
        }
    }
}