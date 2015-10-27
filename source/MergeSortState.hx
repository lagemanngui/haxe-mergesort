package;
import flixel.FlxG;
import flixel.FlxState;
import flixel.text.FlxText;
import flixel.util.FlxRandom;

/**
 * ...
 * @author lagemanngui
 */
class MergeSortState extends FlxState
{
	public var arrayToMerge:Array<Int> = [];
	
	public var mergeArray:Array<Int> = [];
	public var tempMergeArray:Array<Int> = [];
	
	public var arrLeng:Int = 0;
	
	public var merged:Bool = false;
	
	public var comparsions:Int = 0;
	
	public var iterations:Int = 320;

	override public function create():Void
	{
		super.create();
		
		
		
		
		//Fills the array
		for (i in 0...iterations)
		{
			arrayToMerge[i] = FlxRandom.intRanged(1, 450);
		}
		
		//Add the graphic representation of the array
		for (i in 0...iterations)
		{
			var gfx = new GraphicObject(i, 0, i, arrayToMerge);
			add(gfx);
		}
		
		var info:FlxText = new FlxText(0, 455, 640, "Press [Space] to MergeSort | [Enter] to generate another array", 16);
		info.color = 0xff7fe57f;
		add(info);
		
		var arrSize = new FlxText(0, 0, 640, "Array length:  " + Std.string(iterations), 16);
		arrSize.setBorderStyle(FlxText.BORDER_OUTLINE, 0xff000000, 2);
		arrSize.color = 0xffd3d3d3;
		add(arrSize);
		
		
	}
	override public function update():Void
	{
		super.update();
		
		if (FlxG.keys.justPressed.SPACE)
		{
			if (!merged) doSort(arrayToMerge);
			else FlxG.resetState();
		}
		
		if (FlxG.keys.justPressed.ENTER)
		{
			FlxG.resetState();
		}
	}
	public function doSort( _arr:Array<Int>):Void
	{
		mergeArray = _arr;
		arrLeng = mergeArray.length;
		
		doMergeSort(0, arrLeng - 1);
		
		//When mergesort ends
		merged = true;
		
		//Show the number of comparisons made
		add(new FlxText(0, 425, 640, "Comparisons made: " + Std.string(comparsions), 16));
		
		
	}
	public function doMergeSort(lowerIndex:Int, higherIndex:Int):Void
	{
		if (lowerIndex < higherIndex)
		{
			var middle:Int = Math.floor(lowerIndex + (higherIndex - lowerIndex) / 2);
			
			doMergeSort(lowerIndex, middle);
			
			doMergeSort(middle+1, higherIndex);
			
			mergeParts(lowerIndex, middle, higherIndex);
		}
	}
	public function mergeParts(lower:Int, middle:Int, higher:Int)
	{
		for (ite in lower...higher+1)
		{
			tempMergeArray[ite] = mergeArray[ite];
		}
		
		var i = lower;
		var j = middle + 1;
		var k = lower;
		
		while ( i <= middle && j <= higher)
		{
			
			if (tempMergeArray[i] <= tempMergeArray[j])
			{
				mergeArray[k] = tempMergeArray[i];
				i++;
				
				comparsions++;
				
			}else
			{
				mergeArray[k] = tempMergeArray[j];
				j++;
				
				comparsions++;
			}
			
			k++;
		}
		
		while ( i <= middle)
		{
			
			mergeArray[k] = tempMergeArray[i];
			k++;
			i++;
		}
	}
	
}