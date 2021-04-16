trigger PrimaryContact on Contact (before delete) {
    if(trigger.isbefore){
        if(trigger.isDelete){
            PrimaryContactCannotBeDeleted.deleteCheck(trigger.old);}
    }

}