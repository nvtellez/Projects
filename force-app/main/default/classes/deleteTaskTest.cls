@isTest
public class deleteTaskTest {
	@testSetup
    public static void makeTasks(){
        List <Task> taskList = new List <Task>();
        for(integer i = 0; i < 10; i++){
            Task a = new Task();
            taskList.add(a);
        }
        insert taskList;
    }
    @isTest
    public static void deleteTaskTest(){
        test.startTest();
        List <Task> taskList = [SELECT id FROM Task];
        for (Task a: taskList){
            try{
                delete a;
            }
            catch (DMLexception e){}
        }
        test.stopTest();
        system.assertEquals(10, taskList.size());
    }
}