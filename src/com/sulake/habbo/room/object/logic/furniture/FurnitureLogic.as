package com.sulake.habbo.room.object.logic.furniture
{
   import com.sulake.habbo.room.events.RoomObjectRoomAdEvent;
   import com.sulake.habbo.room.messages.RoomObjectDataUpdateMessage;
   import com.sulake.habbo.room.messages.RoomObjectItemDataUpdateMessage;
   import com.sulake.habbo.room.object.RoomObjectVariableEnum;
   import com.sulake.habbo.room.object.logic.MovingObjectLogic;
   import com.sulake.room.events.RoomObjectEvent;
   import com.sulake.room.events.RoomObjectMouseEvent;
   import com.sulake.room.events.RoomSpriteMouseEvent;
   import com.sulake.room.messages.RoomObjectUpdateMessage;
   import com.sulake.room.object.IRoomObjectModelController;
   import com.sulake.room.utils.IRoomGeometry;
   import com.sulake.room.utils.IVector3d;
   import com.sulake.room.utils.Vector3d;
   import com.sulake.room.utils.XMLValidator;
   import flash.events.MouseEvent;
   
   public class FurnitureLogic extends MovingObjectLogic
   {
       
      
      private var var_982:Number = 0;
      
      private var var_662:Boolean = false;
      
      private var var_2014:Number = 0;
      
      private var var_2015:Number = 0;
      
      private var var_1219:Number = 0;
      
      private var var_981:Number = 0;
      
      private var var_983:Number = 0;
      
      private var var_215:Array;
      
      public function FurnitureLogic()
      {
         var_215 = [];
         super();
      }
      
      override public function processUpdateMessage(param1:RoomObjectUpdateMessage) : void
      {
         var _loc2_:IRoomObjectModelController = object.getModelController();
         var _loc3_:RoomObjectDataUpdateMessage = param1 as RoomObjectDataUpdateMessage;
         if(_loc3_ != null)
         {
            object.setState(_loc3_.state,0);
            if(_loc2_ != null)
            {
               _loc2_.setString(RoomObjectVariableEnum.const_140,_loc3_.data);
            }
            return;
         }
         var _loc4_:RoomObjectItemDataUpdateMessage = param1 as RoomObjectItemDataUpdateMessage;
         if(_loc4_ != null)
         {
            if(_loc2_ != null)
            {
               _loc2_.setString(RoomObjectVariableEnum.const_832,_loc4_.itemData);
            }
            return;
         }
         var_662 = false;
         super.processUpdateMessage(param1);
      }
      
      override public function initialize(param1:XML) : void
      {
         var _loc7_:* = null;
         var _loc8_:int = 0;
         if(param1 == null)
         {
            return;
         }
         var_981 = 0;
         var_983 = 0;
         var_982 = 0;
         var_215 = [];
         var _loc2_:XMLList = param1.model.dimensions;
         if(_loc2_.length() == 0)
         {
            return;
         }
         var _loc3_:XMLList = _loc2_.@x;
         if(_loc3_.length() == 1)
         {
            var_981 = Number(_loc3_);
         }
         _loc3_ = _loc2_.@y;
         if(_loc3_.length() == 1)
         {
            var_983 = Number(_loc3_);
         }
         _loc3_ = _loc2_.@z;
         if(_loc3_.length() == 1)
         {
            var_982 = Number(_loc3_);
         }
         var_2014 = var_981 / 2;
         var_2015 = var_983 / 2;
         _loc3_ = _loc2_.@centerZ;
         if(_loc3_.length() == 1)
         {
            var_1219 = Number(_loc3_);
         }
         else
         {
            var_1219 = var_982 / 2;
         }
         var _loc4_:XMLList = param1.model.directions.direction;
         var _loc5_:* = ["id"];
         var _loc6_:int = 0;
         while(_loc6_ < _loc4_.length())
         {
            _loc7_ = _loc4_[_loc6_];
            if(XMLValidator.checkRequiredAttributes(_loc7_,_loc5_))
            {
               _loc8_ = parseInt(_loc7_.@id);
               var_215.push(_loc8_);
            }
            _loc6_++;
         }
         var_215.sort(Array.NUMERIC);
         if(object == null || object.getModelController() == null)
         {
            return;
         }
         object.getModelController().setNumber(RoomObjectVariableEnum.const_289,var_981,true);
         object.getModelController().setNumber(RoomObjectVariableEnum.const_340,var_983,true);
         object.getModelController().setNumber(RoomObjectVariableEnum.const_641,var_982,true);
         object.getModelController().setNumber(RoomObjectVariableEnum.const_1326,var_2014,true);
         object.getModelController().setNumber(RoomObjectVariableEnum.const_1240,var_2015,true);
         object.getModelController().setNumber(RoomObjectVariableEnum.const_791,var_1219,true);
         object.getModelController().setNumberArray(RoomObjectVariableEnum.const_549,var_215,true);
         object.getModelController().setNumber(RoomObjectVariableEnum.const_150,1);
      }
      
      override public function dispose() : void
      {
         super.dispose();
         var_215 = null;
      }
      
      override public function mouseEvent(param1:RoomSpriteMouseEvent, param2:IRoomGeometry) : void
      {
         var _loc6_:int = 0;
         var _loc7_:* = null;
         var _loc8_:* = null;
         var _loc9_:* = null;
         if(param1 == null || param2 == null)
         {
            return;
         }
         if(object == null)
         {
            return;
         }
         var _loc3_:* = null;
         switch(param1.type)
         {
            case MouseEvent.ROLL_OVER:
               if(!var_662)
               {
                  _loc3_ = object.getModel() as IRoomObjectModelController;
                  if(_loc3_ == null)
                  {
                     return;
                  }
                  _loc9_ = _loc3_.getString(RoomObjectVariableEnum.const_215);
                  if(eventDispatcher != null && _loc9_ != null && _loc9_.indexOf("http") == 0)
                  {
                     eventDispatcher.dispatchEvent(new RoomObjectRoomAdEvent(RoomObjectRoomAdEvent.const_316,_loc6_,_loc7_));
                  }
                  var_662 = true;
               }
               break;
            case MouseEvent.ROLL_OUT:
               if(var_662)
               {
                  _loc3_ = object.getModel() as IRoomObjectModelController;
                  if(_loc3_ == null)
                  {
                     return;
                  }
                  _loc9_ = _loc3_.getString(RoomObjectVariableEnum.const_215);
                  if(eventDispatcher != null && _loc9_ != null && _loc9_.indexOf("http") == 0)
                  {
                     eventDispatcher.dispatchEvent(new RoomObjectRoomAdEvent(RoomObjectRoomAdEvent.const_310,_loc6_,_loc7_));
                  }
                  var_662 = false;
               }
               break;
            case MouseEvent.DOUBLE_CLICK:
               _loc6_ = object.getId();
               _loc7_ = object.getType();
               _loc3_ = object.getModel() as IRoomObjectModelController;
               if(_loc3_ == null)
               {
                  return;
               }
               _loc9_ = _loc3_.getString(RoomObjectVariableEnum.const_215);
               if(eventDispatcher != null && _loc9_ != null && _loc9_.indexOf("http") == 0)
               {
                  eventDispatcher.dispatchEvent(new RoomObjectRoomAdEvent(RoomObjectRoomAdEvent.const_436,_loc6_,_loc7_));
               }
            case MouseEvent.CLICK:
               _loc6_ = object.getId();
               _loc7_ = object.getType();
               if(eventDispatcher != null)
               {
                  _loc8_ = new RoomObjectMouseEvent(RoomObjectMouseEvent.const_209,_loc6_,_loc7_,param1.altKey,param1.ctrlKey,param1.shiftKey,param1.buttonDown);
                  eventDispatcher.dispatchEvent(_loc8_);
               }
               _loc3_ = object.getModel() as IRoomObjectModelController;
               if(_loc3_ == null)
               {
                  return;
               }
               _loc9_ = _loc3_.getString(RoomObjectVariableEnum.const_215);
               if(eventDispatcher != null && _loc9_ != null && _loc9_.indexOf("http") == 0)
               {
                  eventDispatcher.dispatchEvent(new RoomObjectRoomAdEvent(RoomObjectRoomAdEvent.const_260,_loc6_,_loc7_));
               }
               break;
            case MouseEvent.MOUSE_DOWN:
               _loc6_ = object.getId();
               _loc7_ = object.getType();
               if(eventDispatcher != null)
               {
                  _loc8_ = new RoomObjectMouseEvent(RoomObjectMouseEvent.const_453,_loc6_,_loc7_,param1.altKey,param1.ctrlKey,param1.shiftKey,param1.buttonDown);
                  eventDispatcher.dispatchEvent(_loc8_);
               }
         }
      }
   }
}
