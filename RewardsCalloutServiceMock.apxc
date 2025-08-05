@isTest
global class RewardsCalloutServiceMock implements HttpCalloutMock {
    global HTTPResponse respond(HTTPRequest req){
       //classe MOCK
        HttpResponse res = new HttpResponse();
        res.setHeader('Content-Type','application/json');
        res.setBody('{"status":"sucess"}');
        res.setStatusCode(200);
        
        return res;
    }
}
