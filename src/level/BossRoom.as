package level 
{
	import org.flixel.FlxGroup;
	import org.flixel.FlxTileblock;
	import sprite.BallBoss;
	import sprite.SmallDoor;
	import sprite.Spike;
	/**
	 * ...
	 * @author Oskar
	 */
	public class BossRoom extends Level
	{
		
		public function BossRoom() 
		{
			width = 700;
			height = 400;
		add(new FlxTileblock(0, 0, width, 1));	
		add(new FlxTileblock( 0, 0, 1, height));
		add(new FlxTileblock(width - 1, 0, 1, height));
		add(new FlxTileblock(0, height - 1, width, height))
		
		entries = new FlxGroup;
		entries.add(new SmallDoor(10, height - 25, 0, 0))
		
		}
		override public function init():void {
			var spike1:Spike = new Spike(0, height - 80, -1);
			var spike2:Spike = new Spike(width - 60, height - 80, 1);
			Registry.backgroundLayer.add(spike1)
			Registry.backgroundLayer.add(spike2)
			var boss:BallBoss = new BallBoss(width / 2 - 80, height / 2 - 80);
			boss.addHazard(spike1.killPoint);
			boss.addHazard(spike2.killPoint);
			Registry.enemies.add(boss);
			Registry.backgroundLayer.add(entries);
		
		}
		
	}

}