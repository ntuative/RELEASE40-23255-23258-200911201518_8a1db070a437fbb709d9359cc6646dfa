package com.sulake.core.window
{
   import com.sulake.core.localization.ICoreLocalizationManager;
   import com.sulake.core.localization.ILocalizable;
   import com.sulake.core.runtime.ICoreUpdateReceiver;
   import com.sulake.core.runtime.IDisposable;
   import com.sulake.core.window.components.DesktopController;
   import com.sulake.core.window.components.IDesktopWindow;
   import com.sulake.core.window.components.SubstituteParentController;
   import com.sulake.core.window.enum.WindowParam;
   import com.sulake.core.window.enum.WindowState;
   import com.sulake.core.window.enum.WindowStyle;
   import com.sulake.core.window.enum.WindowType;
   import com.sulake.core.window.graphics.IGraphicContextHost;
   import com.sulake.core.window.graphics.IWindowRenderer;
   import com.sulake.core.window.utils.IInternalWindowServices;
   import com.sulake.core.window.utils.IMouseCursor;
   import com.sulake.core.window.utils.IWindowParser;
   import com.sulake.core.window.utils.InternalWindowServices;
   import com.sulake.core.window.utils.KeyboardEventQueue;
   import com.sulake.core.window.utils.MouseCursorControl;
   import com.sulake.core.window.utils.MouseEventQueue;
   import com.sulake.core.window.utils.WindowParser;
   import flash.display.BitmapData;
   import flash.display.DisplayObject;
   import flash.display.DisplayObjectContainer;
   import flash.display.Stage;
   import flash.events.Event;
   import flash.events.MouseEvent;
   import flash.geom.Point;
   import flash.geom.Rectangle;
   
   public class WindowContext implements IWindowContext, IDisposable, ICoreUpdateReceiver
   {
      
      public static var var_849:MouseEventQueue;
      
      public static var var_1498:IMouseCursor;
      
      public static const const_1464:int = 2;
      
      private static var var_992:Factory;
      
      private static var var_146:IWindowRenderer;
      
      public static var var_1274:KeyboardEventQueue;
      
      public static const const_1509:int = 1;
      
      public static const ERROR_DURING_EVENT_HANDLING:int = 5;
      
      public static const const_1516:int = 0;
      
      public static const const_1436:int = 3;
      
      public static const const_1192:int = 4;
       
      
      protected var var_2142:IWindowFactory;
      
      private var _disposed:Boolean = false;
      
      private var var_665:WindowController;
      
      private var var_645:Date;
      
      protected var var_2140:IWindowParser;
      
      protected var var_863:Error;
      
      protected var var_2141:IInternalWindowServices;
      
      protected var var_99:WindowController;
      
      protected var var_1283:int = -1;
      
      protected var var_93:IDesktopWindow;
      
      private var var_1459:Boolean = false;
      
      protected var var_2215:Boolean = true;
      
      private var var_184:Boolean = false;
      
      protected var var_1033:SubstituteParentController;
      
      private var var_2189:Point;
      
      protected var var_306:DisplayObjectContainer;
      
      private var var_326:IWindowContextStateListener;
      
      private var _name:String;
      
      protected var _localization:ICoreLocalizationManager;
      
      private var var_557:Point;
      
      public function WindowContext(param1:String, param2:IWindowRenderer, param3:IWindowFactory, param4:ICoreLocalizationManager, param5:DisplayObjectContainer, param6:Rectangle, param7:IWindowContextStateListener)
      {
         var_557 = new Point();
         var_2189 = new Point();
         super();
         _name = param1;
         var_146 = param2;
         _localization = param4;
         var_306 = param5;
         var_2141 = new InternalWindowServices(this,param5);
         var_2142 = param3;
         var_2140 = new WindowParser(this);
         var_645 = new Date();
         if(var_992 == null)
         {
            var_992 = new Factory();
         }
         if(var_849 == null)
         {
            var_849 = new MouseEventQueue(param5);
         }
         if(var_1274 == null)
         {
            var_1274 = new KeyboardEventQueue(param5);
         }
         if(param6 == null)
         {
            param6 = new Rectangle(0,0,800,600);
         }
         var_93 = new DesktopController("_CONTEXT_DESKTOP_" + _name,"Desktop " + _name,WindowType.const_428,WindowStyle.const_247,WindowParam.const_94,this,param6,null,null);
         var_306.addChild(var_93.getDisplayObject());
         var_306.doubleClickEnabled = true;
         var_306.addEventListener(Event.RESIZE,stageResizedHandler);
         var_99 = WindowController(var_93);
         var_1033 = new SubstituteParentController("WindowContext::SubstituteParent","",0,0,0,this,new Rectangle(0,0,0,0),null,null,null,null,0);
         var_326 = param7;
      }
      
      public function destroy(param1:IWindow) : Boolean
      {
         if(param1 == var_93)
         {
            var_93 = null;
         }
         if(param1.state != WindowState.const_461)
         {
            param1.destroy();
         }
         var_146.removeRenderable(param1 as WindowController);
         return true;
      }
      
      public function create(param1:String, param2:String, param3:uint, param4:uint, param5:uint, param6:Rectangle, param7:Function, param8:IWindow, param9:uint, param10:Array = null, param11:Array = null) : IWindow
      {
         var _loc12_:Class = var_992.getWindowClassByType(param3);
         if(_loc12_ == null)
         {
            handleError(WindowContext.const_1192,new Error("Failed to solve implementation for window \"" + param1 + "\"!"));
            return null;
         }
         if(param8 == null)
         {
            if(param5 & 0)
            {
               param8 = var_1033;
            }
         }
         return new _loc12_(param1,param2,param3,param4,param5,this,param6,param8 != null ? param8 : var_93,param7,param10,param11,param9);
      }
      
      public function getDesktopWindow() : IDesktopWindow
      {
         return var_93;
      }
      
      public function render(param1:uint) : void
      {
         var_1459 = true;
         var_146.update(param1);
         var_1459 = false;
      }
      
      public function dispose() : void
      {
         _disposed = true;
         var_306.removeEventListener(Event.RESIZE,stageResizedHandler);
         var_306.removeChild(IGraphicContextHost(var_93).getGraphicContext(true) as DisplayObject);
         var_93.destroy();
         var_93 = null;
         var_1033.destroy();
         var_1033 = null;
         var_992 = null;
         var_146 = null;
         var_99 = null;
         var_645 = null;
         var_326 = null;
      }
      
      private function stageResizedHandler(param1:Event) : void
      {
         if(var_93 != null && true)
         {
            if(var_306 is Stage)
            {
               var_93.width = Stage(var_306).stageWidth;
               var_93.height = Stage(var_306).stageHeight;
            }
            else
            {
               var_93.width = var_306.width;
               var_93.height = var_306.height;
            }
         }
      }
      
      public function get disposed() : Boolean
      {
         return _disposed;
      }
      
      public function registerLocalizationListener(param1:String, param2:IWindow) : void
      {
         _localization.registerListener(param1,param2 as ILocalizable);
      }
      
      public function invalidate(param1:IWindow, param2:Rectangle, param3:uint) : Boolean
      {
         var_146.addToRenderQueue(WindowController(param1),param2,param3);
         return true;
      }
      
      public function getWindowParser() : IWindowParser
      {
         return var_2140;
      }
      
      public function removeLocalizationListener(param1:String, param2:IWindow) : void
      {
         _localization.removeListener(param1,param2 as ILocalizable);
      }
      
      public function getWindowFactory() : IWindowFactory
      {
         return var_2142;
      }
      
      public function update(param1:uint) : void
      {
         var _loc2_:* = null;
         var _loc3_:int = 0;
         var _loc4_:* = null;
         var _loc5_:* = null;
         var_184 = true;
         if(var_863)
         {
            throw var_863;
         }
         var _loc6_:Point = new Point();
         var _loc7_:MouseEventQueue = WindowContext.var_849;
         _loc7_.begin();
         var_557.x = -1;
         var_557.y = -1;
         while(true)
         {
            _loc2_ = _loc7_.next() as MouseEvent;
            if(_loc2_ == null)
            {
               break;
            }
            if(_loc2_.stageX != var_557.x || _loc2_.stageY != var_557.y)
            {
               var_557.x = _loc2_.stageX;
               var_557.y = _loc2_.stageY;
               _loc5_ = new Array();
               var_93.groupChildrenUnderPoint(var_557,_loc5_);
            }
            _loc3_ = _loc5_ != null ? int(_loc5_.length) : 0;
            if(_loc3_ == 1)
            {
               if(_loc2_.type == MouseEvent.MOUSE_MOVE)
               {
                  if(var_99 != var_93 && true)
                  {
                     var_99.getGlobalPosition(_loc6_);
                     var_99.update(var_99,new MouseEvent(MouseEvent.MOUSE_OUT,false,false,_loc2_.stageX - _loc6_.x,_loc2_.stageY - _loc6_.y,null,_loc2_.altKey,_loc2_.ctrlKey,_loc2_.shiftKey,_loc2_.buttonDown,_loc2_.delta));
                     var_99 = WindowController(var_93);
                  }
               }
            }
            while(--_loc3_ > -1)
            {
               _loc4_ = passMouseEvent(WindowController(_loc5_[_loc3_]),_loc2_);
               if(_loc4_ != null && _loc4_.visible)
               {
                  if(_loc2_.type == MouseEvent.MOUSE_MOVE)
                  {
                     if(_loc4_ != var_99)
                     {
                        if(true)
                        {
                           var_99.getGlobalPosition(_loc6_);
                           var_99.update(var_99,new MouseEvent(MouseEvent.MOUSE_OUT,false,false,_loc2_.stageX - _loc6_.x,_loc2_.stageY - _loc6_.y,null,_loc2_.altKey,_loc2_.ctrlKey,_loc2_.shiftKey,_loc2_.buttonDown,_loc2_.delta));
                        }
                        if(!_loc4_.disposed)
                        {
                           _loc4_.getGlobalPosition(_loc6_);
                           _loc4_.update(_loc4_,new MouseEvent(MouseEvent.MOUSE_OVER,false,false,_loc2_.stageX - _loc6_.x,_loc2_.stageY - _loc6_.y,null,_loc2_.altKey,_loc2_.ctrlKey,_loc2_.shiftKey,_loc2_.buttonDown,_loc2_.delta));
                        }
                        if(!_loc4_.disposed)
                        {
                           var_99 = _loc4_;
                        }
                     }
                  }
                  else if(_loc2_.type == MouseEvent.MOUSE_UP || _loc2_.type == MouseEvent.CLICK)
                  {
                     if(var_99 && true)
                     {
                        if(var_326 != null)
                        {
                           var_326.mouseEventReceived(_loc2_.type,var_99);
                        }
                     }
                  }
                  if(_loc2_.altKey)
                  {
                     if(var_99)
                     {
                        Logger.log("HOVER: undefined");
                     }
                  }
                  if(_loc4_ != var_93)
                  {
                     _loc2_.stopPropagation();
                     _loc7_.remove();
                  }
                  break;
               }
            }
         }
         _loc7_.end();
         var_184 = false;
      }
      
      public function handleError(param1:int, param2:Error) : void
      {
         var_863 = param2;
         var_1283 = param1;
         if(var_2215)
         {
            throw param2;
         }
      }
      
      public function getLastError() : Error
      {
         return var_863;
      }
      
      public function getMouseCursor() : IMouseCursor
      {
         if(var_1498 == null)
         {
            var_1498 = new MouseCursorControl(var_306 as Stage);
         }
         return var_1498;
      }
      
      public function flushError() : void
      {
         var_863 = null;
         var_1283 = -1;
      }
      
      public function getLastErrorCode() : int
      {
         return var_1283;
      }
      
      private function passMouseEvent(param1:WindowController, param2:MouseEvent) : WindowController
      {
         if(param1.disposed)
         {
            return null;
         }
         if(!param1.testParamFlag(WindowParam.const_45))
         {
            return null;
         }
         if(param1.testStateFlag(WindowState.const_66))
         {
            return null;
         }
         var _loc3_:Point = new Point(param2.stageX,param2.stageY);
         param1.convertPointFromGlobalToLocalSpace(_loc3_);
         var _loc4_:BitmapData = var_146.getDrawBufferForRenderable(param1);
         if(!param1.validateLocalPointIntersection(_loc3_,_loc4_))
         {
            return null;
         }
         if(param1.testParamFlag(WindowParam.const_422))
         {
            if(param1.parent != null)
            {
               return passMouseEvent(WindowController(param1.parent),param2);
            }
         }
         var _loc5_:Boolean = true;
         switch(param2.type)
         {
            case MouseEvent.MOUSE_DOWN:
               var_665 = param1;
               break;
            case MouseEvent.CLICK:
               if(var_665 != param1)
               {
                  _loc5_ = false;
               }
               else
               {
                  var_665 = null;
               }
               break;
            case MouseEvent.DOUBLE_CLICK:
               if(var_665 != param1)
               {
                  _loc5_ = false;
               }
               else
               {
                  var_665 = null;
               }
         }
         if(_loc5_)
         {
            if(!param1.update(param1,param2))
            {
               if(param1.parent)
               {
                  return passMouseEvent(WindowController(param1.parent),param2);
               }
            }
         }
         return param1;
      }
      
      public function findWindowByName(param1:String) : IWindow
      {
         return var_93.findChildByName(param1);
      }
      
      public function getWindowServices() : IInternalWindowServices
      {
         return var_2141;
      }
   }
}
