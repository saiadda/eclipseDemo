public class MyExtension {
private final Account acc;

public MyExtension(ApexPages.StandardController controller){
    this.acc = (Account)controller.getRecord();
}

public string getTitle(){
    return ' Account:  '+acc.name+' (' + acc.id + ')';
}

}