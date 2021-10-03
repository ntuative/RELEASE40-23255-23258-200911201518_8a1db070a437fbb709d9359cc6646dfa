package com.sulake.habbo.widget.infostand
{
   import com.sulake.core.assets.XmlAsset;
   import com.sulake.core.utils.Map;
   import com.sulake.core.window.ICoreWindowManager;
   import com.sulake.core.window.IWindow;
   import com.sulake.core.window.components.IBitmapWrapperWindow;
   import com.sulake.core.window.components.IButtonWindow;
   import com.sulake.core.window.components.IFrameWindow;
   import com.sulake.core.window.components.ITextWindow;
   import com.sulake.core.window.events.WindowEvent;
   import com.sulake.core.window.events.WindowMouseEvent;
   import com.sulake.habbo.widget.messages.RoomWidgetPetCommandMessage;
   import flash.display.BitmapData;
   import flash.events.TimerEvent;
   import flash.utils.Timer;
   
   public class PetCommandTool
   {
       
      
      private var var_795:int;
      
      private var var_262:Timer;
      
      private var var_333:IFrameWindow;
      
      private var _widget:InfostandWidget;
      
      private var var_923:Map;
      
      private const const_1551:int = 1100;
      
      private var var_1983:String;
      
      private var var_108:IFrameWindow;
      
      public function PetCommandTool(param1:InfostandWidget)
      {
         super();
         _widget = param1;
         var_923 = new Map();
         var_262 = new Timer(const_1551);
         var_262.addEventListener(TimerEvent.TIMER,onButtonDisableTimeout);
      }
      
      public function showWindow(param1:Boolean) : void
      {
         if(param1)
         {
            if(var_108 == null)
            {
               createCommandWindow();
            }
            var_108.visible = true;
         }
         else if(var_108 != null)
         {
            var_108.visible = false;
         }
         var_262.stop();
      }
      
      private function requestEnabledCommands(param1:int) : void
      {
         var _loc2_:RoomWidgetPetCommandMessage = new RoomWidgetPetCommandMessage(RoomWidgetPetCommandMessage.const_611,param1);
         _widget.messageListener.processWidgetMessage(_loc2_);
      }
      
      public function dispose() : void
      {
         if(var_262)
         {
            var_262.stop();
            var_262 = null;
         }
         if(_widget)
         {
            _widget = null;
         }
         if(var_108)
         {
            var_108.dispose();
         }
         var_108 = null;
         if(var_333)
         {
            var_333.dispose();
         }
         var_333 = null;
      }
      
      private function updateCommandButtonsViewState(param1:Array) : void
      {
         var _loc2_:* = null;
         var _loc4_:* = null;
         if(var_108 == null)
         {
            return;
         }
         if(param1 == null)
         {
            param1 = new Array();
         }
         var _loc3_:int = 0;
         do
         {
            _loc4_ = "btn_cmd_" + _loc3_;
            _loc2_ = var_108.findChildByName(_loc4_) as IButtonWindow;
            if(_loc2_ == null)
            {
               break;
            }
            if(param1.indexOf(_loc3_) > -1)
            {
               _loc2_.enable();
            }
            else
            {
               _loc2_.disable();
            }
            _loc3_++;
         }
         while(_loc2_ != null);
         
         var_262.stop();
      }
      
      public function setEnabledCommands(param1:int, param2:Array) : void
      {
         var_923.remove(param1);
         var_923.add(param1,param2);
         if(param1 != var_795)
         {
            return;
         }
         updateCommandButtonsViewState(param2);
         var_262.stop();
      }
      
      public function isVisible() : Boolean
      {
         if(var_108 == null)
         {
            return false;
         }
         return var_108.visible;
      }
      
      private function onInfoWindowProcedure(param1:WindowEvent, param2:IWindow) : void
      {
         var _loc3_:WindowMouseEvent = param1 as WindowMouseEvent;
         if(_loc3_ != null && _loc3_.type == WindowMouseEvent.WINDOW_EVENT_MOUSE_CLICK)
         {
            if(param2.name == "header_button_close")
            {
               var_333.visible = false;
               var_262.stop();
            }
         }
      }
      
      private function openInfoWindow() : void
      {
         var _loc1_:* = null;
         if(var_333 == null)
         {
            _loc1_ = _widget.assets.getAssetByName("pet_commands_info") as XmlAsset;
            var_333 = (_widget.windowManager as ICoreWindowManager).buildFromXML(_loc1_.content as XML) as IFrameWindow;
            if(var_333 == null)
            {
               throw new Error("Failed to construct command info window from XML!");
            }
            var_333.x = 200;
            var_333.procedure = onInfoWindowProcedure;
         }
         else
         {
            var_333.visible = true;
         }
         var_262.stop();
      }
      
      private function onButtonDisableTimeout(param1:TimerEvent) : void
      {
         var _loc2_:Array = var_923.getValue(var_795) as Array;
         updateCommandButtonsViewState(_loc2_);
         var_262.stop();
      }
      
      private function onCommandWindowProcedure(param1:WindowEvent, param2:IWindow) : void
      {
         var _loc4_:int = 0;
         var _loc5_:* = null;
         var _loc6_:* = null;
         var _loc7_:* = null;
         var _loc3_:WindowMouseEvent = param1 as WindowMouseEvent;
         if(_loc3_ != null && _loc3_.type == WindowMouseEvent.WINDOW_EVENT_MOUSE_CLICK)
         {
            if(param2.name == "header_button_close")
            {
               var_108.visible = false;
            }
            else if(param2.name == "description_link")
            {
               openInfoWindow();
            }
            else if(param2.name.indexOf("btn_cmd_") > -1)
            {
               _loc4_ = int(param2.name.substring(8));
               _loc5_ = "pet.command." + _loc4_;
               _loc6_ = _widget.localizations.getKey(_loc5_);
               _loc7_ = new RoomWidgetPetCommandMessage(RoomWidgetPetCommandMessage.const_495,var_795,var_1983 + " " + _loc6_);
               _widget.messageListener.processWidgetMessage(_loc7_);
               updateCommandButtonsViewState(new Array());
               var_262.start();
            }
         }
      }
      
      public function showCommandToolForPet(param1:int, param2:String, param3:BitmapData = null) : void
      {
         if(var_795 == param1)
         {
            return;
         }
         var_795 = param1;
         var_1983 = param2;
         if(var_108 == null)
         {
            return;
         }
         var _loc4_:ITextWindow = var_108.findChildByName("pet_name") as ITextWindow;
         if(_loc4_ != null)
         {
            _loc4_.text = param2;
         }
         var _loc5_:IBitmapWrapperWindow = var_108.findChildByName("avatar_image") as IBitmapWrapperWindow;
         if(_loc5_ != null)
         {
            _loc5_.bitmap = param3;
            _loc5_.width = param3.width;
            _loc5_.height = param3.height;
            _loc5_.invalidate();
         }
         var _loc6_:Array = var_923.getValue(param1) as Array;
         if(_loc6_ == null)
         {
            updateCommandButtonsViewState(new Array());
            requestEnabledCommands(var_795);
         }
         else
         {
            updateCommandButtonsViewState(_loc6_);
         }
      }
      
      private function createCommandWindow() : void
      {
         var _loc1_:XmlAsset = _widget.assets.getAssetByName("pet_commands") as XmlAsset;
         var_108 = (_widget.windowManager as ICoreWindowManager).buildFromXML(_loc1_.content as XML) as IFrameWindow;
         if(var_108 == null)
         {
            throw new Error("Failed to construct command window from XML!");
         }
         var_108.procedure = onCommandWindowProcedure;
         var_108.x = 80;
      }
   }
}
