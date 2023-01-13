@isTest
public class synchPartsWithProduct_TEST {
   
    @isTest(SeeAllData=true)
    private static void synchWhileInserting_TEST(){
        Database.SaveResult dsr;
        SQX_Part__c drSQX_Part_c;
        Product2 drProduct2;
        drProduct2=new Product2();
        dsr=Database.insert(drProduct2,false);
        Test.startTest();
        synchPartsWithProduct.synchWhileInserting();
        Test.stopTest();
    }
    @isTest
    private static void synchPartsWithProduct_TEST(){
        synchPartsWithProduct obj = new synchPartsWithProduct();
    }
}