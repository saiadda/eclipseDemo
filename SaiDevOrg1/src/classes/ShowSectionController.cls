public class ShowSectionController {
    public PickListDisplay__c pld {set;get;}
    public boolean flag {set;get;}
    
    public showSectionController(){
        pld = new PickListDisplay__c();
        flag = false;
    }
    
    public void hideSectionChange(){
        if(pld.option__c == 'Option'){
            flag = true;
        }
        else flag = false;
    }
    
}