//Leonardo Roman 
//Milestone 3: this program scales and filters an input image.
//There are 5 different filters in 3 different methods. 
//Libraries used in this program: SimplePicture class, Pixel class and Picture class.
import java.util.*;

public class MileStone3{
	static Scanner stdin = new Scanner(System.in);

	//Method filter1 prints original with a randomized pixel filter.
	public static void filter1(Picture v){
		//blank scaled v image to be used
		Picture pic = new Picture(v.getWidth()*2,v.getHeight());

		for (int i = 0,x = pic.getWidth()/2; i<pic.getWidth()/2; i++,x++) {
			for (int j = 0; j<pic.getHeight(); j++) {
				Pixel colors = new Pixel(v,i,j);
				Pixel colors2 = new Pixel(pic,i,j);
				Pixel colors3 = new Pixel(pic,x,j);
				colors2.setRed(255-colors.getRed());
				colors2.setGreen(255-colors.getGreen());
				colors2.setBlue(255-colors.getBlue());

				int red =  (int)(Math.random()/.01)+colors.getRed();
				int green = (int)(Math.random()/.01)+colors.getGreen();
				int blue = (int)(Math.random()/.01)+colors.getBlue();
				if (red >= 0 && green >= 0 && blue >= 0) {
					colors3.setRed(red);
					colors3.setGreen(green);
					colors3.setBlue(blue);
				}
			}
		}
		//outputs original image and filtered image.
		pic.write("/Users/leonardoroman/Desktop/imageOutput.jpg");
	}

	//Method filter2 prints original with gray and black and white (3 images in total)
	public static void filter2(Picture v){
		//print original with gray and black and white (3 images in total)
		
		//blank scaled v image to be used
		Picture pic = new Picture(3*v.getWidth(),v.getHeight());
		//nested loop 1 passes the original image to the first 1/3 of pic image
		for (int i = 0; i<v.getWidth(); i++) {
			for (int j = 0; j<v.getHeight(); j++) {
				Pixel colors = new Pixel(v,i,j);
				Pixel color2 = new Pixel(pic,i,j);
				color2.setRed(colors.getRed());
				color2.setGreen(colors.getGreen());
				color2.setBlue(colors.getBlue());
			}
		}
		//nested loop 2 fills the 2/3 of pic image with a grey copy of original image.
		for (int i = pic.getWidth()/3, x = 0; i<(2*pic.getWidth())/3;x++, i++) {
			for (int j = 0; j<pic.getHeight(); j++) {
				Pixel colors1 = new Pixel(pic,x,j);
				Pixel colors = new Pixel(pic,i,j);
				int averageColor =(int)(Math.random()/.01)+((2*colors1.getRed()+2*colors1.getGreen()+2*colors1.getBlue())/3);
				if (colors.getRed() >= 0 && colors.getGreen() >= 0 && colors.getBlue() >= 0) {
					colors.setRed(averageColor);
					colors.setGreen(averageColor);
					colors.setBlue(averageColor);
				}
			}
		}
		//nested loop 3 fills the last third of pic image with a pure black and white copy of original image.
		for (int i = 2*pic.getWidth()/3, x = 0; i<pic.getWidth();x++, i++) {
			for (int j = 0; j<pic.getHeight(); j++) {
				Pixel colors = new Pixel(pic,x,j);
				Pixel colors2 = new Pixel(pic,i,j);
				int red =  2*colors.getRed();
				int green = 2*colors.getGreen();
				int blue = 2*colors.getBlue();
				if (red >= 100 && green >= 100 && blue >= 100) {
					colors2.setRed(255);
					colors2.setGreen(255);
					colors2.setBlue(255);
				}else{
					colors2.setRed(0);
					colors2.setGreen(0);
					colors2.setBlue(0);
				}
			}
		}
		//outputs original image and filtered image.
		pic.write("/Users/leonardoroman/Desktop/imageOutput.jpg");
	}

	//Method filter3 prints 3 images: original, darker and brighter. 
	public static void filter3(Picture v){
		
		//blank scaled v image to be used
		Picture pic = new Picture(3*v.getWidth(),v.getHeight());
		//nested loop 1 passes the original image to the first 1/3 of pic image
		for (int i = 0; i<v.getWidth(); i++) {
			for (int j = 0; j<v.getHeight(); j++) {
				Pixel colors = new Pixel(v,i,j);
				Pixel color2 = new Pixel(pic,i,j);
				color2.setRed(colors.getRed());
				color2.setGreen(colors.getGreen());
				color2.setBlue(colors.getBlue());
			}
		}
		//nested loop 2 fills the 2/3 of pic image with a darker copy of original image.
		for (int i = pic.getWidth()/3, x = 0; i<(2*pic.getWidth())/3;x++, i++) {
			for (int j = 0; j<pic.getHeight(); j++) {
				Pixel colors1 = new Pixel(pic,x,j);
				Pixel colors = new Pixel(pic,i,j);
				int red =  colors1.getRed()/2;
				int green = colors1.getGreen()/2;
				int blue = colors1.getBlue()/2;
				if (red >= 0 && green >= 0 && blue >= 0) {
					colors.setRed(red);
					colors.setGreen(green);
					colors.setBlue(blue);
				}
			}
		}
		//nested loop 3 fills the last third of pic image with a brighter copy of original image.
		for (int i = 2*pic.getWidth()/3, x = 0; i<pic.getWidth();x++, i++) {
			for (int j = 0; j<pic.getHeight(); j++) {
				Pixel colors1 = new Pixel(pic,x,j);
				Pixel colors = new Pixel(pic,i,j);
				int red =  colors1.getRed()*2;
				int green = colors1.getGreen()*2;
				int blue = colors1.getBlue()*2;
				if (red >= 0 && green >= 0 && blue >= 0) {
					colors.setRed(red);
					colors.setGreen(green);
					colors.setBlue(blue);
				}
			}
		}
		//outputs original image and filtered image.
		pic.write("/Users/leonardoroman/Desktop/imageOutput.jpg");
	}

	public static void main(String[] args)  {
		int comand;
		while(true){
			Picture p = new Picture("coolJJ.jpg");
			System.out.print("1.Random Pixel filter.\n2.Black and White Filter.\n3.Dark and Bright\nEnter option: ");
			comand = stdin.nextInt();
			switch(comand){
			case 1:
				//Random Pixels
				filter1(p);
				break;
			case 2:
				//Black and White
				filter2(p);
				break;
			case 3:
				//dark and light
				filter3(p);
				break;
			default:
				return;
			}
		}
	}
}
