//Leonardo Roman
//Matrix multiplication
public class MatrixOp {

	public static double[][] multiply(double[][] a, double[][]b){//a=[m*k], b=[k*n]
		double[][] product = new double[a.length][b[0].length];//product matrix results in [m*n] matrix
		//System.out.println("\nnumber of rows = "+product.length+" number of colums = "+product[0].length);//to debug
		int nRows = a.length;
		int nColumns = b[0].length;
		int nOperation = b.length;
		//System.out.println("nRows = "+nRows+"\nnColumns = "+nColumns+"\nnOperation = "+nOperation);// to debug

		int sum = 0;
		for(int m = 0; m<nRows; m++){//traverse all rows in a
			for(int n = 0;n<nColumns; n++){//traverse all columns
				sum = 0;//reset sum
				for(int k = 0; k<nOperation; k++){//number of k-multiplications
					sum += (a[m][k]*b[k][n]);//matrix product is an [m*n] matrix
					//System.out.print(k+" = "+sum+"; ");// to debug
				}
				product[m][n] = sum;
			}
		}
		return product;
	}
	
	public static boolean validMatrix(double[][] a, double[][]b){
		if(a[0].length == b.length)//if rows_1 == columns_2
			return true;
		
		return false;//matrix multiplication is not possible
	}
	
	public static double[][] buildMatrix(double[][] mtrx){
		double[][] matrix = new double[mtrx.length][mtrx[0].length];
		for(int i = 0; i<mtrx.length; i++){
			for(int j = 0; j<mtrx[0].length; j++){
				System.out.print("Enter elements "+(i+1)+(j+1)+" : ");
				matrix[i][j] = IO.readDouble();
			}
		}
		return matrix;
	}
	public static void main(String[] args) {
		int rows,columns;
		
		System.out.print("Matrix 1: enter number of rows:");
		rows = IO.readInt();
		if(rows <= 0){
			IO.outputStringAnswer("Error.");
			return;//stop program at error
		}
		System.out.print("Matrix 1: enter number of columns:");
		columns = IO.readInt();
		if(columns <= 0){
			IO.outputStringAnswer("Error.");
			return;//stop program at error
		}
		double[][] matrix1 = new double[rows][columns];//declare matrix 1
		
		System.out.print("Matrix 2: enter number of rows:");
		rows = IO.readInt();
		if(rows <= 0){
			IO.outputStringAnswer("Error.");
			return;//stop program at error
		}
		System.out.print("Matrix 2: enter number of columns:");
		columns = IO.readInt();
		if(columns <= 0){
			IO.outputStringAnswer("Error.");
			return;//stop program at error
		}
		double[][] matrix2 = new double[rows][columns];//declare matrix 2

		if(validMatrix(matrix1,matrix2)==true){//check if matrices are valid for multiplication
			System.out.println("Matrix 1");
			matrix1 = buildMatrix(matrix1);//Populate matrix 1
			System.out.println("Matrix 2");
			matrix2 = buildMatrix(matrix2);//Populate matrix 2

			double[][] product = multiply(matrix1,matrix2);//multiply the 2 matrices 
			IO.outputStringAnswer("Product:");
			for(int i = 0; i < product.length; i++){
				for(int j = 0; j<product[i].length; j++){
					System.out.print(product[i][j]+" ");//Print out Product
				}System.out.println();//Print new line
			}
			return;
		}else{
		IO.outputStringAnswer("Error the two matrices can not be multiplied.");
		return;//stop program at error
		}
	}
}



/*int count = 0;
int elements = 0;
for(int i = 0; i<a2d.length; i++){
	for(int j = 0; j<a2d[0].length; j++){
		elements++;
		if(a2d[i][j]<0){
			count++;
		}
	}
}if(count>elements){
		isNegative = true;
	}else
		isNegative = false;*/
