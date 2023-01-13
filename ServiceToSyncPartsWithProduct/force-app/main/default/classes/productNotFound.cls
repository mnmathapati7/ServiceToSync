public class productNotFound implements Database.Batchable<sObject> {
    public Database.QueryLocator start(Database.BatchableContext bc){
        String query ='Select Id,Name,Product__c,Part_Number__c From SQX_Part__c';
        return Database.getQueryLocator(query);
    }
    public void execute(Database.BatchableContext bc, List<SQX_Part__c> newlst){
        // List<SQX_Part__c> newlst =new List<SQX_Part__c>([Select Id,Name,Product__c,Part_Number__c From SQX_Part__c]);
        // //Set<string> partNmbrSet=new Set<string>();
        List<SQX_Part__c> sqxUnsyncList = new List<SQX_Part__c>();
        for(SQX_Part__c prt:newlst){
            if(String.IsBlank(prt.Product__c)){
               sqxUnsyncList.add(prt);
            }
        }
       List<Product2> productList = [SELECT Id,Name,ProductCode FROM Product2];
        List<Product2> newProdList = new List<Product2>();
        integer syncStatus;
        //List<SQX_Part__c> productUnavalaibleList = new List<SQX_Part__c>();
        for(SQX_Part__c part:sqxUnsyncList){
            for(Product2 prd:productList){
                if(part.Name == prd.Name){
                   syncStatus=1;
                }                                           
            }
            if(syncStatus!=1){
                newProdList.add(new Product2(Name=part.Name,ProductCode=part.Part_Number__c,IsActive=true));
            }
        }
        
        insert newProdList;
        
    }

    public void finish(Database.BatchableContext bc){
        synchPartsWithProduct.synchWhileInserting();
    }

}
