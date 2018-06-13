// The types used are based on the following code: https://gist.github.com/aruld/3965968

public class Y{

    private static interface Func<T>{
	T apply (T x);
    }
    
    private static interface FuncToFunc<T>{
	Func<T> apply (FuncToFunc<T> x);
    }
    
    public static <T> Func<T> YComb (final Func<Func<T>> improver){ 
    	return ((FuncToFunc<T>) ((f) -> f.apply(f)))
    	    .apply((f) -> improver.apply((x) -> f.apply(f).apply(x)));
    };

    public static Func<Func<Integer>> facImprover = (partial) -> (x) -> (x == 1) ? 1 : x*partial.apply(x-1);
    public static Func<Func<Integer>> fibImprover = (partial) -> (x) -> (x < 2) ? 1 : partial.apply(x-1)+partial.apply(x-2);
    
    public static void main(String[] args) {
	Func<Integer> fac = YComb(facImprover);
	Func<Integer> fib = YComb(fibImprover);
	
	if(args.length != 1) return;
	int number = Integer.parseInt(args[0]);
	System.out.printf("fac(%d) = %d\n", number, fac.apply(number));
	System.out.printf("fib(%d) = %d\n", number, fib.apply(number));	
    }
}
