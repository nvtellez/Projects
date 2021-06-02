trigger deleteTaskTrigger on Task (before delete) {
    if (Trigger.isBefore){
        for (Task t: Trigger.old){
            t.addError('You may not delete a task!');
        }
   	}
}