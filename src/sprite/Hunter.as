package sprite 
{import org.flixel.FlxSprite;
import org.flixel.FlxObject;
import sprite.state.HunterShootState;
import sprite.state.EmptyState;
import sprite.strategy.HunterStrategy;
	/**
	 * ...
	 * @author Oskar
	 */
	public class Hunter extends GameSprite
	{
		[Embed(source = "assets/Hunter.png")]private var png:Class;
		[Embed(source = "assets/Block.png")]private var front:Class;
		private var sign :Number = 1;
		private var facade:GameSprite;
		public function Hunter(X:Number, Y:Number) 
		{
			super(X, Y);
			loadGraphic(png, true,true, 22, 28, false);
			addAnimation("shoot", [ 1, 2, 0], 10, false);
			addAnimation("reload", [3,4,3,5], 10, false);
			
			facade = new GameSprite(X , Y + 15, front);
			facade.width = 0;
			facade.height = 0;
			facade.state = new EmptyState;
			strategy = new HunterStrategy(this);
			//state = new HunterShootState(this);
		}
		public function init():void {
			Registry.enemies.add(facade);
		}
	
		override public function update():void {
			super.update();
			if (Registry.player.x > x){
			facing = FlxObject.RIGHT;
			facade.x = x+2;
			}
			else{
			facing = FlxObject.LEFT;
			
				facade.x = x + 11;
			
			}
			angle = -Math.atan((y - Registry.player.y + 2) /(Registry.player.x-x )) * 180 / Math.PI;
		}

}
}