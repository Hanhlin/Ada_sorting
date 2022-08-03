with text_io; use text_io;


package body Sorting is
 
	package int_io is new integer_io(integer);
	use int_io;


	--Low and High are array index
	procedure QSort(Low: in integer; High: in integer) is
		K: integer;
		M: integer;
		I: integer:= Low;
		J: integer:= High;

		procedure Split is
			min, max, mid, temp, pivot_ind: integer;

		-- Right Partition
		Task leftQSort is
			entry continued;
		end leftQSort;
		Task body leftQSort is
		begin
			accept continued;
			QSort(Low, K-1);
		end leftQSort;

		-- Right Partition
		Task rightQSort is
			entry  continued;
		end rightQSort;
		Task body rightQSort is
		begin
			accept continued;
			QSort(K+1, High);
		end rightQSort;

		begin
			--only two elements
			if(Low + 1 = High) then 
				min:= integer'Min(arrayA(Low), arrayA(High));
				max:= integer'Max(arrayA(Low), arrayA(High));
				if arrayA(Low) = min then
					K:= Low+1;
				else
					arrayA(High):= max;
					arrayA(Low):= min;
					K:= High-1;
				end if;
			else
				mid:= arrayA((Low + High) / 2);
				if((mid > arrayA(Low) and arrayA(Low) > arrayA(High)) or (arrayA(High) > arrayA(Low) and arrayA(Low) > mid)) then
					pivot_ind:= Low;
					M:= arrayA(Low);
				end if;
				if((arrayA(Low) > mid and mid > arrayA(High)) or (arrayA(High) > mid and mid > arrayA(Low))) then
					pivot_ind:= (Low + High) / 2;
					M:= mid;
				end if;
				if((arrayA(Low) > arrayA(High) and arrayA(High) > mid) or (mid > arrayA(High) and arrayA(High) > arrayA(Low))) then
					pivot_ind:= High;
					M:= arrayA(High);
				end if;

				--move pivot to the last
				temp:= arrayA(High); 
				arrayA(High):= arrayA(pivot_ind);
				arrayA(pivot_ind):= temp;

				while(I < J) loop
					while(I < High and arrayA(I) <= M) loop
						I := I + 1;
					end loop;

					while(J > 0 and arrayA(J) >= M) loop
						J := J - 1;
					end loop;

					if(I < J) then
						temp:= arrayA(I);
						arrayA(I):= arrayA(J);
						arrayA(J):= temp;
					end if;	
				end loop;
				
				--move the pivot to the correct place
				temp:= arrayA(I);
				arrayA(I):= M;
				arrayA(High):= temp;
				K:= I;
			end if;	

			

			leftQSort.continued;
			rightQSort.continued;

		end Split;


	begin
		--QSort excutes only when Low is smaller than High
		if(Low < High) then 
			Split;
		end if;
	end QSort;
end Sorting;
	
	
		