//Leonardo Roman lr534
import java.util.*;
public class Milestone2 {
static Scanner stdin = new Scanner(System.in);

	public static int countRedPixels(Picture v){
		int redCount = 0;
		for (int i = 0; i<v.getWidth(); i++) {
			for (int j = 0; j<v.getHeight(); j++) {
				Pixel colors = new Pixel(v,i,j);
				colors.getColor();
				int red =  colors.getRed();
				int green = colors.getGreen();
				int blue = colors.getBlue();
				if (red == 255 && green == 0 && blue == 0) {
					redCount++;
				}
			}
		}
		return redCount;
	}
	
	public static void switchRedBlue(Picture v){
		Pixel colors;
		for (int i = 0; i<v.getWidth(); i++) {
			for (int j = 0; j<v.getHeight(); j++) {
				
				colors = new Pixel(v,i,j);
				
				int red =  colors.getRed();
				int green = colors.getGreen();
				int blue = colors.getBlue();
				int newRed = (int)(Math.random()/.01)+red;
				int newGreen = (int)(Math.random()/.01)+green;
				int newBlue =  (int)(Math.random()/.01)+blue;
				//System.out.println(newCol);
				//int averageColor = (int)(Math.random()/.1)*(red+green+blue)/3;
				if (red >= 0 && green >= 0 && blue >= 0) {
					colors.setRed(newRed);
					colors.setGreen(newGreen);
					colors.setBlue(newBlue);

				}
			}
		}
		
		
		/*for (int i = 0; i<v.getWidth(); i++) {
			for (int j = 0; j<v.getHeight(); j++) {
				
				colors = new Pixel(v,i,j);
				
				int red =  colors.getRed();
				int green = colors.getGreen();
				int blue = colors.getBlue();
				
				if (red < 250 && green < 220 && blue < 200) {
					colors.setRed(0);
					colors.setGreen(0);
					colors.setBlue(0);

				}
			}
		}*/
	}

	public static void flipHorizontal(Picture v){
		//3. Take the left half of an image and reflect it over an imaginary
		//vertical line going across the middle of the image.
		for (int i = v.getWidth()/2; i<v.getWidth(); i++) {
			for (int j = 0; j<v.getHeight(); j++) {
				v.setBasicPixel(i, j, v.getBasicPixel(v.getWidth() -1 -i, j));
			}
		}
	}

	public static void flipVertical(Picture v){
		//4. Take the top half of an image and reflect it over an imaginary 
		//horizontal line going through the image
		for (int i = 0; i < v.getWidth(); i++) {
			for (int j = v.getHeight()/2; j<v.getHeight(); j++) {
				v.setBasicPixel(i, j, v.getBasicPixel(i, v.getHeight() -1 -j));
			}
		}
	}

	public static void flipDiagonal(Picture v){
		//Take the upper half of an image and reflect it over an imaginary 
		//diagonal line going from the upper left corner of the image to the lower right corner.
		if(v.getWidth() == v.getHeight()){
			for(int i = 0; i<v.getWidth(); i++){
				for (int j = i; j<v.getHeight(); j++) {				
					v.setBasicPixel(v.getWidth()-1-i, j, v.getBasicPixel(v.getWidth()-1-j, i));
				}
			}
		}else{
			System.out.println("Enter a square image.");
		}
	}
	
	public static void main(String[] args){
		Picture p = new Picture("squareJJ.jpg");
		int comand;
		System.out.println("Menu:\n1.Count red pixels.\n2.Swap colors.\n3.Flip horizontal.");
		System.out.print("4.Flip vertical.\n5.Flip diagonal.\nEnter option: ");
		comand = stdin.nextInt();
		switch(comand){
		case 1:
			System.out.println("Red count = "+countRedPixels(p));
			break;
		case 2:
			switchRedBlue(p);
			break;
		case 3:
			flipHorizontal(p);
			break;
		case 4:
			flipVertical(p);
			break;
		case 5:
			flipDiagonal(p);
			break;
			default:
				System.out.println("Not an option.");
		}
		p.write("/Users/leonardoroman/Desktop/imageOutput.jpg");
	}
}













