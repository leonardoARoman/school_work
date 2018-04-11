package friends;

// represents a list of people as a linked list of Person objects
public class PersonList {
	Person firstPerson;		// First Person object in the list(Head)

	public PersonList( ) {
		this.firstPerson = null;// Head = null
	}

	// finds Person object in this list with given name
	// if none exists, returns null.  Runs in O(number of persons in this list) 
	public Person lookup(String name){
		Person currentPerson = firstPerson;
		while(currentPerson!= null){
			if(currentPerson.name.equals(name)){
				return currentPerson;
			}
			currentPerson = currentPerson.nextPerson;
		}
		return currentPerson;
	}

	// creates a new Person object with name and adds it to the list of 
	// Person objects.  Runs in O(1)
	public Person addPerson(String name){
		
		if(firstPerson == null)
			firstPerson = new Person(name,null);
		else
			firstPerson = new Person(name,firstPerson);
		
		return firstPerson; // replace this line
	}
}
