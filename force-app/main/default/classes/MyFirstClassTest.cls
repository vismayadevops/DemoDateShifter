@isTest
public class MyFirstClassTest {

    @isTest
    public static void greetingTest() {
        Test.startTest();
        String message = MyFirstClass.greeting();
        System.assertEquals(message, 'Hey! Happy to see you','Received the Message');
        Test.stopTest();
    }
}