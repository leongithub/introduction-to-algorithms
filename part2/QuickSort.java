/**
 * 快速排序。最坏情况运行时间为 O(n * n)
 * 快速排序通常是用于排序的最佳实用选择
 * 因为其平均性能相当好，期望运行时间为 O(n * lgn)
 */
public class QuickSort {

    int heapSize;

    public static void main(String[] args) {
	int[] array = {4, 1, 3, 2, 16, 9, 10, 14, 8, 7};

	QuickSort qs = new QuickSort();
	qs.quickSort(array, 0, array.length - 1);

	printArray(array);
    }

    void quickSort(int[] a, int p, int r) {
	if (p < r) {
	    int q = partition(a, p, r);
	    quickSort(a, p, q - 1);
	    quickSort(a, q + 1, r);
	}
    }

    int partition(int[] a, int p, int r) {
	int x = a[r];
	int i = p - 1;

	for (int j = p; j < r; j++) {
	    if (a[j] <= x) {
		i++;
		exchange(a, i, j);
	    }
	}

	exchange(a, i + 1, r);
	return i + 1;
    }

    void exchange(int[] a, int i, int j) {
	int temp = a[i];
	a[i] = a[j];
	a[j] = temp;
    }

    static void printArray(int[] array) {
	for (int i = 0; i < array.length; i++) {
	    if (i != 0) System.out.print(',');
	    System.out.print(array[i]);
	}
	System.out.println();
    }
}
