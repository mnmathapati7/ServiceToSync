public class synchPartsWithProduct {
	public static void synchWhileInserting(){
        List<SQX_Part__c> newlst =new List<SQX_Part__c>([Select Id,Name,Product__c From SQX_Part__c]);
        //Set<string> partNmbrSet=new Set<string>();
        List<SQX_Part__c> sqxUnsyncList = new List<SQX_Part__c>();
        for(SQX_Part__c prt:newlst){
            if(String.IsBlank(prt.Product__c)){
               sqxUnsyncList.add(prt);
                System.debug(sqxUnsyncList);
            }
        }
       List<Product2> productList = [SELECT Id,Name,ProductCode FROM Product2];
        //List<SQX_Part__c> productUnavalaibleList = new List<SQX_Part__c>();
        for(SQX_Part__c part:sqxUnsyncList){
            for(Product2 prd:productList){
                if(part.Name == prd.Name){
                    part.Product__c = prd.Id;
                    //syncStatus=1;
                }
                                              
            }
            
        }
        update sqxUnsyncList;
        
    }
       }