@isTest
public class productNotFound_test {
    @isTest(SeeAllData=true)
    private static void synchWhileInserting_TEST(){
        Database.SaveResult dsr;
        SQX_Part__c drSQX_Part_c;
        Product2 drProduct2;
        drProduct2=new Product2();
        dsr=Database.insert(drProduct2,false);
        Test.startTest();
        productNotFound.synchWhileInserting();
        Test.stopTest();
    }
    @isTest
    private static void productNotFound_TEST(){
        productNotFound obj = new productNotFound();
    }

}