package com.sulake.habbo.avatar
{
   import com.sulake.habbo.avatar.actions.IActionDefinition;
   import com.sulake.habbo.avatar.structure.figure.IPartColor;
   import flash.geom.ColorTransform;
   
   public class AvatarImagePartContainer
   {
       
      
      private var _frames:Array;
      
      private var var_1764:int;
      
      private var var_1769:String;
      
      private var var_1370:IActionDefinition;
      
      private var var_1767:Boolean;
      
      private var _color:IPartColor;
      
      private var var_1766:String;
      
      private var var_1765:String;
      
      private var var_1508:Boolean;
      
      private var var_1768:ColorTransform;
      
      private var var_1507:int;
      
      public function AvatarImagePartContainer(param1:String, param2:String, param3:int, param4:IPartColor, param5:Array, param6:IActionDefinition, param7:Boolean, param8:int, param9:String = "", param10:Boolean = false, param11:Number = 1)
      {
         super();
         var_1769 = param1;
         var_1766 = param2;
         var_1764 = param3;
         _color = param4;
         _frames = param5;
         var_1370 = param6;
         var_1508 = param7;
         var_1507 = param8;
         var_1765 = param9;
         var_1767 = param10;
         var_1768 = new ColorTransform(1,1,1,param11);
      }
      
      public function get isColorable() : Boolean
      {
         return var_1508;
      }
      
      public function get partType() : String
      {
         return var_1766;
      }
      
      public function getFrameIndex(param1:int) : int
      {
         return 0;
      }
      
      public function get paletteMapId() : int
      {
         return var_1507;
      }
      
      public function get isBlendable() : Boolean
      {
         return var_1767;
      }
      
      public function get color() : IPartColor
      {
         return _color;
      }
      
      public function get partId() : int
      {
         return var_1764;
      }
      
      public function get flippedPartType() : String
      {
         return var_1765;
      }
      
      public function get bodyPartId() : String
      {
         return var_1769;
      }
      
      public function get action() : IActionDefinition
      {
         return var_1370;
      }
      
      public function get blendTransform() : ColorTransform
      {
         return var_1768;
      }
   }
}
