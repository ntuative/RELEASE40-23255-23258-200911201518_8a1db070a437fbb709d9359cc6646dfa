package com.sulake.habbo.inventory.effects
{
   import com.sulake.habbo.inventory.common.IThumbListDrawableItem;
   import com.sulake.habbo.widget.memenu.IWidgetAvatarEffect;
   import flash.display.BitmapData;
   
   public class Effect implements IWidgetAvatarEffect, IThumbListDrawableItem
   {
       
      
      private var _isSelected:Boolean = false;
      
      private var var_1534:Date;
      
      private var var_1044:Boolean = false;
      
      private var _type:int;
      
      private var var_346:BitmapData;
      
      private var var_261:Boolean = false;
      
      private var var_1137:int;
      
      private var var_494:int = 1;
      
      private var var_871:int;
      
      public function Effect()
      {
         super();
      }
      
      public function get icon() : BitmapData
      {
         return var_346;
      }
      
      public function set type(param1:int) : void
      {
         _type = param1;
      }
      
      public function setOneEffectExpired() : void
      {
         --var_494;
         if(var_494 < 0)
         {
            var_494 = 0;
         }
         var_871 = var_1137;
         var_261 = false;
         var_1044 = false;
      }
      
      public function set isSelected(param1:Boolean) : void
      {
         _isSelected = param1;
      }
      
      public function set secondsLeft(param1:int) : void
      {
         var_871 = param1;
      }
      
      public function get isActive() : Boolean
      {
         return var_261;
      }
      
      public function set iconImage(param1:BitmapData) : void
      {
         var_346 = param1;
      }
      
      public function get duration() : int
      {
         return var_1137;
      }
      
      public function get isInUse() : Boolean
      {
         return var_1044;
      }
      
      public function get effectsInInventory() : int
      {
         return var_494;
      }
      
      public function get iconImage() : BitmapData
      {
         return var_346;
      }
      
      public function get isSelected() : Boolean
      {
         return _isSelected;
      }
      
      public function set isActive(param1:Boolean) : void
      {
         if(param1 && !var_261)
         {
            var_1534 = new Date();
         }
         var_261 = param1;
      }
      
      public function set effectsInInventory(param1:int) : void
      {
         var_494 = param1;
      }
      
      public function get secondsLeft() : int
      {
         var _loc1_:int = 0;
         if(var_261)
         {
            _loc1_ = var_871 - (new Date().valueOf() - var_1534.valueOf()) / 1000;
            _loc1_ = Math.floor(_loc1_);
            if(_loc1_ < 0)
            {
               _loc1_ = 0;
            }
            return _loc1_;
         }
         return var_871;
      }
      
      public function set isInUse(param1:Boolean) : void
      {
         var_1044 = param1;
      }
      
      public function set duration(param1:int) : void
      {
         var_1137 = param1;
      }
      
      public function get type() : int
      {
         return _type;
      }
   }
}
