package com.sulake.habbo.sound.object
{
   import com.sulake.habbo.sound.IHabboSound;
   import flash.events.Event;
   import flash.media.Sound;
   import flash.media.SoundChannel;
   import flash.media.SoundTransform;
   
   public class HabboSound implements IHabboSound
   {
       
      
      private var var_879:SoundChannel = null;
      
      private var var_720:Boolean;
      
      private var var_880:Sound = null;
      
      private var var_607:Number;
      
      public function HabboSound(param1:Sound)
      {
         super();
         var_880 = param1;
         var_880.addEventListener(Event.COMPLETE,onComplete);
         var_607 = 1;
         var_720 = false;
      }
      
      public function get finished() : Boolean
      {
         return !var_720;
      }
      
      public function stop() : Boolean
      {
         var_879.stop();
         return true;
      }
      
      public function play() : Boolean
      {
         var_720 = false;
         var_879 = var_880.play(0);
         this.volume = var_607;
         return true;
      }
      
      public function set position(param1:Number) : void
      {
      }
      
      public function get volume() : Number
      {
         return var_607;
      }
      
      public function get ready() : Boolean
      {
         return true;
      }
      
      public function get position() : Number
      {
         return var_879.position;
      }
      
      public function get length() : Number
      {
         return var_880.length;
      }
      
      public function set volume(param1:Number) : void
      {
         var_607 = param1;
         if(var_879 != null)
         {
            var_879.soundTransform = new SoundTransform(var_607);
         }
      }
      
      private function onComplete(param1:Event) : void
      {
         var_720 = true;
      }
   }
}
