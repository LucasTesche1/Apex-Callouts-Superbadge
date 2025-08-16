public class RewardsCalloutService{

    public static Integer submitUsersForRewardCallout(String jsonBody) {
        //Configuração de Endpoint
        HttpRequest req = new HttpRequest();
        req.setEndpoint('callout:BalancedLiving/rewards');
        req.setMethod('POST');
        req.setHeader('Context-Type', 'application/json');
        req.setBody(jsonBody);
        
        Http http = new Http();       
        HttpResponse res;
        Integer statusCode;
        
        //Chamada HTTP        
        try{
            res = http.send(req);
            statusCode = res.getStatusCode();
            System.debug('Response Status: ' + statusCode);
            System.debug('Response Body: ' + res.getBody());            
        }catch (Exception e){
            System.debug('Error: ' + e.getMessage());
            statusCode = 500; //Internal Server Error
        }        
        return statusCode;    
    }
}
