@isTest
private class BillingCalloutServiceTest {
    @isTest
    static void testCallBillingService(){
        //define os valores para o teste
        Accessibility_Project__c project = new Accessibility_Project__c();
        project.Amount__c = 100.00;
        insert project;
        
        Test.startTest();        
        //define o mock
        Test.setMock(WebServiceMock.class, new BillingCalloutServiceMock());
        //chama o método
        AccessibilityProjectBilling.callBillingService(project.Id, project.Amount__c);        
        Test.stopTest();
        
        project = [SELECT Status__c FROM Accessibility_Project__c WHERE Id = :project.Id];
        System.assertEquals('Complete',project.Status__c,'Project should be Complete');
        
    }

}
