package friends;

public class Person {
	String name;		// the person's name
	Friend firstFriend; // the first friend in the list of this
						// person's friends
	Person nextPerson;  // the next person in the list of people
	public Person(String name, Person nextPerson) {
		this.name = name;
		this.nextPerson = nextPerson;
	}

	// A string representing the list of friends of this person.  
	// O(number of friends in the list)
	public String friendString(){
		StringBuilder sb = new StringBuilder();
		if(firstFriend==null)
			return "There are no friends in the list.";
		Friend currentFriend = firstFriend;
		while(currentFriend!=null){
			sb.append(currentFriend.who.name+" ");
			currentFriend = currentFriend.nextFriend;
		}
		return sb.toString().trim(); // replace this line
	}

	// add friend as a friend of this person
	// O(1)
	public void addFriend(Person friend){
		if(friend.name.equals("")){
			System.out.println("Bad Option!");
			return;
		}
		
		if(firstFriend == null)
			firstFriend = new Friend(friend,null);
		else
			firstFriend = new Friend(friend,firstFriend);
	}

	// remove Person friend as a friend of this person
	// if friend is not a friend of this person, does nothing
	// O(number of friends of this person)
	public void removeFriend(Person friend){
		Friend currentFriend = firstFriend;
		Friend prev = null;
		//case I list is empty.
		if(firstFriend==null){
			System.out.println(friend.name+" is not a friend in the list.");
			return;
		}
		//case III target not found.
		if(currentFriend.who.equals(friend)){
			firstFriend = currentFriend.nextFriend;
			currentFriend.nextFriend = null;
			return;
		}else{
			while(currentFriend.nextFriend!=null){
				prev = currentFriend;
				currentFriend = currentFriend.nextFriend;
				if(currentFriend.who.equals(friend)){
					prev.nextFriend = currentFriend.nextFriend;
					return;
				}
			}
		}
		//case III target found.
		System.out.println(friend.name+" is not in the list.");
	}
}
