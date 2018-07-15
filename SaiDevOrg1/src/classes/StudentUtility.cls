public class StudentUtility {
    public static void studentProcess(){
        try{
             studentDetail();
        }catch(StudentException se){
            system.debug('Message  '+se.getMessage());
            system.debug('Cause  '+se.getCause());
            system.debug('Line Number  '+se.getLineNumber());
            system.debug('Stacktrace  '+se.getStackTraceString());
            system.debug('Type  '+se.getTypeName());
        }
    }
    public static void studentDetail(){
        try{    
        Student__C st=new Student__C();
        //st.name='Rama..!!'
        insert st;   
        }catch(DmlException de){
            throw new StudentException('Student could not be inserted ',de);
        }
	}
}