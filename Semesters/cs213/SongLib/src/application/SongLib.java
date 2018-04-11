package application;

import javafx.application.Application;
import javafx.fxml.FXMLLoader;
import javafx.stage.Stage;
import view.SongLibController;
import javafx.scene.Scene;
import javafx.scene.layout.AnchorPane;

public class SongLib extends Application {
	@Override
	public void start(Stage primaryStage) 
			throws Exception {

		FXMLLoader loader = new FXMLLoader();
		loader.setLocation(getClass().getResource("/view/SongLibView.fxml"));
		AnchorPane root = (AnchorPane)loader.load();


		SongLibController listController = 
				loader.getController();
		listController.start(primaryStage);



		Scene scene = new Scene(root,530,400);
		primaryStage.setScene(scene);
		primaryStage.show();

	}

	public static void main(String[] args) {
		launch(args);
	}
}
