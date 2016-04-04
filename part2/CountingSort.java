/**
 * 计数排序。当 k=O(n) 时，运行时间为 O(n)
 * 被排序数组每个元素都是介于 0 到 k(某个整数) 之间的整数
 */
public class CountingSort {

    public static void main(String[] args) {
	int[] array = {2, 5, 3, 0, 2, 3, 0, 3};
	int[] b = new int[8];

	CountingSort cs = new CountingSort();
	cs.countingSort(array, b, 5);

	printArray(b);
    }

    void countingSort(int[] a, int[] b, int k) {
	int[] c = new int[k + 1];
	for (int i = 0; i <= k; i++) {
	    c[i] = 0;
	}

	for (int key : a) {
	    c[key]++;
	}

	for (int i = 1; i <= k; i++) {
	    c[i] += c[i - 1];
	}

	for (int i = a.length - 1; i >= 0; i--) {
	    b[--c[a[i]]] = a[i];
	}
    }

    static void printArray(int[] array) {
	for (int i = 0; i < array.length; i++) {
	    if (i != 0) System.out.print(',');
	    System.out.print(array[i]);
	}
	System.out.println();
    }
}
