@isTest
public class EmailTest {
	@testSetup
    public static void makeEmails(){
        List <Buyer__c> buyerList = new List <Buyer__c>();
        for(integer i = 0; i < 10; i++){
            Buyer__c a = new Buyer__c();
            a.Last_Name__c = 'YaBoi';
            buyerList.add(a);
        }
        insert buyerList;
    }
    @isTest
    public static void deleteBuyerTest(){
        test.startTest();
        List <Buyer__c> buyerList = [SELECT id FROM Buyer__c];
        for (Buyer__c a: buyerList){
            try{
                delete a;
            }
            catch (DMLexception e){}
        }
        test.stopTest();
        system.assertEquals(10, buyerList.size());
        system.assertNotEquals(8, buyerList.size());
    }
}