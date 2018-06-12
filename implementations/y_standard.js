/* Y-combinator - Javascript standard version */ 
function y(improver){
    return function(f){
	return f(f);
    }(function (f) {
	return improver(
	    function(x){
		return f(f)(x);
	    }
	);
    });
};

function fac_improver(partial){
    return function(x){
	return ((x == 0) ? 1 : x*partial(x-1));
    };
}

fac = y(fac_improver);
