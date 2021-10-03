package com.sulake.room.renderer.cache
{
   import com.sulake.room.utils.IVector3d;
   import com.sulake.room.utils.Vector3d;
   
   public class RoomObjectLocationCacheItem
   {
       
      
      private var var_1702:int = -1;
      
      private var var_1088:int = -1;
      
      private var var_605:Vector3d = null;
      
      public function RoomObjectLocationCacheItem()
      {
         super();
         var_605 = new Vector3d();
      }
      
      public function get objectUpdateId() : int
      {
         return var_1702;
      }
      
      public function set objectUpdateId(param1:int) : void
      {
         var_1702 = param1;
      }
      
      public function set screenLoc(param1:IVector3d) : void
      {
         var_605.assign(param1);
         var_605.x = Math.round(var_605.x);
         var_605.y = Math.round(var_605.y);
      }
      
      public function set geometryUpdateId(param1:int) : void
      {
         var_1088 = param1;
      }
      
      public function get screenLoc() : IVector3d
      {
         return var_605;
      }
      
      public function get geometryUpdateId() : int
      {
         return var_1088;
      }
   }
}
