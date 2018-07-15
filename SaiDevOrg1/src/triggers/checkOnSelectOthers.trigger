trigger checkOnSelectOthers on 
    PickListDisplay__c (before insert,before update)
{
    if(Trigger.isInsert || trigger.isUpdate){
        for(PickListDisplay__c p : Trigger.new){
            if(p.option__C == 'Other'){
                p.Selected__C = true;
            }else{
                p.selected__C= false;
            }
        }
    }
}