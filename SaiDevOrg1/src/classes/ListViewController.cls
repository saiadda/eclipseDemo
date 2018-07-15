public class ListViewController {

    public ApexPages.StandardSetController setCon{
        get {
            if(setCon==null){
                setCon = new ApexPages.StandardSetController(Database.getQueryLocator(
                    [SELECT id,Name, email FROM Lead]));
            }
            return setCon;
            
        }
        set;
    }

    public list<lead> getLeadds() {
        return (list<lead>) setCon.getRecords();
    }

}