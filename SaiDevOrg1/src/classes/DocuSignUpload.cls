public class DocuSignUpload
{
    public blob file { get; set; }
    public String filetype{get;set;}
    public String filename{get; set;}
         
    private string userId= 'cd082c85-98e4-438d-af45-a05a91cf780d' ;
    private string password = 'Tech#123';

    private string  integratorKey = 'TMXX-39d451b4-7d2c-449d-8109-7b195f61ec65';
    private string loginUrl = 'https://demo.docusign.net/restapi/v2/login_information';
    
    string authenticationHeader = 
                '<DocuSignCredentials>' + 
                    '<Username>' + userId+ '</Username>' +
                    '<Password>' + password + '</Password>' + 
                    '<IntegratorKey>' + integratorKey + '</IntegratorKey>' + 
                '</DocuSignCredentials>';           
                
   /* string authenticationHeader = '{'+
                                    'Username'+':'+ userId +','+
                                    'Password'+':'+ password +','+
                                    'IntegratorKey'+':' + integratorKey +
                                  '}'; */
public  void DocAuth(){
    HttpRequest req = new HttpRequest();    
    HttpResponse res = new HttpResponse();
    Http http = new Http();        

    req.setEndpoint(loginUrl);  
    req.setHeader('Content-Type', 'application/json');
    req.setHeader('Accept', 'application/json');
    req.setHeader('X-DocuSign-Authentication', authenticationHeader);
    req.setMethod('GET');
    
    res = http.send(req);
    
    system.debug('The respnose is  '+res.getbody());
    
}

public  void validate(){
  
       Http http = new Http();
       HttpRequest request= new HttpRequest();
       
       
}
}