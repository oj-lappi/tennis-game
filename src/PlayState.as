package  
{
	import level.*;
	import org.flixel.*;
	import sprite.*
	import flash.display.StageDisplayState;

	public class PlayState extends FlxState
	{
		public var rooms:Array;
		public function PlayState(){
		}
		override public function create():void{
			FlxG.bgColor = 0xff5599c4;	
			
			Registry.playstate = this;
			Registry.justEntered = false;
			rooms = [new TestLevel,new DesertLevel,new UFOLevel,new TennisTestLevel,new TenniscourtsLevel,new TowerRoom,new MansionLevel,new BossRoom];
			Registry.room = rooms[0];
			
		
			
			Registry.player = new Player(40, Registry.room.height - 40);
			
			//make spritegroups appear
			add(Registry.smokeLayer);
			add(Registry.backgroundLayer);
			add(Registry.room);
			add(Registry.effects);
		
			add(Registry.npcs);
			add(Registry.enemies);
			add(Registry.bossLayer);
		//	add(Registry.player);
			add(Registry.playerLayer);
			add(Registry.projectiles)
		
			
			add(Registry.grounded);
			
			
			add(new Ufo(0, 0, this));
			//Registry.enemies.add(Registry.bgEnemies);
			
			//TEST STUFF
			
			Registry.npcs.add(new Cat(40, 40));

			
			
			//END TEST STUFF
			
			
			FlxG.camera.setBounds(0, 0,Registry.room.width, Registry.room.height);
			FlxG.camera.follow(Registry.player, FlxCamera.STYLE_PLATFORMER);
			FlxG.worldBounds.make(Registry.room.width, Registry.room.height);
			
			FlxG.watch(	Registry.player.acceleration, "x", "ax");
			FlxG.watch(	Registry.player.velocity, "x", "vx");
			FlxG.watch(	Registry.player.velocity, "y", "vy");
			
			Registry.room.init();
			FlxG.stage.displayState = StageDisplayState.FULL_SCREEN;
		}
		
		override public function update():void{
			super.update();
			
			FlxG.collide(Registry.player, Registry.room);
		
			FlxG.collide(Registry.projectiles, Registry.room);
			FlxG.collide(Registry.npcs, Registry.room);
			FlxG.collide(Registry.enemies, Registry.room);
		
			FlxG.collide(Registry.grounded, Registry.room) // Håller koll på bollar som ska vara på marken
			
			
			
			if (FlxG.overlap(Registry.enemies, Registry.player)) 
				Registry.player.state.hurt();
					
			if (FlxG.keys.justReleased("DOWN"))
			Registry.justEntered = false;
			
					
			//DEBUG STUFf
			if (FlxG.keys.justPressed("B")) {
				var miss:Missile = new Missile(Registry.player.x, 0,new FlxPoint(50,400));
				
				Registry.backgroundLayer.add(miss)
				
			
			}
			if (FlxG.keys.justPressed("G")) {
				var d:Gorilla= new Gorilla(Registry.player.x, 40);
				Registry.enemies.add(d);
			}
			if (FlxG.keys.ONE){
				Registry.npcs.add(new Cat(Math.floor(Math.random() * 80)+Registry.player.x,40));
			}
			
			if (FlxG.keys.justPressed("TWO")) {
				var boss:BossBall = new BossBall(Registry.player.x, 40);
				Registry.projectiles.add(boss);
			}
			if (FlxG.keys.justPressed("THREE")) {
				var statue:TennisStatue = new TennisStatue(Registry.player.x, Registry.player.y-10,Registry.player.facing);
				Registry.npcs.add(statue);
			}
			if (FlxG.keys.FOUR&&FlxG.keys.justPressed("FOUR")) {
				Registry.enemies.add(new Hunter(Registry.player.x, 40));
			}
			if (FlxG.keys.FIVE && FlxG.keys.justPressed("FIVE")) {
				var h:Hut = new Hut(Registry.player.x, Registry.player.y-100);
				Registry.backgroundLayer.add(h);
				h.addHunter();
			}
			if (FlxG.keys.SIX&&FlxG.keys.justPressed("SIX")) {
				Registry.backgroundLayer.add(new SmokeMachine(Registry.player.x, Registry.player.y-60 ));
			}
			if (FlxG.keys.SEVEN&&FlxG.keys.justPressed("SEVEN")) {
				Registry.npcs.add(new GiantHead(Registry.player.x,40));
			}
			
				if (FlxG.keys.EIGHT&&FlxG.keys.justPressed("EIGHT")){
				Registry.backgroundLayer.add(new Rosedoor(Registry.player.x, Registry.player.y-100 ));
			}
				if (FlxG.keys.Q&&FlxG.keys.justPressed("Q")){
				loadRoom(0,0);
			}
			if (FlxG.keys.NINE&&FlxG.keys.justPressed("NINE")){
				Registry.projectiles.add(new HomingMeteorite(Registry.player.x, 1,50,100,false ));
			}	
			if (FlxG.keys.justPressed("Z")) {
			Registry.player.state.tryToSwing();
			
			}
			
			var sign:int = (Registry.player.facing==FlxObject.LEFT?-1:1);
			
			if (Registry.bouncy == true) {
				
				if (FlxG.keys.justPressed("X")) {
				
			Registry.projectiles.add(new BouncyBall(Registry.player.getMidpoint().x+sign*15,Registry.player.y-10,200*sign,0));
			
			}
				
				
			}
			else {
				
				if (FlxG.keys.justPressed("X")) {
	
			Registry.projectiles.add(new Ball(Registry.player.getMidpoint().x+sign*15,Registry.player.y,100*sign,0));
			
			}
				
				
			}
			
			
		//player sprite alignment
			Registry.player.torso.facing = Registry.player.facing;
			Registry.player.torso.x = Registry.player.x;
			Registry.player.torso.y = Registry.player.y;
		switch(Registry.player.torso.frame) {
		case 1:
		case 8:
			if (Registry.player.frame == 6 || Registry.player.frame == 13||Registry.player.frame==15||Registry.player.frame==16)
			Registry.player.torso.frame = 1;
			else
			Registry.player.torso.frame = 8;
			break;
		case 2:
		case 9:
			if (Registry.player.frame == 6 || Registry.player.frame == 13||Registry.player.frame==15||Registry.player.frame==16)
			Registry.player.torso.frame = 2;
			else
			Registry.player.torso.frame = 9;
			Registry.player.torso.x += Registry.player.facing == FlxObject.RIGHT?1: -1;
			break;
		default:
			if (Registry.player.frame == 6 || Registry.player.frame == 13)
		
			Registry.player.torso.frame = 3;
			else
				Registry.player.torso.frame = 0;
					if (Registry.player.frame == 8 || Registry.player.frame == 9||Registry.player.frame==1||Registry.player.frame==2)
			Registry.player.torso.frame = 4;
		
		}
	
		
		}
		public function loadRoom(roomIndex:int, entryIndex:int):void {
			
			var oldRoom:FlxGroup = Registry.room;
			
			if (roomIndex == 3) { //Ser till att bollarna studsar när man är på tennisplanen
				
				Registry.bouncy = true; 
				
			} else {
				
				Registry.bouncy = false;
				
			}
			
			Registry.room = rooms[roomIndex];
			Registry.backgroundLayer.clear();
			Registry.collidableEnemies.clear();
			Registry.effects.clear();
			Registry.enemies.clear();
			Registry.npcs.clear();
			Registry.bossLayer.clear();
			Registry.projectiles.clear();
			Registry.smokeLayer.clear();
			Registry.grounded.clear();
			remove(oldRoom);
			
			add(Registry.room);
			Registry.room.init();
			Registry.room.setplayer(entryIndex);
			FlxG.camera.setBounds(0, 0,Registry.room.width, Registry.room.height);
			FlxG.camera.follow(Registry.player, FlxCamera.STYLE_PLATFORMER);
			FlxG.worldBounds.make(Registry.room.width, Registry.room.height);
		
		}
	}
}
