//Leonardo Roman.

import java.util.*;
class MyPicture {
	private Picture pic;
	private String fileName, description;
	
	//constructor
	public MyPicture(String fileName, String description){
		this.fileName = fileName;
		this.description = description;
		pic = new Picture(this.fileName);
	}

	public String toString(){
	return fileName+" "+pic.getWidth()+"x"+pic.getHeight()+" "+description;
	//return pic+", "+description;
	}

	public boolean equals(MyPicture p) {
		if(fileName.equals(p.fileName) && description.equals(p.description))
			return true;
		
			return false;
	}

	public Picture negative(){
		Picture p = new Picture(pic.getWidth(),pic.getHeight());
		for(int i = 0; i<pic.getWidth(); i++){
			for(int j = 0; j<pic.getHeight(); j++){
				Pixel colors = new Pixel(pic,i,j);
				Pixel colors2 = new Pixel(p,i,j);
				colors2.setRed(255-colors.getRed());
				colors2.setGreen(255-colors.getGreen());
				colors2.setBlue(255-colors.getBlue());
			}
		}
		return p;
	}

	public double redness() {
		int redCounter = 0;
		for(int i = 0; i < pic.getWidth(); i++){
			for(int j = 0; j < pic.getHeight(); j++){
				Pixel colors = new Pixel(pic,i,j);
				if(colors.getRed()>colors.getGreen() && colors.getRed()>colors.getBlue()){
					redCounter++;
				}
			}
		}
		double redScore = (double)redCounter/(pic.getWidth()*pic.getHeight());
		return redScore;
	}

	public void flipVertical() {
		
		for (int i = 0; i < pic.getWidth(); i++) {
			for (int j = pic.getHeight()/2; j<pic.getHeight(); j++) {
				pic.setBasicPixel(i, j, pic.getBasicPixel(i, pic.getHeight() -1 -j));
			}
		}
		pic.write("/Users/leonardoroman/Desktop/flipedVertical.jpg");
	}
	
	public void flipHorizontal(){
		for (int i = pic.getWidth()/2; i<pic.getWidth(); i++) {
			for (int j = 0; j<pic.getHeight(); j++) {
				pic.setBasicPixel(i, j, pic.getBasicPixel(pic.getWidth() -1 -i, j));
			}
		}
		pic.write("/Users/leonardoroman/Desktop/flipedHorizontal.jpg");
	}
	static Scanner stdin = new Scanner(System.in);
	public static void main(String[] args){
		MyPicture p1 = new MyPicture("coolJJ.jpg","JJ is suited up");
		MyPicture p2 = new MyPicture("jj.jpg", "JJ is in the water park");
		System.out.println("Is p1 == p2? "+p1.equals(p2));
		while(true){
		System.out.println("Options\n1.Get Format.\n2.Get Negative.\n3.Get REdness Count."+
		"\n4.Flip Horizontal.\n5.Flip Vertical.");
		int command = stdin.nextInt();
		switch(command){
		case 1:
			System.out.println("MyPicture 1:\n"+p1.toString());
			System.out.println("MyPicture 2:\n"+p2.toString());
			break;
		case 2:
			p1.negative().write("/Users/leonardoroman/Desktop/p1Negative.jpg");
			p2.negative().write("/Users/leonardoroman/Desktop/p2Negative.jpg");
			break;
		case 3:
			System.out.println("p1 redness amount is "+p1.redness());
			System.out.println("p2 redness amount is "+p2.redness());
			break;
		case 4:
			p1.flipHorizontal();
			p2.flipHorizontal();
			break;
		case 5:
			p1.flipVertical();
			p2.flipVertical();
			break;
			default:
				System.out.println("Not an option.");
				return;
		}
		}		
	}
}