package com.example.rxjavamap.node;

public class Node {
    private char val;
    private Node next;
    public Node(char val, Node next){
        this.val = val;
        this.next = next;
    }

    public char getVal() {
        return val;
    }

    public void setVal(char val) {
        this.val = val;
    }

    public Node getNext() {
        return next;
    }

    public void setNext(Node next) {
        this.next = next;
    }
}
