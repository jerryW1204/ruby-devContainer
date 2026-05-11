class Main{
    public static void main(String[] args) {
        System.out.println("Hello, world!");
        int a=5;
        String s="Ruby";
        double b=3.14;

        System.out.println(a);
        System.out.println("s:"+s);
        System.out.println(b);

        System.out.println(s.length());

        if(a>5){
            System.out.println("Large"); // Java中if语句后若无{}则只能执行一条语句
        } else if(a<0){
            System.out.println("Negative");
        } else {
            System.out.println("Little");
        }
    
        int x=10;
        while (x>0) {
            System.out.println("@");
            x--;
        }
        System.out.println();

        for(int i=0; i<5; i++){
            System.out.println("#");
        }
        System.out.println();

    }
}