trigger checkEmailTrigger on Buyer__c (before delete) {
    if (Trigger.isBefore){
        if (Trigger.isDelete){
            for (Buyer__c c: Trigger.old) {
                if (c.Email__c == null) {
                    c.addError('Please contact buyer before deleting.');
                }
            }
        }
    }
}