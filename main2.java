public class main2 {

    static int max(int x, int y) {
        if(x<y){
            return x;
        }else {
            return y;
        }
        }
    
    public static void main(String[] args) {
        int[] ia = {1,3,5};
        String[] sa = new String[3];
        sa[0] = "Java";
        sa[1] = "Ruby";
        sa[2] = "C++";
        for(int i=1; i<ia.length;i++){
            System.out.println(ia[i]);
        }
        System.out.println();
        
        for(int i : ia){
            System.out.println(i + ",");
        }
        System.out.println();
        String xx = 5>3 ? "five" : "three";
        System.out.println(xx);

    }
}
