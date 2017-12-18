package sprite 
{
	import org.flixel.FlxGroup;
	import org.flixel.FlxPoint;
	import org.flixel.FlxSprite;
	import org.flixel.FlxTileblock;
	import org.flixel.FlxG;
	import sprite.strategy.*;
	import sprite.state.*;
	/**
	 * ...
	 * @author Oskar
	 */
	public class BallBoss extends GameSprite 
	{
		public var face:FlxGroup = new FlxGroup;
		public var hazards:FlxGroup = new FlxGroup;
		[Embed(source = "assets/Mouth.png")]private var mouthPNG:Class;
		[Embed(source = "assets/BossAlt.png")]private var ballPNG:Class;
		public var mouth:Mouth;
		public var spray:Spray;
		private var originalWidth:Number;
		private var originalHeight:Number;
		
		public var floatLocation:FlxPoint;
		public function BallBoss(X:Number, Y:Number, SimpleGraphic:Class=null) 
		{
			super(X, Y);
			floatLocation = new FlxPoint(X, Y);
			loadGraphic(ballPNG, true, false, 40, 40, false);
			addAnimation("idle", [0, 1, 2, 3, 4, 5, 6, 7, 8, 9, 10, 11, 12, 13, 14, 15], 15, true);		
			addAnimation("reverse", [0, 15, 14, 13, 12, 11, 10, 9, 8, 7, 6, 5, 4, 3, 2, 1], 15, true);
			state = new BossIdleState(this);
			scale.x = 4;
			scale.y = 4;
			originalHeight = height;
			originalWidth = width;
			
			
		
			elasticity = .5;
			face.add(new EyeBall(X + 40, Y + 70));
			
			//eyeball width is 19
			face.add(new EyeBall(X + width - 40 - 19, Y + 70));
			//mouth width is 58			
			mouth = new Mouth(X + width/2-58/2, Y + 120);
			face.add(mouth);
			
		strategy = new BossStrategy(this);
			init();
		}
		public function init():void {
			Registry.bossLayer.add(face.members[0].group);
				Registry.bossLayer.add(face.members[1].group);
				Registry.bossLayer.add(face);
		}
		public function addHazard(hazard:FlxSprite):void {
			hazards.add(hazard);
			
		}
		public function scaleAlign():void {
			width = originalWidth * scale.x;
			height = originalHeight * scale.y;
			offset.x = -(scale.x-1) / 2 * width / scale.x;
			offset.y = -(scale.y-1) / 2 * height / scale.y;
			for each(var s:FlxSprite in face.members)
				sprScaleAlign(s);
			
		}
		public function sprScaleAlign(s:FlxSprite):void {
				var w:Number = s.scale.x;
				var h:Number = s.scale.y;
				s.scale.x = scale.x / 4;
				s.scale.y = scale.y / 4;
				s.width = s.scale.x / w * s.width;
				s.height = s.scale.y / h * s.height;
			s.offset.x = -(s.scale.x-1) / 2 * s.width / s.scale.x;
			s.offset.y = -(s.scale.y-1) / 2 * s.height / s.scale.y;
		}
		public function align():void {
			
			face.members[0].x = x+(40)* scale.x / 4;//TODO need to rotate
			face.members[0].y = y + (70 )* scale.x / 4;
			face.members[1].x = x + width -(40 + 19) * scale.x / 4;
			face.members[1].y = y + 70 * scale.x / 4;
				
			face.members[2].x = x + width / 2 - 58 * scale.x / 8;
			face.members[2].y = y + 120 * scale.y / 4;
			
		}
		
		override public function update():void {
			state.animate();
			if(spray!=null)
			spray.update();
			if (FlxG.keys.S) {
				scale.x -= .05;
				scale.y = scale.x;
				
			}
				if (FlxG.keys.W) {
				scale.x += .05;
				scale.y = scale.x;
				
			}
			align();
			scaleAlign();
			angle = Math.atan2(-velocity.x , velocity.y) /2/Math.PI* 360;
		}
		
		public function makeSpray(hazard:FlxSprite):void {
			spray=new Spray(hazard.x - x-width/2, hazard.y - y-height/2,this)
			
		}
		public function resetState():void {
			state = new BossIdleState(this);
			acceleration.y = 0;
			acceleration.x = 0;
		face.members[0].play("idle");
		face.members[1].play("idle");
		}
		
	}

}
import org.flixel.FlxGroup;
import sprite.BallBoss;
import sprite.VanishingBall;
import sprite.state.BossIdleState;
import org.flixel.FlxG;
class Spray  {
	private var x:Number;
	public var y:Number;
	private var ballBoss:BallBoss;
	private var counter:Number = 0;
	public function Spray(X:Number, Y:Number, ballBoss:BallBoss) {
		this.ballBoss = ballBoss;
		x = X;
		y = Y;
		FlxG.watch(this,"y","y")
	}
	public function update():void {
		if (counter > 100){
		ballBoss.spray = null;
		ballBoss.resetState();
		}
		if(counter%5==0){
		Registry.projectiles.add(new VanishingBall(ballBoss.x +ballBoss.width/2+ x, ballBoss.y+ballBoss.height/2 + y, (Math.sin(counter) + 2) * (x ) , Math.cos(counter) * 7));
		var dx:Number = ballBoss.scale.x / 50;
		var dy:Number = ballBoss.scale.y / 50;
		ballBoss.scale.x -= dx
		ballBoss.scale.y -=dy
		x = x * (1 - dx);
		y = y * (1 - dy);
		
		ballBoss.scaleAlign();
		ballBoss.velocity.x += ( -x) * 2;
		ballBoss.velocity.y += 100 - ballBoss.y;
		ballBoss.angle = Math.atan2(ballBoss.velocity.x,ballBoss.velocity.y);
		}
		
		counter++;
	}
	
}