package view;

public class Song {
	//Fields
	private String nameOfSong,artist,releaseYear,album,type;

	public Song(String nameOfSong,String artist,String album,String releaseYear,String type){
		setName(nameOfSong);
		setArtist(artist);
		setAlbum(album);
		this.releaseYear=releaseYear;
		this.type=type;
	}

	public void setName(String nameOfSong){
		this.nameOfSong=nameOfSong;

	}
	public void setArtist(String artist){
    	this.artist = artist;
    }
	public void setAlbum(String album){
    	this.album = album;
    }
	public String getName(){
		return nameOfSong;
	}
	public String getArtist(){
		return artist;
	}
	public String getSongInfo(){
		return "Name of song : "+nameOfSong
				+"\nArtist Name : "+artist
				+"\nAlbum: "+album
				+"\nRelease Year : "+releaseYear
				+"\nType: "+type;
	}
	public String fileFormat(){
		return nameOfSong+"/"+artist+"/"+album+"/"+releaseYear+"/"+type;
	}
	public String toString(){
		return nameOfSong+"("+artist+")";
	}
}
