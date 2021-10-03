package com.sulake.core.window.events
{
   import com.sulake.core.window.IWindow;
   import flash.events.Event;
   
   public class WindowEvent extends Event
   {
      
      public static const const_308:String = "WE_CHILD_RESIZED";
      
      public static const const_1328:String = "WE_CLOSE";
      
      public static const const_1174:String = "WE_DESTROY";
      
      public static const const_232:String = "WE_CHANGE";
      
      public static const const_1160:String = "WE_RESIZE";
      
      public static const WINDOW_EVENT_MESSAGE:String = "WE_MESSAGE";
      
      public static const const_1491:String = "WE_PARENT_RESIZE";
      
      public static const const_82:String = "WE_UPDATE";
      
      public static const const_1267:String = "WE_MAXIMIZE";
      
      public static const const_375:String = "WE_DESTROYED";
      
      public static const const_862:String = "WE_UNSELECT";
      
      public static const const_1324:String = "WE_MAXIMIZED";
      
      public static const const_1387:String = "WE_UNLOCKED";
      
      public static const const_407:String = "WE_CHILD_REMOVED";
      
      public static const const_206:String = "WE_OK";
      
      public static const const_47:String = "WE_RESIZED";
      
      public static const const_1132:String = "WE_ACTIVATE";
      
      public static const const_259:String = "WE_ENABLED";
      
      public static const const_437:String = "WE_CHILD_RELOCATED";
      
      public static const const_1203:String = "WE_CREATE";
      
      public static const const_551:String = "WE_SELECT";
      
      public static const const_164:String = "";
      
      public static const const_1508:String = "WE_LOCKED";
      
      public static const const_1420:String = "WE_PARENT_RELOCATE";
      
      public static const const_1525:String = "WE_CHILD_REMOVE";
      
      public static const const_1480:String = "WE_CHILD_RELOCATE";
      
      public static const const_1521:String = "WE_LOCK";
      
      public static const const_277:String = "WE_FOCUSED";
      
      public static const const_714:String = "WE_UNSELECTED";
      
      public static const const_775:String = "WE_DEACTIVATED";
      
      public static const const_1291:String = "WE_MINIMIZED";
      
      public static const const_1415:String = "WE_ARRANGED";
      
      public static const const_1475:String = "WE_UNLOCK";
      
      public static const const_1534:String = "WE_ATTACH";
      
      public static const const_1269:String = "WE_OPEN";
      
      public static const const_1264:String = "WE_RESTORE";
      
      public static const const_1400:String = "WE_PARENT_RELOCATED";
      
      public static const const_1099:String = "WE_RELOCATE";
      
      public static const const_1375:String = "WE_CHILD_RESIZE";
      
      public static const const_1490:String = "WE_ARRANGE";
      
      public static const const_1095:String = "WE_OPENED";
      
      public static const const_1271:String = "WE_CLOSED";
      
      public static const const_1504:String = "WE_DETACHED";
      
      public static const const_1448:String = "WE_UPDATED";
      
      public static const const_1181:String = "WE_UNFOCUSED";
      
      public static const const_424:String = "WE_RELOCATED";
      
      public static const const_1098:String = "WE_DEACTIVATE";
      
      public static const const_185:String = "WE_DISABLED";
      
      public static const const_631:String = "WE_CANCEL";
      
      public static const const_516:String = "WE_ENABLE";
      
      public static const const_1262:String = "WE_ACTIVATED";
      
      public static const const_1315:String = "WE_FOCUS";
      
      public static const const_1462:String = "WE_DETACH";
      
      public static const const_1273:String = "WE_RESTORED";
      
      public static const const_1288:String = "WE_UNFOCUS";
      
      public static const const_53:String = "WE_SELECTED";
      
      public static const const_1237:String = "WE_PARENT_RESIZED";
      
      public static const const_1265:String = "WE_CREATED";
      
      public static const const_1459:String = "WE_ATTACHED";
      
      public static const const_1322:String = "WE_MINIMIZE";
      
      public static const WINDOW_EVENT_DISABLE:String = "WE_DISABLE";
       
      
      protected var _type:String = "";
      
      protected var var_1505:IWindow;
      
      protected var _window:IWindow;
      
      protected var var_1278:Boolean;
      
      public function WindowEvent(param1:String, param2:IWindow, param3:IWindow, param4:Boolean = false, param5:Boolean = false)
      {
         _type = param1;
         _window = param2;
         var_1505 = param3;
         var_1278 = false;
         super(param1,param4,param5);
      }
      
      public function isWindowOperationPrevented() : Boolean
      {
         return var_1278;
      }
      
      public function get related() : IWindow
      {
         return var_1505;
      }
      
      public function get window() : IWindow
      {
         return _window;
      }
      
      public function set type(param1:String) : void
      {
         _type = param1;
      }
      
      override public function get type() : String
      {
         return _type;
      }
      
      override public function toString() : String
      {
         return formatToString("WindowEvent","type","bubbles","cancelable","window");
      }
      
      override public function clone() : Event
      {
         return new WindowEvent(_type,window,related,bubbles,cancelable);
      }
      
      public function preventWindowOperation() : void
      {
         if(cancelable)
         {
            var_1278 = true;
            stopImmediatePropagation();
            return;
         }
         throw new Error("Attempted to prevent window operation that is not canceable!");
      }
   }
}
