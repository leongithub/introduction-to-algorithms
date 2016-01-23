/**
 * 插入排序
 */
public class InsertionSort {

    public static void main(String[] args) {
	int[] array = {2, 3, 1, 6, 4, 5};

	insertionSort(array);

	for (int key : array) {
	    System.out.print(key);
	}
	System.out.println();
    }

    static int[] insertionSort(int[] array) {
	for (int j = 1; j < array.length; j++) {
	    int key = array[j];
	    int i = j - 1;
	    while (i >= 0 && array[i] > key) {
		array[i+1] = array[i];
		i--;
	    }
	    array[i+1] = key;
	}

	return array;
    }
}
