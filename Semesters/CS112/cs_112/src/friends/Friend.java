package friends;

public class Friend {
	Friend nextFriend;	// next Friend object
	Person who;			// Person object who is the friend
	//public static int friendCount = 0;
	Friend(Person who, Friend nextFriend) {
		this.who = who;
		this.nextFriend = nextFriend;
		//friendCount++;
		//System.out.println("friendCount = "+friendCount);
	}
}
