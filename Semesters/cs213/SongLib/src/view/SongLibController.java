package view;
import java.io.BufferedReader;
import java.io.BufferedWriter;
import java.io.File;
import java.io.FileNotFoundException;
import java.io.FileReader;
import java.io.FileWriter;
import java.io.IOException;
import java.io.Writer;
import java.util.Collections;
import java.util.Comparator;
import java.util.Optional;

import javax.swing.JOptionPane;

import javafx.collections.FXCollections;
import javafx.collections.ObservableList;
import javafx.fxml.FXML;
import javafx.scene.control.Alert;
import javafx.scene.control.Alert.AlertType;
import javafx.scene.control.*;
import javafx.stage.Stage;

public class SongLibController {

	//UI reference Fields of view attributes (id fx:)
	@FXML
	private TextArea songDetails;
	@FXML
	private ListView<Song> playList;
	@FXML
	private Button addSongButton,deleteSongButton,editSongButton,editArtistButton,editAlbumButton;
	@FXML
	private TextField addSongTextField,editSongTextField,editArtistTextField,editAlbumTextField;

	private ObservableList<Song> obsList;

	private String[] songObj;

	private File fileName = new File("Playlist.txt");
	private BufferedReader br;

	private int size = sizeOfFile(fileName);
	private Song[] song = new Song[size];


	public void start(Stage mainStage) throws Exception {                
		if(size==0){
			obsList = FXCollections.observableArrayList();
			playList.setItems(obsList);
		}
		else{
			br = new BufferedReader(new FileReader("Playlist.txt"));
			String line = null;
			int i=0;
			while ((line = br.readLine()) != null) {
				songObj = line.split("/");
				if(!yearFormat(songObj[3]))
					return;
				song[i] = new Song(songObj[0],songObj[1],songObj[2],songObj[3],songObj[4]);
				obsList = FXCollections.observableArrayList(song);
				System.out.println(song[i].fileFormat());//For debug
				i++;
			}
			playList.setItems(obsList);//Populate the ListView obj (playList)
			sort(obsList);//Sort playList
			playList.getSelectionModel().select(0);//Select the first item in playList
			songDetails.setText(playList.getSelectionModel().getSelectedItem().getSongInfo());
		}


		//display song info
		playList
		.getSelectionModel()
		.selectedIndexProperty()
		.addListener((obs, oldVal, newVal)-> displaySongInformation(newVal));
	}

	public void writeplaylist() {

		try {
			FileWriter fileNameWriter= new FileWriter(fileName,false);
			Writer output=new BufferedWriter(fileNameWriter);
			BufferedReader reader=new BufferedReader(new FileReader(fileName));

			for(int i=0;i<obsList.size();i++) {
				String line= reader.readLine();
				// if it has some duplicates the dont write 
				while(line!=null) {
					line=reader.readLine();
				}
				if(!(obsList.get(i).toString().equals(line))) {
					output.write(obsList.get(i).fileFormat()+"\n");
				}
			}
			output.close();
			reader.close();
		}catch(Exception e) {
			JOptionPane.showMessageDialog(null, "was unable to create that file");
		}

	}

	public void sort(ObservableList<Song> obsList){
		Collections.sort(obsList, (o1,o2)->{
			if(o1.getName().compareToIgnoreCase(o2.getName())==0) {
				return o1.getArtist().compareToIgnoreCase(o2.getArtist());
			}
			return o1.getName().compareToIgnoreCase(o2.getName());
		}); 
	}

	// compartor for the sorting method
	/*Comparator<? super Song> comparatorsort = new Comparator<Song>() {
		@Override
		public int compare(Song o1, Song o2) {

			if(o1.getName().compareToIgnoreCase(o2.getName())==0) {
				return o1.getArtist().compareToIgnoreCase(o2.getArtist());
			}
			return o1.getName().compareToIgnoreCase(o2.getName());
		}
	};*/

