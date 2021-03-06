package com.sulake.habbo.navigator.inroom
{
   import com.sulake.core.window.IWindow;
   import com.sulake.core.window.IWindowContainer;
   import com.sulake.core.window.components.IButtonWindow;
   import com.sulake.core.window.components.IContainerButtonWindow;
   import com.sulake.core.window.components.ITextFieldWindow;
   import com.sulake.core.window.components.ITextWindow;
   import com.sulake.core.window.events.WindowEvent;
   import com.sulake.core.window.events.WindowMouseEvent;
   import com.sulake.habbo.communication.messages.incoming.navigator.GuestRoomData;
   import com.sulake.habbo.communication.messages.incoming.navigator.PublicRoomShortData;
   import com.sulake.habbo.communication.messages.incoming.navigator.RoomEventData;
   import com.sulake.habbo.communication.messages.outgoing.navigator.AddFavouriteRoomMessageComposer;
   import com.sulake.habbo.communication.messages.outgoing.navigator.CanCreateEventMessageComposer;
   import com.sulake.habbo.communication.messages.outgoing.navigator.DeleteFavouriteRoomMessageComposer;
   import com.sulake.habbo.communication.messages.outgoing.navigator.RateFlatMessageComposer;
   import com.sulake.habbo.communication.messages.outgoing.navigator.UpdateNavigatorSettingsMessageComposer;
   import com.sulake.habbo.navigator.HabboNavigator;
   import com.sulake.habbo.navigator.SimpleAlertView;
   import com.sulake.habbo.navigator.TagRenderer;
   import com.sulake.habbo.navigator.Util;
   import com.sulake.habbo.navigator.events.HabboRoomSettingsTrackingEvent;
   import com.sulake.habbo.navigator.roomsettings.IRoomSettingsCtrlOwner;
   import com.sulake.habbo.navigator.roomsettings.RoomSettingsCtrl;
   import com.sulake.habbo.navigator.roomthumbnails.RoomThumbnailCtrl;
   import com.sulake.habbo.toolbar.HabboToolbarIconEnum;
   import com.sulake.habbo.toolbar.events.HabboToolbarShowMenuEvent;
   import com.sulake.habbo.window.enum.HabboWindowParam;
   import flash.events.Event;
   import flash.events.TimerEvent;
   import flash.utils.Timer;
   
   public class RoomInfoViewCtrl implements IRoomSettingsCtrlOwner
   {
       
      
      private var var_668:IWindowContainer;
      
      private var var_998:ITextWindow;
      
      private var var_202:RoomSettingsCtrl;
      
      private var var_1240:IContainerButtonWindow;
      
      private var _window:IWindowContainer;
      
      private var var_474:Timer;
      
      private var var_1237:ITextWindow;
      
      private var var_340:IWindowContainer;
      
      private var var_2042:IWindowContainer;
      
      private var var_2043:ITextWindow;
      
      private var var_816:IWindowContainer;
      
      private var var_1467:IButtonWindow;
      
      private var _ownerName:ITextWindow;
      
      private var var_654:ITextWindow;
      
      private var var_1466:IWindowContainer;
      
      private var var_1236:IWindowContainer;
      
      private var var_817:ITextWindow;
      
      private var var_999:ITextFieldWindow;
      
      private var var_298:IWindowContainer;
      
      private var var_815:ITextWindow;
      
      private var var_1468:IButtonWindow;
      
      private var var_997:ITextWindow;
      
      private var var_2194:int;
      
      private var var_1235:IContainerButtonWindow;
      
      private var var_818:IWindowContainer;
      
      private var var_1234:ITextWindow;
      
      private var var_1239:IContainerButtonWindow;
      
      private var var_1464:ITextWindow;
      
      private var var_1465:IButtonWindow;
      
      private var var_1002:TagRenderer;
      
      private var var_1988:ITextWindow;
      
      private var var_341:RoomEventViewCtrl;
      
      private var _navigator:HabboNavigator;
      
      private var var_669:ITextWindow;
      
      private var var_264:RoomThumbnailCtrl;
      
      private var var_1238:IContainerButtonWindow;
      
      private var var_2044:IWindowContainer;
      
      private var var_265:IWindowContainer;
      
      public function RoomInfoViewCtrl(param1:HabboNavigator)
      {
         super();
         _navigator = param1;
         var_341 = new RoomEventViewCtrl(_navigator);
         var_202 = new RoomSettingsCtrl(_navigator,this,true);
         var_264 = new RoomThumbnailCtrl(_navigator);
         var_1002 = new TagRenderer(_navigator);
         _navigator.roomSettingsCtrls.push(this.var_202);
         var_474 = new Timer(6000,1);
         var_474.addEventListener(TimerEvent.TIMER,hideInfo);
      }
      
      public function backToRoomSettings() : void
      {
         this.var_202.active = true;
         this.var_341.active = false;
         this.var_264.active = false;
         this.reload();
         _navigator.events.dispatchEvent(new Event(HabboRoomSettingsTrackingEvent.HABBO_ROOM_SETTINGS_TRACKING_EVENT_DEFAULT));
      }
      
      private function refreshEventButtons(param1:RoomEventData) : void
      {
         if(false)
         {
            return;
         }
         var_1467.visible = param1 == null && _navigator.data.currentRoomOwner;
         var_1465.visible = param1 != null && (_navigator.data.currentRoomOwner || _navigator.data.eventMod);
         var_1466.visible = Util.hasVisibleChildren(var_1466);
      }
      
      private function refreshRoomDetails(param1:GuestRoomData, param2:Boolean) : void
      {
         if(param1 == null || false || false)
         {
            return;
         }
         var_654.text = param1.roomName;
         var_654.height = NaN;
         _ownerName.text = param1.ownerName;
         var_817.text = param1.description;
         var_1002.refreshTags(var_340,param1.tags);
         var_817.visible = false;
         if(param1.description != "")
         {
            var_817.height = NaN;
            var_817.visible = true;
         }
         var _loc3_:* = _navigator.data.currentRoomRating == -1;
         _navigator.refreshButton(var_340,"thumb_up",_loc3_,onThumbUp,0);
         _navigator.refreshButton(var_340,"thumb_down",_loc3_,onThumbDown,0);
         var_2043.visible = _loc3_;
         var_815.visible = !_loc3_;
         var_1464.visible = !_loc3_;
         var_1464.text = "" + _navigator.data.currentRoomRating;
         _navigator.refreshButton(var_340,"home",param2,null,0);
         _navigator.refreshButton(var_340,"favourite",!param2 && _navigator.data.isCurrentRoomFavourite(),null,0);
         Util.moveChildrenToColumn(var_340,["room_name","owner_name_cont","tags","room_desc","rating_cont"],var_654.y,0);
         var_340.visible = true;
         var_340.height = Util.getLowestPoint(var_340);
      }
      
      private function getButtonsMinHeight() : int
      {
         return !!_navigator.data.currentRoomOwner ? 0 : 21;
      }
      
      private function hideInfo(param1:Event) : void
      {
         _navigator.toolbar.events.dispatchEvent(new HabboToolbarShowMenuEvent(HabboToolbarShowMenuEvent.const_408,HabboToolbarIconEnum.ROOMINFO,_window,false));
      }
      
      private function onThumbUp(param1:WindowEvent, param2:IWindow) : void
      {
         if(param1.type != WindowMouseEvent.WINDOW_EVENT_MOUSE_CLICK)
         {
            return;
         }
         _navigator.send(new RateFlatMessageComposer(1));
      }
      
      private function getRoomInfoMinHeight() : int
      {
         return 37;
      }
      
      public function onAddFavouriteClick(param1:WindowEvent, param2:IWindow) : void
      {
         var _loc3_:* = null;
         if(param1.type != WindowMouseEvent.WINDOW_EVENT_MOUSE_CLICK)
         {
            return;
         }
         if(_navigator.data.enteredGuestRoom == null)
         {
            return;
         }
         if(_navigator.data.isFavouritesFull())
         {
            _loc3_ = new SimpleAlertView(_navigator,"${navigator.favouritesfull.title}","${navigator.favouritesfull.body}");
            _loc3_.show();
         }
         else
         {
            _navigator.send(new AddFavouriteRoomMessageComposer(0,_navigator.data.enteredGuestRoom.flatId));
         }
      }
      
      private function refreshRoomButtons(param1:Boolean) : void
      {
         if(_navigator.data.enteredGuestRoom == null || false || false)
         {
            return;
         }
         var_1468.visible = _navigator.data.canEditRoomSettings;
         var _loc2_:Boolean = _navigator.data.isCurrentRoomFavourite();
         var_1240.visible = _navigator.data.canAddFavourite && !_loc2_;
         var_1238.visible = _navigator.data.canAddFavourite && _loc2_;
         var_1235.visible = _navigator.data.canEditRoomSettings && !param1;
         var_1239.visible = _navigator.data.canEditRoomSettings && param1;
         var_1236.visible = Util.hasVisibleChildren(var_1236);
      }
      
      public function open(param1:Boolean) : void
      {
         this.var_474.reset();
         this.var_341.active = false;
         this.var_202.active = false;
         this.var_264.active = false;
         if(param1)
         {
            this.startRoomSettingsEdit(_navigator.data.enteredGuestRoom.flatId);
         }
         refresh();
         _window.visible = true;
         _navigator.toolbar.events.dispatchEvent(new HabboToolbarShowMenuEvent(HabboToolbarShowMenuEvent.const_44,HabboToolbarIconEnum.ROOMINFO,_window,false));
         _window.parent.activate();
         _window.activate();
         if(!param1)
         {
            this.var_474.start();
         }
      }
      
      public function toggle() : void
      {
         this.var_474.reset();
         this.var_341.active = false;
         this.var_202.active = false;
         this.var_264.active = false;
         refresh();
         if(true)
         {
            _navigator.toolbar.events.dispatchEvent(new HabboToolbarShowMenuEvent(HabboToolbarShowMenuEvent.const_44,HabboToolbarIconEnum.ROOMINFO,_window,false));
            _window.parent.activate();
         }
         else
         {
            _navigator.toolbar.events.dispatchEvent(new HabboToolbarShowMenuEvent(HabboToolbarShowMenuEvent.const_408,HabboToolbarIconEnum.ROOMINFO,_window,false));
         }
      }
      
      private function refreshRoom() : void
      {
         Util.hideChildren(var_298);
         var_298.findChildByName("close").visible = true;
         var _loc1_:GuestRoomData = _navigator.data.enteredGuestRoom;
         var _loc2_:Boolean = _navigator.data.settings != null && _loc1_ != null && _loc1_.flatId == _navigator.data.settings.homeRoomId;
         refreshRoomDetails(_loc1_,_loc2_);
         method_9(_navigator.data.enteredPublicSpace);
         refreshRoomButtons(_loc2_);
         this.var_202.refresh(var_298);
         this.var_264.refresh(var_298);
         Util.moveChildrenToColumn(var_298,["room_details","room_buttons"],0,2);
         var_298.height = Util.getLowestPoint(var_298);
         var_298.visible = true;
         Logger.log("XORP: undefined, undefined, undefined, undefined, undefined");
      }
      
      private function onCloseButtonClick(param1:WindowEvent, param2:IWindow) : void
      {
         if(param1.type != WindowMouseEvent.WINDOW_EVENT_MOUSE_CLICK)
         {
            return;
         }
         hideInfo(null);
      }
      
      private function onEmbedSrcClick(param1:WindowEvent, param2:IWindow) : void
      {
         if(param1.type != WindowMouseEvent.WINDOW_EVENT_MOUSE_CLICK)
         {
            return;
         }
         var_999.setSelection(0,var_999.text.length);
      }
      
      private function getEmbedData() : String
      {
         var _loc1_:* = null;
         var _loc2_:* = null;
         if(_navigator.data.enteredGuestRoom != null)
         {
            _loc1_ = "private";
            _loc2_ = "" + _navigator.data.enteredGuestRoom.flatId;
         }
         else
         {
            _loc1_ = "public";
            _loc2_ = "" + _navigator.data.publicSpaceNodeId;
            Logger.log("Node id is: " + _loc2_);
         }
         var _loc3_:String = _navigator.configuration.getKey("user.hash","");
         _navigator.registerParameter("navigator.embed.src","roomType",_loc1_);
         _navigator.registerParameter("navigator.embed.src","embedCode",_loc3_);
         _navigator.registerParameter("navigator.embed.src","roomId",_loc2_);
         return _navigator.getText("navigator.embed.src");
      }
      
      private function onThumbDown(param1:WindowEvent, param2:IWindow) : void
      {
         if(param1.type != WindowMouseEvent.WINDOW_EVENT_MOUSE_CLICK)
         {
            return;
         }
         _navigator.send(new RateFlatMessageComposer(-1));
      }
      
      private function refreshEvent() : void
      {
         Util.hideChildren(var_265);
         var _loc1_:RoomEventData = _navigator.data.roomEventData;
         refreshEventDetails(_loc1_);
         refreshEventButtons(_loc1_);
         this.var_341.refresh(var_265);
         if(Util.hasVisibleChildren(var_265) && !this.var_264.active)
         {
            Util.moveChildrenToColumn(var_265,["event_details","event_buttons"],0,2);
            var_265.height = Util.getLowestPoint(var_265);
            var_265.visible = true;
         }
         else
         {
            var_265.visible = false;
         }
         Logger.log("EVENT: undefined, undefined");
      }
      
      public function startEventEdit() : void
      {
         this.var_474.reset();
         this.var_341.active = true;
         this.var_202.active = false;
         this.var_264.active = false;
         this.reload();
      }
      
      private function getEventInfoMinHeight() : int
      {
         return 18;
      }
      
      public function onRemoveFavouriteClick(param1:WindowEvent, param2:IWindow) : void
      {
         if(param1.type != WindowMouseEvent.WINDOW_EVENT_MOUSE_CLICK)
         {
            return;
         }
         if(_navigator.data.enteredGuestRoom == null)
         {
            return;
         }
         _navigator.send(new DeleteFavouriteRoomMessageComposer(0,_navigator.data.enteredGuestRoom.flatId));
      }
      
      private function onHover(param1:WindowEvent, param2:IWindow) : void
      {
         if(param1.type != WindowMouseEvent.WINDOW_EVENT_MOUSE_OVER)
         {
            return;
         }
         var_474.reset();
      }
      
      private function method_9(param1:PublicRoomShortData) : void
      {
         if(param1 == null || false || false)
         {
            return;
         }
         var_998.text = _navigator.getPublicSpaceName(param1.unitPropertySet,param1.worldId);
         var_998.height = NaN;
         var_1237.text = _navigator.getPublicSpaceDesc(param1.unitPropertySet,param1.worldId);
         var_1237.height = NaN;
         Util.moveChildrenToColumn(var_668,["public_space_name","public_space_desc"],var_998.y,0);
         var_668.visible = true;
         var_668.height = Math.max(86,Util.getLowestPoint(var_668));
      }
      
      public function reload() : void
      {
         if(_window != null && false)
         {
            refresh();
         }
      }
      
      private function find(param1:String) : IWindow
      {
         var _loc2_:IWindow = _window.findChildByName(param1);
         if(_loc2_ == null)
         {
            throw new Error("Window element with name: " + param1 + " cannot be found!");
         }
         return _loc2_;
      }
      
      private function refreshEmbed() : void
      {
         var _loc1_:* = _navigator.configuration.getKey("embed.showInRoomInfo","false") == "true";
         if(_loc1_ && true && true && true)
         {
            var_818.visible = true;
            var_999.text = this.getEmbedData();
         }
         else
         {
            var_818.visible = false;
         }
      }
      
      public function startRoomSettingsEdit(param1:int) : void
      {
         this.var_474.reset();
         this.var_202.load(param1);
         this.var_202.active = true;
         this.var_341.active = false;
         this.var_264.active = false;
         _navigator.events.dispatchEvent(new Event(HabboRoomSettingsTrackingEvent.HABBO_ROOM_SETTINGS_TRACKING_EVENT_DEFAULT));
      }
      
      public function startThumbnailEdit() : void
      {
         this.var_474.reset();
         this.var_202.active = false;
         this.var_341.active = false;
         this.var_264.active = true;
         this.reload();
         _navigator.events.dispatchEvent(new Event(HabboRoomSettingsTrackingEvent.HABBO_ROOM_SETTINGS_TRACKING_EVENT_THUMBS));
      }
      
      private function prepareWindow() : void
      {
         if(_window != null)
         {
            return;
         }
         _window = IWindowContainer(_navigator.getXmlWindow("iro_room_details"));
         _window.setParamFlag(HabboWindowParam.const_64,false);
         _window.setParamFlag(HabboWindowParam.const_1217,true);
         var_298 = IWindowContainer(find("room_info"));
         var_340 = IWindowContainer(find("room_details"));
         var_668 = IWindowContainer(find("public_space_details"));
         var_2044 = IWindowContainer(find("owner_name_cont"));
         var_2042 = IWindowContainer(find("rating_cont"));
         var_1236 = IWindowContainer(find("room_buttons"));
         var_654 = ITextWindow(find("room_name"));
         var_998 = ITextWindow(find("public_space_name"));
         _ownerName = ITextWindow(find("owner_name"));
         var_817 = ITextWindow(find("room_desc"));
         var_1237 = ITextWindow(find("public_space_desc"));
         var_997 = ITextWindow(find("owner_caption"));
         var_815 = ITextWindow(find("rating_caption"));
         var_2043 = ITextWindow(find("rate_caption"));
         var_1464 = ITextWindow(find("rating_txt"));
         var_265 = IWindowContainer(find("event_info"));
         var_816 = IWindowContainer(find("event_details"));
         var_1466 = IWindowContainer(find("event_buttons"));
         var_1988 = ITextWindow(find("event_name"));
         var_669 = ITextWindow(find("event_desc"));
         var_1240 = IContainerButtonWindow(find("add_favourite_button"));
         var_1238 = IContainerButtonWindow(find("rem_favourite_button"));
         var_1235 = IContainerButtonWindow(find("make_home_button"));
         var_1239 = IContainerButtonWindow(find("unmake_home_button"));
         var_1468 = IButtonWindow(find("room_settings_button"));
         var_1467 = IButtonWindow(find("create_event_button"));
         var_1465 = IButtonWindow(find("edit_event_button"));
         var_818 = IWindowContainer(find("embed_info"));
         var_1234 = ITextWindow(find("embed_info_txt"));
         var_999 = ITextFieldWindow(find("embed_src_txt"));
         Util.setProcDirectly(var_1240,onAddFavouriteClick);
         Util.setProcDirectly(var_1238,onRemoveFavouriteClick);
         Util.setProcDirectly(var_1468,onRoomSettingsClick);
         Util.setProcDirectly(var_1235,onMakeHomeClick);
         Util.setProcDirectly(var_1239,onUnmakeHomeClick);
         Util.setProcDirectly(var_1467,onEventSettingsClick);
         Util.setProcDirectly(var_1465,onEventSettingsClick);
         Util.setProcDirectly(var_999,onEmbedSrcClick);
         _navigator.refreshButton(var_1240,"favourite",true,null,0);
         _navigator.refreshButton(var_1238,"favourite",true,null,0);
         _navigator.refreshButton(var_1235,"home",true,null,0);
         _navigator.refreshButton(var_1239,"home",true,null,0);
         _window.findChildByName("close").procedure = onCloseButtonClick;
         Util.setProcDirectly(var_298,onHover);
         Util.setProcDirectly(var_265,onHover);
         var_997.width = var_997.textWidth;
         Util.moveChildrenToRow(var_2044,["owner_caption","owner_name"],var_997.x,var_997.y,3);
         var_815.width = var_815.textWidth;
         Util.moveChildrenToRow(var_2042,["rating_caption","rating_txt"],var_815.x,var_815.y,3);
         var_1234.height = NaN;
         Util.moveChildrenToColumn(var_818,["embed_info_txt","embed_src_txt"],var_1234.y,2);
         var_818.height = Util.getLowestPoint(var_818) + 5;
         var_2194 = NaN;
      }
      
      private function refreshEventDetails(param1:RoomEventData) : void
      {
         if(param1 == null || false)
         {
            return;
         }
         var_1988.text = param1.eventName;
         var_669.text = param1.eventDescription;
         var_1002.refreshTags(var_816,[_navigator.getText("roomevent_type_" + param1.eventType),param1.tags[0],param1.tags[1]]);
         var_669.visible = false;
         if(param1.eventDescription != "")
         {
            var_669.height = NaN;
            var_669.y = Util.getLowestPoint(var_816) + 2;
            var_669.visible = true;
         }
         var_816.visible = true;
         var_816.height = Util.getLowestPoint(var_816);
      }
      
      private function refresh() : void
      {
         prepareWindow();
         refreshRoom();
         refreshEvent();
         refreshEmbed();
         Util.moveChildrenToColumn(this._window,["room_info","event_info","embed_info"],0,2);
         _window.height = Util.getLowestPoint(_window);
         _window.y = _window.desktop.height - 0 - 5;
         Logger.log("MAIN: undefined, undefined, undefined");
      }
      
      private function onRoomSettingsClick(param1:WindowEvent, param2:IWindow) : void
      {
         if(param1.type != WindowMouseEvent.WINDOW_EVENT_MOUSE_CLICK)
         {
            return;
         }
         var _loc3_:GuestRoomData = _navigator.data.enteredGuestRoom;
         if(_loc3_ == null)
         {
            Logger.log("No entered room data?!");
            return;
         }
         startRoomSettingsEdit(_loc3_.flatId);
      }
      
      private function onUnmakeHomeClick(param1:WindowEvent, param2:IWindow) : void
      {
         if(param1.type != WindowMouseEvent.WINDOW_EVENT_MOUSE_CLICK)
         {
            return;
         }
         Logger.log("CLEARING HOME ROOM:");
         _navigator.send(new UpdateNavigatorSettingsMessageComposer(0));
      }
      
      private function onEventSettingsClick(param1:WindowEvent, param2:IWindow) : void
      {
         if(param1.type != WindowMouseEvent.WINDOW_EVENT_MOUSE_CLICK)
         {
            return;
         }
         if(_navigator.data.roomEventData == null)
         {
            if(_navigator.data.currentRoomOwner)
            {
               _navigator.send(new CanCreateEventMessageComposer());
            }
         }
         else
         {
            startEventEdit();
         }
      }
      
      public function roomSettingsRefreshNeeded() : void
      {
         refresh();
      }
      
      public function close() : void
      {
         _navigator.toolbar.events.dispatchEvent(new HabboToolbarShowMenuEvent(HabboToolbarShowMenuEvent.const_972,HabboToolbarIconEnum.ROOMINFO,_window,false));
         if(_window == null)
         {
            return;
         }
         this._window.visible = false;
         _navigator.events.dispatchEvent(new Event(HabboRoomSettingsTrackingEvent.HABBO_ROOM_SETTINGS_TRACKING_EVENT_CLOSED));
      }
      
      private function onMakeHomeClick(param1:WindowEvent, param2:IWindow) : void
      {
         if(param1.type != WindowMouseEvent.WINDOW_EVENT_MOUSE_CLICK)
         {
            return;
         }
         var _loc3_:GuestRoomData = _navigator.data.enteredGuestRoom;
         if(_loc3_ == null)
         {
            Logger.log("No entered room data?!");
            return;
         }
         Logger.log("SETTING HOME ROOM TO: " + _loc3_.flatId);
         _navigator.send(new UpdateNavigatorSettingsMessageComposer(_loc3_.flatId));
      }
   }
}
