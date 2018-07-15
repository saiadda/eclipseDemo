public with sharing class PicklistController {
    
    public FormData__c fData {set;get;}
    public string selectedval {set;get;}
    public PicklistController(ApexPages.StandardController controller) {

    }
    
    public List<selectOption> getPickListVals() {
          List<SelectOption> options = new List<SelectOption>();
        
           Schema.DescribeFieldResult fieldResult = FormData__c.Hobby__c.getDescribe();
           List<Schema.PicklistEntry> ple = fieldResult.getPicklistValues();
                
           for( Schema.PicklistEntry f : ple)
           {
              options.add(new SelectOption(f.getLabel(), f.getValue()));
           }       
           return options;
   }
   
 }