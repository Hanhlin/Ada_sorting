with text_io; use text_io;
with Sorting; use Sorting;

procedure MainProg is
	
	package int_io is new integer_io(integer);
	use int_io;
	
		
	x: integer;
	Low: integer:= 1;
	High: integer:= size;
	sum: integer:= 0;
	
	--read values into array
	procedure ReadArray is
	begin
		for i in 1..size loop
			get(x);
			arrayA(i) := x;
		end loop;
	end ReadArray;

	--print out array
	procedure PrintArray is
	begin
		for i in 1..size loop
			put(arrayA(i)); 
			-- put(i);
			new_line;
		end loop;
	end PrintArray;

--***Printing Task***
Task PrintingTask is
	entry read_done;
	entry sort_done;
	entry sum_done;
end PrintingTask;

Task body PrintingTask is
begin
		accept read_done do 
			put("Unsorted Array:"); new_line;
			PrintArray; 	--print out unsorted array
		end read_done;

		accept sort_done do 
			put("Sorted Array:"); new_line;
			PrintArray; 	--print out sorted array
		end sort_done;

		accept sum_done do 	--print out summation of array elements
			put("Summation of Array Elements:"); new_line;
			put(sum);
		end sum_done;	

end PrintingTask;


--***Adding Task***
Task AddingTask is
	entry sort_done;
end AddingTask;

Task body AddingTask is
begin
	accept sort_done do 
		for i in 1..size loop
				sum:= sum + arrayA(i);
		end loop;
	end sort_done;
	PrintingTask.sum_done;
end AddingTask;


--***Sorting Task***
Task SortingTask is
	entry print_done;
end SortingTask;

Task body SortingTask is
begin
	accept print_done do 
		QSort(Low, High);
		PrintingTask.sort_done;
		AddingTask.sort_done;
	end print_done;
end SortingTask;
	

--MainProg	
begin
	ReadArray;
	PrintingTask.read_done;
	SortingTask.print_done;
end MainProg;









