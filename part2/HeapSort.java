/**
 * 堆排序 O(n * lgn)
 */
public class HeapSort {

    int heapSize;

    public static void main(String[] args) {
	int[] array = {4, 1, 3, 2, 16, 9, 10, 14, 8, 7};

	HeapSort hs = new HeapSort();
	hs.heapSort(array);

	printArray(array);
    }

    void heapSort(int[] a) {
	buildMaxHeap(a);
	printArray(a);
	for (int i = a.length - 1; i > 0; i--) {
	    exchange(a, i, 0);
	    heapSize--;
	    maxHeapify(a, 0);
	}
    }

    void buildMaxHeap(int[] a) {
	int len = a.length;
	heapSize = len;
	for (int i = ((len / 2) - 1); i >= 0; i--) {
	    maxHeapify(a, i);
	}
    }

    void maxHeapify(int[] a, int i) {
	int l = left(i);
	int r = right(i);
	int largest = i;

	if (l < heapSize && a[l] > a[i]) {
	    largest = l;
	}
	if (r < heapSize && a[r] > a[largest]) {
	    largest = r;
	}

	if (largest != i) {
	    exchange(a, largest, i);
	    maxHeapify(a, largest);
	}
    }

    void exchange(int[] a, int i, int j) {
	int temp = a[i];
	a[i] = a[j];
	a[j] = temp;
    }

    int left(int i) {
	return (2 * i) + 1;
    }

    int right(int i) {
	return (2 * i) + 2;
    }

    int parent(int i) {
	return ((i + 1) / 2) - 1;
    }

    static void printArray(int[] array) {
	for (int key : array) {
	    System.out.print(key + ",");
	}
	System.out.println();
    }
}
