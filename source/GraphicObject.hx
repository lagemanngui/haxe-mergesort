package;
import flixel.FlxSprite;

/**
 * ...
 * @author lagemanngui
 */
class GraphicObject extends FlxSprite
{
	private var _index:Int = 0;
	private var _myArray:Array<Int> = [];
	private var _oldValue:Int = 0;

	public function new(X:Float, Y:Float, index:Int, myArray:Array<Int>) 
	{
		super(X, Y);
		
		x *= 3;
		
		_index = index;
		
		_myArray = myArray;
		
		representArrayValueOfIndex();
		
	}
	public function representArrayValueOfIndex():Void
	{
		makeGraphic(2, _myArray[_index]);
		_oldValue = _myArray[_index];
		
	}
	override public function update():Void
	{
		super.update();
		
		representArrayValueOfIndex();
	}
	
}