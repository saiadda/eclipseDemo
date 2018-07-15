public with sharing class PaginationC{
    Public Integer noOfRecords{get; set;}
    Public Integer size{get;set;}
    //public List<FormData__c> detailsC {set;get;}
    public PaginationC(ApexPages.StandardController sc){}
    public ApexPages.StandardSetController setCon {
        get{
            if(setCon == null){
                size = 5;
                string queryString = 'select User_Name__c,Password__c,Phone_Number__c,Email_Id__c,Qualification__c from FormData__c';
                setCon = new ApexPages.StandardSetController(Database.getQueryLocator(queryString));
                setCon.setPageSize(size);
                noOfRecords = setCon.getResultSize();
                
                system.debug('noOfRecords is  '+noOfRecords );
                system.debug('getPageSize is  '+setCon.getPageSize());
                system.debug('getPagenumber is  '+setCon.getPageNumber());
            }
            return setCon;
        }set;
    }
  
    
    Public List<FormData__c> getPag(){
       List<FormData__c> detailsC = new List<FormData__c>();
        for(FormData__c a : (List<FormData__c>)setCon.getRecords())
            detailsC.add(a);
        return detailsC;        
    }
    
    
    public pageReference refresh() {
        setCon = null;
        getPag();
        setCon.setPageNumber(1);
        return null;
    }
}