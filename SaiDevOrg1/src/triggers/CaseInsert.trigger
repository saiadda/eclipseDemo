trigger CaseInsert on Case (before insert) 
{
   integer Count=[Select Count() From Case WHERE  
   Owner.id=:UserInfo.getUserId() and 
   CreatedDate=THIS_MONTH ];
   list<MaxCases__c> i = MaxCases__c.getall().values();
   integer maxCases=integer.valueOf(i.get(0).maxval__C);
    For(Case C:Trigger.New)
    {
        IF(Count>maxCases)
        {
            C.addError('Too Many Cases Created This Month for User'+UserInfo.getFirstName()+':'+'('+UserInfo.getUserId()+')'+':'+Count);
 
        }
    }
}