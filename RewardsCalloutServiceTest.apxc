@isTest
public class RewardsCalloutServiceTest {
    @isTest 
    static void testSubmitUsersForRewardCallout(){
        //Define a classe mock para as informações http
        Test.setMock(HttpCalloutMock.Class, new RewardsCalloutServiceMock());
       
        //Teste de dados para o objeto
        List<Wellness_Journey__c> journeys = new List<Wellness_Journey__c>();
        User testUser = [SELECT Id, Name, Username, Email FROM User WHERE Id = :UserInfo.getUserId()];
        
        for (Integer i = 0; i < 12; i++){
            Wellness_Journey__c journey = new Wellness_Journey__c(OwnerId = testUser.Id);
			journeys.add(journey);
        }
        insert journeys;
        
        //Teste do batch
		Test.startTest();
        Database.executeBatch(new WellnessJourneyRewardsBatch());
        Test.stopTest();
               
        Integer statusCode = RewardsCalloutService.submitUsersForRewardCallout(JSON.serialize(journeys));
        System.assertEquals(200, statusCode, 'The HTTP status code should be 200');
    }
}
