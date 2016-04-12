/**
 * 桶排序。O(n)
 * 假设输入的元素可以均匀而独立地分布在区间 [0, 1)
 * 整个桶排序算法以线性时间运行
 */
import java.util.ArrayList;

public class BucketSort {

    public static void main(String[] args) {
	float[] array = {.78f, .17f, .39f, .26f, .72f, .94f, .21f, .12f, .23f, .68f};

	BucketSort bs = new BucketSort();
	bs.bucketSort(array);

	printArray(array);
    }

    void bucketSort(float[] a) {
	int n = a.length;
	ArrayList[] buckets = new ArrayList[n];

	for (float key : a) {
	    int i = (int) ((float) n * key);
	    if (buckets[i] == null) {
		buckets[i] = new ArrayList<Float>();
	    }
	    buckets[i].add(key);
	}

	for (ArrayList<Float> bucket : buckets) {
	    if (bucket != null && bucket.size() > 1)
		insertionSort(bucket);
	}

	int i = -1;
	for (ArrayList<Float> bucket : buckets) {
	    if (bucket != null) {
		for (float key : bucket) {
		    a[++i] = key;
		}
	    }
	}
    }

    void insertionSort(ArrayList<Float> list) {
	for (int j = 1; j < list.size(); j++) {
	    float key = list.get(j);
	    int i = j - 1;
	    while (i >= 0 && list.get(i) > key) {
		list.set(i+1, list.get(i));
		i--;
	    }
	    list.set(i+1, key);
	}
    }

    static void printArray(float[] array) {
	for (int i = 0; i < array.length; i++) {
	    if (i != 0) System.out.print(',');
	    System.out.print(array[i]);
	}
	System.out.println();
    }
}
