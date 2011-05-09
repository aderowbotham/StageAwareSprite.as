package com.aderowbotham.utils {
	

	/**
	 * @author Ade Rowbotham | www.piratalondon.com, www.aderowbotham.com
	 * @copyright 2010
	 **/
	 
	import flash.display.Sprite;
	import flash.events.Event;	

	public class StageAwareSprite extends Sprite {		
		
		protected var stageWidth:int;
		protected var stageHeight:int;
		
		public function StageAwareSprite() {	
			
			super();			
			this.addEventListener(Event.ADDED_TO_STAGE, _addedToStage,false,0,true);
			stageWidth = 1;
			stageHeight = 1;						
		}		
		
		final private function _addedToStage(event:Event):void{
			stageWidth = this.stage.stageWidth;
			stageHeight = this.stage.stageHeight;
			
			this.removeEventListener(Event.ADDED_TO_STAGE, _addedToStage);
			this.stage.addEventListener(Event.RESIZE, _stageResize,false,0,true);
			this.addEventListener(Event.REMOVED_FROM_STAGE,_removedFromStage,false,0,true);
			addedToStage();
		}
		
		final private function _removedFromStage(event:Event):void{			
			if(this.stage != null){
				if(this.stage.hasEventListener(Event.RESIZE))
					this.stage.removeEventListener(Event.RESIZE, _stageResize);	
			}			
			this.removeEventListener(Event.REMOVED_FROM_STAGE,_removedFromStage);	
			this.addEventListener(Event.ADDED_TO_STAGE, _addedToStage,false,0,true);
			removedFromStage();	
		}
		
		final private function _stageResize(event:Event):void{			
			stageWidth = this.stage.stageWidth;
			stageHeight = this.stage.stageHeight;			
			stageResize();
		}
		
		protected function addedToStage():void{
			return;	
		}
		
		protected function removedFromStage():void{
			return;	
		}
		
		protected function stageResize():void{
			return;
		}
		
	}
}