	//adds song to observable list.
	public void addSongToList(){

		String[] str = addSongTextField.getText().split("/");

		for(int i = 0; i < obsList.size(); i++){
			if(str[0].equalsIgnoreCase(obsList.get(i).getName()) && str[1].equalsIgnoreCase(obsList.get(i).getArtist())){
				Alert alert = new Alert(AlertType.ERROR);
				alert.setTitle("Error Dialog");
				alert.setHeaderText("Look, an Error Dialog");
				alert.setContentText("Ooops, there was an error!\nSong already exists");
				alert.showAndWait();
				addSongTextField.setText(null);
				return;
			}
		}
		if(str.length<5||str.length>5){
			Alert alert = new Alert(AlertType.ERROR);
			alert.setTitle("Input Error");
			alert.setHeaderText("Wrong Input Format");
			alert.setContentText("\nInput format requires '/'\n"
					+ "Example:\nname/artist/release year/album/type");
			alert.showAndWait();
			return;
		}
		if(confirmationMessage()){
			if(yearFormat(str[3])){
				obsList.add(new Song(str[0],str[1],str[2],str[3],str[4]));
				playList.getSelectionModel().select(obsList.size()-1);
				songDetails.setText(playList.getSelectionModel().getSelectedItem().getSongInfo());
				sort(obsList);
				writeplaylist();
				System.out.println(str[0]+" was added.");//For debugging
				addSongTextField.setText(null);
				return;
			}
			return;
		}
		//for debug
		for(int i = 0; i < obsList.size(); i++){
			System.out.println(obsList.get(i).getName()+" ("+obsList.get(i).getArtist()+")");
		}
		System.out.println("\n");
	}

	//Delete song from observable list.
	public void deleteSongFromList(){
		int index = playList.getSelectionModel().getSelectedIndex();
		System.out.println(index);
		if(index == obsList.size()-1){
			if(confirmationMessage()){
				obsList.remove(index);
				playList.getSelectionModel().select(0);
			}
		}else{
			if(confirmationMessage()){
				obsList.remove(index);
				playList.getSelectionModel().select(index);
			}
		}
		sort(obsList);
		writeplaylist();
		System.out.println("song deleted");//For debugging
	}

	public void displaySongInformation(Number i){
		playList.getSelectionModel().select(i.intValue());
		String item=playList.getSelectionModel().getSelectedItem().getSongInfo();
		songDetails.setText(item);

	}

	public void editSong(){

		Song item = playList.getSelectionModel().getSelectedItem();
		int index = playList.getSelectionModel().getSelectedIndex();
		//editSongTextField.setText(item);
		if(editSongTextField.getText().isEmpty()){
			return;
		}
		if(confirmationMessage()){
			item.setName(editSongTextField.getText());
		}
		obsList.set(index, item);
		editSongTextField.setText(null);
		sort(obsList);
		writeplaylist();
		System.out.println("song edited");//For debugging
	}

	public void editArtist(){

		Song item = playList.getSelectionModel().getSelectedItem();
		int index = playList.getSelectionModel().getSelectedIndex();
		//editSongTextField.setText(item);
		if(editArtistTextField.getText().isEmpty()){
			return;
		}
		if(confirmationMessage()){
			item.setArtist(editArtistTextField.getText());
		}
		obsList.set(index, item);
		editArtistTextField.setText(null);
		sort(obsList);
		writeplaylist();
		System.out.println("song edited");//For debugging
	}

	public void editAlbum(){

		Song item = playList.getSelectionModel().getSelectedItem();
		int index = playList.getSelectionModel().getSelectedIndex();
		if(editAlbumTextField.getText().isEmpty()){
			return;
		}
		if(confirmationMessage()){
			item.setAlbum(editAlbumTextField.getText());
		}
		obsList.set(index, item);
		editAlbumTextField.setText(null);
		sort(obsList);
		writeplaylist();
		System.out.println("song edited");//For debugging
	}

	//Helper function to display dialog message.
	public boolean confirmationMessage(){
		Alert alert = new Alert(AlertType.CONFIRMATION);
		//alert.initOwner(mainStage);
		alert.setTitle("Confirm Change");
		alert.setHeaderText("Look, a Confirmation Dialog");
		alert.setContentText("Press ok to make changes");

		Optional<ButtonType> result = alert.showAndWait();
		if (result.get() == ButtonType.OK){
			return true;
		}
		return false;	
	}

	public int sizeOfFile(File f){
		BufferedReader br = null;
		try {
			br = new BufferedReader(new FileReader(f));
		} catch (FileNotFoundException e) {
			// TODO Auto-generated catch block
			e.printStackTrace();
		}
		int count = 0;
		try {
			while(br.readLine()!=null){
				count++;
			}
		} catch (IOException e) {
			// TODO Auto-generated catch block
			e.printStackTrace();
		}
		return count;
	}

	//Helper function to check year
	public boolean yearFormat(String year){
		for(int i = 0; i < year.length(); i++){
			if(Character.isDigit(year.charAt(i))==false){
				Alert alert = new Alert(AlertType.ERROR);
				alert.setTitle("Error Dialog");
				alert.setHeaderText("Look, an Error Dialog");
				alert.setContentText("Only digits from 1800-2017");
				alert.showAndWait();
				return false;
			}
		}
		if(Integer.parseInt(year)>=1800 && Integer.parseInt(year)<=2017)
			return true;

		return false;
	}
}
