package com.sulake.habbo.room.object.visualization.furniture
{
   public class FurnitureValRandomizerVisualization extends AnimatedFurnitureVisualization
   {
      
      private static const const_1033:int = 31;
      
      private static const const_1032:int = 32;
      
      private static const const_480:int = 30;
      
      private static const const_742:int = 20;
      
      private static const const_479:int = 10;
       
      
      private var var_549:Boolean = false;
      
      private var var_217:Array;
      
      public function FurnitureValRandomizerVisualization()
      {
         var_217 = new Array();
         super();
         super.setAnimation(const_480);
      }
      
      override protected function setAnimation(param1:int) : void
      {
         if(param1 == 0)
         {
            var_549 = true;
            var_217 = new Array();
            var_217.push(const_1033);
            var_217.push(const_1032);
            return;
         }
         if(param1 > 0 && param1 <= const_479)
         {
            if(var_549)
            {
               var_549 = false;
               var_217 = new Array();
               if(_direction == 2)
               {
                  var_217.push(const_742 + 5 - param1);
                  var_217.push(const_479 + 5 - param1);
               }
               else
               {
                  var_217.push(const_742 + param1);
                  var_217.push(const_479 + param1);
               }
               var_217.push(const_480);
               return;
            }
            super.setAnimation(const_480);
         }
      }
      
      override protected function updateAnimation(param1:Number) : Boolean
      {
         if(super.getLastFramePlayed(11))
         {
            if(false)
            {
               super.setAnimation(var_217.shift());
            }
         }
         return super.updateAnimation(param1);
      }
   }
}
