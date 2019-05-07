--[[ @MysticCraftPlayz - Let there be fire again. I think you will understand; ]]
local SizesTable = { 
	--[[ 
		Description of that measure table: 
			Stores values to format time.
			int Key => table { string Postfix, int Threshold (value to step over that index) };
	]]
	[0] = {'ms', 1000}, 
	[1] = {'s', 60}, 
	[2] = {'m', 60}, 
	[3] = {'h', 24}, 
	[4] = {'d', 365}, 
	[5] = {'y', -1} 
};
local MaxSize = #SizesTable;

--[[ 
	Description of function:
		Takes time integer value in mesure passed by second parameter (0 is ms, 1 is s, 2 is m and so on); Default is Seconds (s = 1).
		Returns beautified time according to give `SizesTable`
]]
local function beautifySize(Size, Intial)
	Intial = Intial or 1;
	local ASize = Intial;
	local Result = { };
	while (ASize < MaxSize) and (Size >= SizesTable[ASize][2]) do 
		SizeNext = math.floor(Size / SizesTable[ASize][2]);
		SizeRems = Size - (SizeNext * SizesTable[ASize][2]);
		Result[#Result + 1] = ('%d%s'):format(SizeRems, SizesTable[ASize][1]);
		Size = SizeNext;
		ASize = ASize + 1;
	end;
	if Size > 0 then 
		Result[#Result + 1] = ('%d%s'):format(Size, SizesTable[ASize][1]);
	end;
	local AResult = { };
	for i = #Result, 1, -1 do 
		AResult[#AResult + 1] = Result[i];
	end;
	return table.concat(AResult, ' ');
end;

return beautifySize;
