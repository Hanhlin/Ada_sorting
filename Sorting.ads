package Sorting is
	size: constant integer:= 40;
	subtype value_range is integer range 0..500; 	--decalre the value restriction in array
	type int_array is array(1..size) of value_range;
 	arrayA: int_array;
	procedure QSort(Low: in integer; High: in integer);
	stack_overflow, stack_underflow:exception;
end Sorting;