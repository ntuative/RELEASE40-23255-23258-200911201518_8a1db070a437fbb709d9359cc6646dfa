package com.sulake.habbo.room.utils
{
   public class RoomInstanceData
   {
       
      
      private var var_828:LegacyWallGeometry = null;
      
      private var var_564:SelectedRoomObjectData = null;
      
      private var _roomCategory:int = 0;
      
      private var var_563:TileHeightMap = null;
      
      private var var_2057:String = null;
      
      private var _roomId:int = 0;
      
      private var var_829:RoomCamera = null;
      
      public function RoomInstanceData(param1:int, param2:int)
      {
         super();
         _roomId = param1;
         _roomCategory = param2;
         var_828 = new LegacyWallGeometry();
         var_829 = new RoomCamera();
      }
      
      public function set tileHeightMap(param1:TileHeightMap) : void
      {
         if(var_563 != null)
         {
            var_563.dispose();
         }
         var_563 = param1;
      }
      
      public function get roomId() : int
      {
         return _roomId;
      }
      
      public function set worldType(param1:String) : void
      {
         var_2057 = param1;
      }
      
      public function get legacyGeometry() : LegacyWallGeometry
      {
         return var_828;
      }
      
      public function get roomCamera() : RoomCamera
      {
         return var_829;
      }
      
      public function dispose() : void
      {
         if(var_563 != null)
         {
            var_563.dispose();
            var_563 = null;
         }
         if(var_828 != null)
         {
            var_828.dispose();
            var_828 = null;
         }
         if(var_829 != null)
         {
            var_829.dispose();
            var_829 = null;
         }
         if(var_564 != null)
         {
            var_564.dispose();
            var_564 = null;
         }
      }
      
      public function get tileHeightMap() : TileHeightMap
      {
         return var_563;
      }
      
      public function get worldType() : String
      {
         return var_2057;
      }
      
      public function set selectedObject(param1:SelectedRoomObjectData) : void
      {
         if(var_564 != null)
         {
            var_564.dispose();
         }
         var_564 = param1;
      }
      
      public function get roomCategory() : int
      {
         return _roomCategory;
      }
      
      public function get selectedObject() : SelectedRoomObjectData
      {
         return var_564;
      }
   }
}
