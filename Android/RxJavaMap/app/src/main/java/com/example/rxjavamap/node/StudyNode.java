package com.example.rxjavamap.node;

import android.util.Log;

public class StudyNode {

    public static String TAG = StudyNode.class.getSimpleName();

    public static void Start(){

        Log.d(TAG,"================反转单链表================");
        StudyNode studyNode = new StudyNode();
        Node header = studyNode.getNodeWithString("1234567890");
        studyNode.printNode(header);
        Node reverseRes = studyNode.reverse(header);
        studyNode.printNode(reverseRes);

        Log.d(TAG,"================反转K单链表================");
        Node header2 = studyNode.getNodeWithString("1234567890C");
        studyNode.printNode(header2);
        Node reverseKRes = studyNode.reverseKGroup(header2,3);
        studyNode.printNode(reverseKRes);



    }

    public Node reverseKGroup(Node header, int k){
        if (header == null || header.getNext() == null) return header;

        Node pre = new Node('c',header);
        Node dummy = pre, start = header, end = pre;
        while (end != null){
            for (int i = 0; i < k && end != null; i++) {
                end = end.getNext();
            }
            if (end == null) break;

            Node next = end.getNext();
            pre.setNext(null);
            end.setNext(null);

            Node cur = reverse(start);
            pre.setNext(cur);
            start.setNext(next);
            pre = start;
            end = pre;
            start = start.getNext();
        }

        return dummy.getNext();
    }

    /**
     * 打印单链表
     * @param header
     */
    public void printNode(Node header){
        if (header == null) return;
        StringBuilder builder = new StringBuilder("");
        while (header!= null){
            builder.append("->"+header.getVal());
            header = header.getNext();
        }
        Log.d(TAG,builder.toString());
    }

    /**
     * 根据字符串生成单链表
     * @param value
     * @return
     */
    public Node getNodeWithString(String value){
        if (value == null) return null;
        Node header = new Node('a',null);
        Node curr = header;
        for (int i = 0; i < value.length(); i++) {
            Node node = new Node(value.charAt(i),null);
            curr.setNext(node);
            curr = curr.getNext();
        }
        return header.getNext();
    }


    public Node reverse(Node node){
        Node pre = null;
        Node cur = node;
        while (cur != null){
            Node next = cur.getNext();
            cur.setNext(pre);
            pre = cur;
            cur = next;
        }

        return pre;
    }

}
