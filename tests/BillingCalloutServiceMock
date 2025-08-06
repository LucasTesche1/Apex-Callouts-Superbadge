@isTest
global class BillingCalloutServiceMock implements WebServiceMock {
    //classe mock que simula dados e ação
    global void doInvoke(
        Object stub,
        Object request,
        Map<String,Object> response,
        String endpoint,
        String soapAction,
        String requestName,
        String responseName,
        String responseNs,
        String responseType){
            BillingServiceProxy.billProjectRequest_element responseElement = new BillingServiceProxy.billProjectRequest_element();
            
            responseElement.status = 'ok';
            response.put('response_x', responseElement);
        }
}
