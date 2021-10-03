package com.sulake.habbo.room.messages
{
   import com.sulake.room.messages.RoomObjectUpdateMessage;
   import com.sulake.room.utils.IVector3d;
   import com.sulake.room.utils.Vector3d;
   
   public class RoomObjectRoomMaskUpdateMessage extends RoomObjectUpdateMessage
   {
      
      public static const const_1183:String = "door";
      
      public static const const_368:String = "window";
      
      public static const const_690:String = "RORMUM_ADD_MASK";
      
      public static const const_460:String = "RORMUM_ADD_MASK";
      
      public static const const_203:String = "hole";
       
      
      private var var_1783:String = "";
      
      private var var_1782:String = "";
      
      private var var_1784:String = "window";
      
      private var var_1785:Vector3d = null;
      
      private var _type:String = "";
      
      public function RoomObjectRoomMaskUpdateMessage(param1:String, param2:String, param3:String = null, param4:IVector3d = null, param5:String = "window")
      {
         super(null,null);
         _type = param1;
         var_1782 = param2;
         var_1783 = param3;
         if(param4 != null)
         {
            var_1785 = new Vector3d(param4.x,param4.y,param4.z);
         }
         var_1784 = param5;
      }
      
      public function get maskCategory() : String
      {
         return var_1784;
      }
      
      public function get maskId() : String
      {
         return var_1782;
      }
      
      public function get maskLocation() : IVector3d
      {
         return var_1785;
      }
      
      public function get maskType() : String
      {
         return var_1783;
      }
      
      public function get type() : String
      {
         return _type;
      }
   }
}
