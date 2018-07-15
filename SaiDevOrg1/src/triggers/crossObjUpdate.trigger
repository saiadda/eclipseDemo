trigger crossObjUpdate on FormData__c (after insert,after update) {

List<TriggerFormData__c> TformList = new List<TriggerFormData__c>();

if(Trigger.isInsert){
for(FormData__c a:Trigger.New){
TriggerFormData__c tf = new TriggerFormData__c();

tf.Name = a.User_Name__c;
tf.TEmail_Id__c = a.Email_Id__c;
tf.TPhone_Number__c = a.Phone_Number__c;
tf.TQualification__c = a.Qualification__c;

TformList.add(tf);
system.debug ('the tf is '+tf);
}

system.debug ('the TformListoutside is '+TformList);
insert TformList;
}

if(Trigger.isUpdate){

FormData__c fd = new FormData__c();
Set<string> details = new Set<string>();

for(FormData__c a:Trigger.New){
TriggerFormData__c tf = new TriggerFormData__c();

tf.Name = a.User_Name__c;

system.debug ('the tf is '+tf);
details.add(a.User_Name__c);
}

fd=[select id from FormData__c where name IN: details];
system.debug ('the TformListoutside is '+TformList);
update TformList;
}

}