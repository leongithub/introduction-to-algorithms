/**
 * 合并排序 O(n * lgn)
 */
public class MergeSort {

    public static void main(String[] args) {
	int[] array = {2, 3, 1, 6, 4, 5};

	mergeSort(array, 0, array.length - 1);

	for (int key : array) {
	    System.out.print(key);
	}
	System.out.println();
    }

    static void mergeSort(int[] array, int p, int r) {
	if (p < r) {
	    int q = (p + r) / 2;
	    mergeSort(array, p, q);
	    mergeSort(array, q + 1, r);
	    merge(array, p, q, r);
	}
    }

    /**
     * p, q, r 为数组下标
     */
    static void merge(int[] array, int p, int q, int r) {
	int n1 = q - p + 1;
	int n2 = r - q;
	int[] left = new int[n1 + 1];
	int[] right = new int[n2 + 1];
	for (int i = 0; i < n1; i++) {
	    left[i] = array[p + i];
	}
	for (int j = 0; j < n2; j++) {
	    right[j] = array[q + j + 1];
	}
	left[n1] = Integer.MAX_VALUE;
	right[n2] = Integer.MAX_VALUE;

	int i = 0;
	int j = 0;
	for (int k = p; k <= r; k++) {
	    if (left[i] < right[j]) {
		array[k] = left[i];
		i++;
	    } else {
		array[k] = right[j];
		j++;
	    }
	}
    }
}
