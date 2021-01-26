package com.example.rxjavamap.leet;

import android.util.Log;

import java.util.ArrayList;
import java.util.Arrays;
import java.util.List;

public class StudyLeet {
    public static String TAG = StudyLeet.class.getSimpleName();
    public static void start(){

        Log.d(TAG,"================除法================");
        StudyLeet studyLeet = new StudyLeet();
        int res = studyLeet.divide(100,9);
        Log.d(TAG,"100/9 = " + res);

        Log.d(TAG,"================下一个排列================");
        int num[] = {4,6,2,1,7,3};
        int[] numRes = studyLeet.nextPermutation(num);
        Log.d(TAG, Arrays.toString(numRes));

        Log.d(TAG,"================在排序数组中找第一个和最后一个元素的位置================");
        int nums[] = {1,2,2,2,3,4,5,5,8,9,10};
        int[] res3 = studyLeet.rangOfNum(nums,5);
        Log.d(TAG,"res3:" + Arrays.toString(res3));

        Log.d(TAG,"================搜索插入的位置================");
        int nums1[] = {1,2,3,4,5,8,9,10};
        int resu = studyLeet.searchInsertIndex(nums1,6);
        Log.d(TAG,"resu:" + resu);

        Log.d(TAG,"================组合总和================");
        int nums2[] = {1,2,3,4,5,8,9,10};

        Log.d(TAG,"================接雨水================");
        int nums3[] = {5,1,2,9,3,4,8,5}; //4354
        int v = studyLeet.trap(nums3);
        Log.d(TAG,"接雨水input:"+Arrays.toString(nums3) +",res:"+v);

        Log.d(TAG,"================求乘积================");
        String m = "123", n = "654";
        int res4 = studyLeet.muliply(m,n);
        Log.d(TAG,"求乘积res:"+res4);
    }

    public int muliply(String m, String n){
        return 100;
    }

    /**
     * 接雨水
     * @param heigh
     * @return
     */
    public int trap(int[] heigh){

        int count = heigh.length;
        int[] max_left = new int[count];
        int[] max_right = new int[count];

        int res = 0;

        for (int i = 1; i < count; i++) {
            max_left[i] = Math.max(max_left[i -1],heigh[i-1]);
        }
        for (int i = count - 2; i > 0; i--) {
            max_right[i] = Math.max(max_right[i + 1],heigh[i +1]);
        }

        for (int i = 1 ; i < count - 2; i++) {
            int min = Math.min(max_left[i],max_right[i]);
            if (min > heigh[i]){
                res += min-heigh[i];
            }
        }

        return res;
    }


    /**
     * 组合总和
     * @param num
     * @param target
     * @return
     */
    public List<List<Integer>>combinationSum(int[] num, int target){
        int len = num.length;
        List<List<Integer>> res = new ArrayList<>();
        if (len == 0) return res;



        return null;
    }

    /**
     * 搜如插入的位置
     * @param num
     * @param target
     * @return
     */
   public int searchInsertIndex(int[] num, int target){
        if (num == null || num.length == 0) return 0;
        int left = 0, right = num.length - 1;
        while (left <= right){
            int mid = (left + right) / 2;
            if (num[mid] > target){
                right = mid - 1;
            } else if (num[mid] < target){
                left = mid + 1;

            } else {
                return mid;
            }
        }
        return left;
   }


    public int[] rangOfNum(int[] nums, int target){
        int start = -1, end = -1;
        start = binarySearch(nums, target,true);
        end = binarySearch(nums,target,false) -1;
        if (start<=end && nums[start] == target && nums[end] == target){
            return new int[]{start,end};
        }
        return new int[]{-1,-1};
    }

    public int binarySearch(int[] nums, int target, boolean lower){
        if (nums == null) return -1;
        int left = 0,right = nums.length -1, ans = nums.length;
        while (left <= right){
          int mid = (right + left) / 2;
          if (nums[mid] > target || (lower && nums[mid] >= target)){
              right = mid - 1;
              ans = mid;
          } else {
              left = mid + 1;
          }
        }
        return ans;
    }


    /**
     * 下一个排列
     * @param num
     */
    public int[] nextPermutation(int[] num){
      if (num.length <= 1) return num;

      int changIndex = num.length - 1;
       for (int length = num.length-1; length > 0; length--) {
           if (num[num.length-1] > num[length]){
               changIndex = length;
               break;
           }
       }

       int change = num[changIndex];

       num[changIndex] = num[num.length-1];
       num[num.length-1] = change;

       return sort(num,changIndex + 1, num.length -1);
    }


    public int[] sort(int[] num, int index,int end){


//        ArrayDeque

        return num;
    }

    /**
     * 除法
     * @param dividend
     * @param divisor
     * @return
     */
    public int divide(int dividend, int divisor){

        if (dividend == 0) return 0;
        if (divisor == 1) return dividend;
        if (divisor == -1) return -dividend;

        int cur = dividend;
        int div = divisor;
        int sign = 1;
        if ((cur > 0 && div < 0) || (cur < 0 && div >0)) sign = -1;
        cur = cur > 0 ? cur : -cur;
        div = div > 0 ? div : -div;
        int res = div(cur,div);
        if (sign > 0)return res;
        else return -res;

    }

    /**
     * 求商
     * @param a
     * @param b
     * @return
     */
    public int div(int a, int b){
        if (a < b) return 0;
        int count = 1;
        int tb = b;
        while (tb + tb <= a){
            count = count + count;
            tb = tb + tb;
        }
        return  count + div(a-tb,b);
    }

}
