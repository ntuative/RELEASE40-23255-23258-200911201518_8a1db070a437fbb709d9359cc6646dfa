package com.sulake.habbo.avatar.structure.figure
{
   import flash.geom.ColorTransform;
   
   public class PartColor implements IPartColor
   {
       
      
      private var _id:int;
      
      private var var_1429:uint;
      
      private var var_967:uint;
      
      private var _index:int;
      
      private var var_1952:int;
      
      private var var_1427:Number;
      
      private var _b:uint;
      
      private var var_1430:Number;
      
      private var var_1431:uint;
      
      private var _colorTransform:ColorTransform;
      
      private var var_1428:Number;
      
      private var var_1849:Boolean = false;
      
      public function PartColor(param1:XML)
      {
         super();
         _id = parseInt(param1.@id);
         _index = parseInt(param1.@index);
         var_1952 = parseInt(param1.@club);
         var_1849 = Boolean(parseInt(param1.@selectable));
         var _loc2_:String = param1.text();
         var_967 = parseInt(_loc2_,16);
         var_1429 = var_967 >> 16 & 255;
         var_1431 = var_967 >> 8 & 255;
         _b = var_967 >> 0 & 255;
         var_1428 = var_1429 / 255 * 1;
         var_1430 = var_1431 / 255 * 1;
         var_1427 = _b / 255 * 1;
         _colorTransform = new ColorTransform(var_1428,var_1430,var_1427);
      }
      
      public function get colorTransform() : ColorTransform
      {
         return _colorTransform;
      }
      
      public function get rgb() : uint
      {
         return var_967;
      }
      
      public function get index() : int
      {
         return _index;
      }
      
      public function get id() : int
      {
         return _id;
      }
      
      public function get blueMultiplier() : Number
      {
         return var_1427;
      }
      
      public function get r() : uint
      {
         return var_1429;
      }
      
      public function get isSelectable() : Boolean
      {
         return var_1849;
      }
      
      public function get b() : uint
      {
         return _b;
      }
      
      public function get greenMultiplier() : Number
      {
         return var_1430;
      }
      
      public function get g() : uint
      {
         return var_1431;
      }
      
      public function get redMultiplier() : Number
      {
         return var_1428;
      }
      
      public function get club() : int
      {
         return var_1952;
      }
   }
}
