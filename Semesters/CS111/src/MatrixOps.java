//Leonardo Roman
public class MatrixOps
{
	public static double[][] multiply(double[][] matrix1, double[][] matrix2)
	{
		double[][] product = new double[matrix1.length][matrix2[0].length];//product matrix results in [m*n] matrix
		//System.out.println("\nnumber of rows = "+product.length+" number of colums = "+product[0].length);//to debug
		int nRows = matrix1.length;
		int nColumns = matrix2[0].length;
		int nOperation = matrix2.length;
		//System.out.println("nRows = "+nRows+"\nnColumns = "+nColumns+"\nnOperation = "+nOperation);// to debug

		int sum = 0;
		for(int m = 0; m<nRows; m++){//traverse all rows in a
			for(int n = 0;n<nColumns; n++){//traverse all columns
				sum = 0;//reset sum
				for(int k = 0; k<nOperation; k++){//number of k-multiplications
					sum += (matrix1[m][k]*matrix2[k][n]);//matrix product is an [m*n] matrix
					//System.out.print(k+" = "+sum+"; ");// to debug
				}
				product[m][n] = sum;
			}
		}
		return product;
	}
}
