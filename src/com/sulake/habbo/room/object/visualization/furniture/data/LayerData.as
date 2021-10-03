package com.sulake.habbo.room.object.visualization.furniture.data
{
   public class LayerData
   {
      
      public static const const_341:int = 255;
      
      public static const INK_DARKEN:int = 3;
      
      public static const const_543:int = 0;
      
      public static const const_877:int = 2;
      
      public static const const_831:int = 1;
      
      public static const const_513:Boolean = false;
      
      public static const const_704:String = "";
      
      public static const const_342:int = 0;
      
      public static const const_432:int = 0;
      
      public static const const_389:int = 0;
       
      
      private var var_2076:int = 0;
      
      private var var_1629:String = "";
      
      private var var_1443:int = 0;
      
      private var var_2075:int = 0;
      
      private var var_2077:Number = 0;
      
      private var var_1627:int = 255;
      
      private var var_2074:Boolean = false;
      
      public function LayerData()
      {
         super();
      }
      
      public function get yOffset() : int
      {
         return var_2076;
      }
      
      public function copyValues(param1:LayerData) : void
      {
         if(param1 != null)
         {
            tag = param1.tag;
            ink = param1.ink;
            alpha = param1.alpha;
            ignoreMouse = param1.ignoreMouse;
            xOffset = param1.xOffset;
            yOffset = param1.yOffset;
            zOffset = param1.zOffset;
         }
      }
      
      public function set ink(param1:int) : void
      {
         var_1443 = param1;
      }
      
      public function get zOffset() : Number
      {
         return var_2077;
      }
      
      public function set xOffset(param1:int) : void
      {
         var_2075 = param1;
      }
      
      public function set yOffset(param1:int) : void
      {
         var_2076 = param1;
      }
      
      public function get tag() : String
      {
         return var_1629;
      }
      
      public function get alpha() : int
      {
         return var_1627;
      }
      
      public function get ink() : int
      {
         return var_1443;
      }
      
      public function set zOffset(param1:Number) : void
      {
         var_2077 = param1;
      }
      
      public function get xOffset() : int
      {
         return var_2075;
      }
      
      public function set ignoreMouse(param1:Boolean) : void
      {
         var_2074 = param1;
      }
      
      public function get ignoreMouse() : Boolean
      {
         return var_2074;
      }
      
      public function set tag(param1:String) : void
      {
         var_1629 = param1;
      }
      
      public function set alpha(param1:int) : void
      {
         var_1627 = param1;
      }
   }
}
