public class StdformdataController{

public FormData__c fData {set;get;}
public List<FormData__c> det {set;get;}
public string uname;
public string quali; 
public string phon;
public string email;
public string strQuery;

public StdformdataController(ApexPages.StandardController stdController){
fData = new FormData__c();
loaddata();
}

public void saveForm(){
insert fData ;
loaddata();
fData = new FormData__c();

}

private void loaddata(){
det = new  List<FormData__c>();
det=[select User_Name__c,Password__c,Phone_Number__c,Email_Id__c,Qualification__c from FormData__c ];
} 

public pagereference search(){

uname = fData.User_Name__c;
quali = fData.Qualification__c;
phon  = fData.Phone_Number__c;
email = fData.Email_Id__c;

if (uname == null || uname == '' && phon  == null || phon  == '' && email == null || email == '' && quali == null || quali == '') {
ApexPages.addmessage(new ApexPages.message(ApexPages.severity.ERROR,'Enter atleast one search criteria...'));
return null;
}

// create a string to hold the query and
    strQuery = 'select User_Name__c,Password__c,Phone_Number__c,Email_Id__c,Qualification__c from FormData__c';
   
    // create a list of strings to hold the conditions
    List<string> conditions = new List<string>();
   
    // uname
    if (uname==null || uname=='')
        conditions.add('User_Name__c = null ');
    else
        conditions.add('User_Name__c LIKE \'%' + uname + '%\' ');
   // phone
    if (phon==null || phon=='')
        conditions.add('Phone_Number__c = null ');
    else 
        conditions.add('Phone_Number__c LIKE \'%' + phon + '%\' ');
    // email   
    if (email == null || email == '')
        conditions.add('Email_Id__c = null ');
    else
        conditions.add('Email_Id__c LIKE \'%' + email + '%\' ');
    // quali
     if (quali == null || quali == '')
        conditions.add('Qualification__c = null ');
    else
        conditions.add('Qualification__c LIKE \'%' + quali + '%\' ');

 system.debug('---- the strquery is '+ strQuery);

    if (conditions.size() > 0) {
        if(!(uname==null || uname=='')){
        strQuery += ' WHERE ' + conditions[0];}
        for (Integer i = 1; i < conditions.size(); i++){
            if(i==1){
            if(!(phon==null || phon=='') ){
                strQuery += ' AND ' + conditions[i];
                }
            } 
            if(i==2){
             if(!(email == null || email == '')) {
                strQuery += ' AND ' + conditions[i];
            }}
            if(i==3){    
             if(!(quali == null || quali == '')){
                strQuery += ' AND ' + conditions[i];
            } }
            
        }
            
    }
   
 system.debug('the end strquery is '+ strQuery);

det = Database.query(strQuery);
system.debug('the uname is  '+uname);

return null;
}

}