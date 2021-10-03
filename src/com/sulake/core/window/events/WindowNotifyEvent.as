package com.sulake.core.window.events
{
   import com.sulake.core.window.IWindow;
   import flash.events.Event;
   
   public class WindowNotifyEvent extends WindowEvent
   {
      
      public static const const_1233:String = "WN_CREATED";
      
      public static const const_949:String = "WN_DISABLE";
      
      public static const const_948:String = "WN_DEACTIVATED";
      
      public static const const_773:String = "WN_OPENED";
      
      public static const const_935:String = "WN_CLOSED";
      
      public static const const_826:String = "WN_DESTROY";
      
      public static const const_1431:String = "WN_ARRANGED";
      
      public static const const_385:String = "WN_PARENT_RESIZED";
      
      public static const const_884:String = "WN_ENABLE";
      
      public static const const_797:String = "WN_RELOCATE";
      
      public static const const_911:String = "WN_FOCUS";
      
      public static const const_840:String = "WN_PARENT_RELOCATED";
      
      public static const const_425:String = "WN_PARAM_UPDATED";
      
      public static const const_673:String = "WN_PARENT_ACTIVATED";
      
      public static const const_227:String = "WN_RESIZED";
      
      public static const const_822:String = "WN_CLOSE";
      
      public static const const_835:String = "WN_PARENT_REMOVED";
      
      public static const const_256:String = "WN_CHILD_RELOCATED";
      
      public static const const_546:String = "WN_ENABLED";
      
      public static const const_266:String = "WN_CHILD_RESIZED";
      
      public static const const_821:String = "WN_MINIMIZED";
      
      public static const const_587:String = "WN_DISABLED";
      
      public static const const_182:String = "WN_CHILD_ACTIVATED";
      
      public static const const_379:String = "WN_STATE_UPDATED";
      
      public static const const_692:String = "WN_UNSELECTED";
      
      public static const const_351:String = "WN_STYLE_UPDATED";
      
      public static const const_1445:String = "WN_UPDATE";
      
      public static const const_449:String = "WN_PARENT_ADDED";
      
      public static const const_540:String = "WN_RESIZE";
      
      public static const const_539:String = "WN_CHILD_REMOVED";
      
      public static const const_1388:String = "";
      
      public static const const_959:String = "WN_RESTORED";
      
      public static const const_299:String = "WN_SELECTED";
      
      public static const const_909:String = "WN_MINIMIZE";
      
      public static const const_951:String = "WN_FOCUSED";
      
      public static const const_1119:String = "WN_LOCK";
      
      public static const const_271:String = "WN_CHILD_ADDED";
      
      public static const const_860:String = "WN_UNFOCUSED";
      
      public static const const_440:String = "WN_RELOCATED";
      
      public static const const_923:String = "WN_DEACTIVATE";
      
      public static const const_1284:String = "WN_CRETAE";
      
      public static const const_933:String = "WN_RESTORE";
      
      public static const const_302:String = "WN_ACTVATED";
      
      public static const const_1116:String = "WN_LOCKED";
      
      public static const const_387:String = "WN_SELECT";
      
      public static const const_976:String = "WN_MAXIMIZE";
      
      public static const const_863:String = "WN_OPEN";
      
      public static const const_654:String = "WN_UNSELECT";
      
      public static const const_1537:String = "WN_ARRANGE";
      
      public static const const_1151:String = "WN_UNLOCKED";
      
      public static const const_1526:String = "WN_UPDATED";
      
      public static const const_973:String = "WN_ACTIVATE";
      
      public static const const_1141:String = "WN_UNLOCK";
      
      public static const const_823:String = "WN_MAXIMIZED";
      
      public static const const_887:String = "WN_DESTROYED";
      
      public static const const_812:String = "WN_UNFOCUS";
       
      
      public function WindowNotifyEvent(param1:String, param2:IWindow, param3:IWindow, param4:Boolean = false)
      {
         super(param1,param2,param3,false,param4);
      }
      
      override public function toString() : String
      {
         return formatToString("WindowNotifyEvent","type","cancelable");
      }
      
      override public function clone() : Event
      {
         return new WindowNotifyEvent(type,_window,var_1505,cancelable);
      }
   }
}
