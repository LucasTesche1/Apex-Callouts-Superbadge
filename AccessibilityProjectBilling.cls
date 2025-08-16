public class AccessibilityProjectBilling {
	
     @future(callout = true)
    public static void callBillingService(String projectId, Decimal billingAmount){
        //instância de variáveis 
        BillingServiceProxy.project project = new BillingServiceProxy.project();
        BillingServiceProxy.InvoicesPortSoap11 stub = new BillingServiceProxy.InvoicesPortSoap11();
        //atribuição de valores
		project.projectid = projectId;
        project.billAmount = Double.valueOf(billingAmount);
        project.username = '{!$Credential.BillingServiceCredential.username}';
        project.password = '{!$Credential.BillingServiceCredential.password}';
        //lógica de chamada, sentido é puxar o project que tem o mesmo Id válido, após isso, atualizar o status.
        String status = stub.billProject(project);
        try{
            if(status == 'ok'){
            	Accessibility_Project__c query = [SELECT Id, Status__c, Type__c, Name FROM Accessibility_Project__c WHERE Id = :projectId LIMIT 1];
                query.Status__c = 'Complete';
                update query;
            }
        }catch (Exception e){
            System.debug('SOAP call failed: ' + e.getMessage());
        }
    }
}
