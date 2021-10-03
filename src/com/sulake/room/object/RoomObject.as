package com.sulake.room.object
{
   import com.sulake.room.object.logic.IRoomObjectEventHandler;
   import com.sulake.room.object.logic.IRoomObjectMouseHandler;
   import com.sulake.room.object.visualization.IRoomObjectVisualization;
   import com.sulake.room.utils.IVector3d;
   import com.sulake.room.utils.Vector3d;
   
   public class RoomObject implements IRoomObjectController
   {
      
      private static var var_1268:int = 0;
       
      
      private var var_76:Vector3d;
      
      private var _updateID:uint;
      
      private var _type:String = "";
      
      private var _visualization:IRoomObjectVisualization;
      
      private var var_90:RoomObjectModel;
      
      private var var_407:IRoomObjectEventHandler;
      
      private var var_1495:Vector3d;
      
      private var var_2113:int = 0;
      
      private var _id:int;
      
      private var var_1496:Vector3d;
      
      private var var_221:Vector3d;
      
      private var var_484:Array;
      
      public function RoomObject(param1:int, param2:uint)
      {
         super();
         _id = param1;
         var_76 = new Vector3d();
         var_221 = new Vector3d();
         var_1495 = new Vector3d();
         var_1496 = new Vector3d();
         var_484 = new Array(param2);
         var _loc3_:Number = param2 - 1;
         while(_loc3_ >= 0)
         {
            var_484[_loc3_] = 0;
            _loc3_--;
         }
         var_90 = new RoomObjectModel();
         _visualization = null;
         var_407 = null;
         _updateID = 0;
         var_2113 = var_1268++;
      }
      
      public function getInstanceId() : int
      {
         return var_2113;
      }
      
      public function getId() : int
      {
         return _id;
      }
      
      public function getUpdateID() : uint
      {
         return _updateID;
      }
      
      public function dispose() : void
      {
         var_76 = null;
         var_221 = null;
         if(var_90 != null)
         {
            var_90.dispose();
            var_90 = null;
         }
         var_484 = null;
         setVisualization(null);
         setEventHandler(null);
      }
      
      public function getType() : String
      {
         return _type;
      }
      
      public function getLocation() : IVector3d
      {
         var_1495.assign(var_76);
         return var_1495;
      }
      
      public function setLocation(param1:IVector3d) : void
      {
         if(param1 == null)
         {
            return;
         }
         if(var_76.x != param1.x || var_76.y != param1.y || var_76.z != param1.z)
         {
            var_76.x = param1.x;
            var_76.y = param1.y;
            var_76.z = param1.z;
            ++_updateID;
         }
      }
      
      public function setDirection(param1:IVector3d) : void
      {
         if(param1 == null)
         {
            return;
         }
         if(var_221.x != param1.x || var_221.y != param1.y || var_221.z != param1.z)
         {
            var_221.x = (param1.x % 360 + 360) % 360;
            var_221.y = (param1.y % 360 + 360) % 360;
            var_221.z = (param1.z % 360 + 360) % 360;
            ++_updateID;
         }
      }
      
      public function setType(param1:String) : void
      {
         _type = param1;
      }
      
      public function getEventHandler() : IRoomObjectEventHandler
      {
         return var_407;
      }
      
      public function getDirection() : IVector3d
      {
         var_1496.assign(var_221);
         return var_1496;
      }
      
      public function setState(param1:int, param2:uint) : Boolean
      {
         if(param2 < var_484.length)
         {
            if(var_484[param2] != param1)
            {
               var_484[param2] = param1;
               ++_updateID;
            }
            return true;
         }
         return false;
      }
      
      public function setEventHandler(param1:IRoomObjectEventHandler) : void
      {
         if(param1 == var_407)
         {
            return;
         }
         var _loc2_:IRoomObjectEventHandler = var_407;
         if(_loc2_ != null)
         {
            var_407 = null;
            _loc2_.object = null;
         }
         var_407 = param1;
         if(var_407 != null)
         {
            var_407.object = this;
         }
      }
      
      public function getState(param1:uint) : int
      {
         if(param1 < var_484.length)
         {
            return var_484[param1];
         }
         return -1;
      }
      
      public function setVisualization(param1:IRoomObjectVisualization) : void
      {
         if(param1 != _visualization)
         {
            if(_visualization != null)
            {
               _visualization.dispose();
            }
            _visualization = param1;
            if(_visualization != null)
            {
               _visualization.object = this;
            }
         }
      }
      
      public function getVisualization() : IRoomObjectVisualization
      {
         return _visualization;
      }
      
      public function getModel() : IRoomObjectModel
      {
         return var_90;
      }
      
      public function getModelController() : IRoomObjectModelController
      {
         return var_90;
      }
      
      public function getMouseHandler() : IRoomObjectMouseHandler
      {
         return getEventHandler();
      }
   }
}
