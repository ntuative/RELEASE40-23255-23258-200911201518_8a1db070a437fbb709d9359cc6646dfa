package com.sulake.habbo.ui
{
   import com.sulake.core.assets.BitmapDataAsset;
   import com.sulake.core.runtime.Component;
   import com.sulake.core.window.IWindowContainer;
   import com.sulake.habbo.avatar.IAvatarImage;
   import com.sulake.habbo.avatar.enum.AvatarScaleType;
   import com.sulake.habbo.avatar.enum.AvatarSetType;
   import com.sulake.habbo.avatar.events.AvatarEditorClosedEvent;
   import com.sulake.habbo.catalog.IHabboCatalog;
   import com.sulake.habbo.catalog.enum.CatalogPageName;
   import com.sulake.habbo.help.enum.HabboHelpTutorialEvent;
   import com.sulake.habbo.inventory.IHabboInventory;
   import com.sulake.habbo.inventory.enum.InventoryCategory;
   import com.sulake.habbo.inventory.events.HabboInventoryEffectsEvent;
   import com.sulake.habbo.inventory.events.HabboInventoryHabboClubEvent;
   import com.sulake.habbo.session.IUserData;
   import com.sulake.habbo.session.events.HabboSessionFigureUpdatedEvent;
   import com.sulake.habbo.toolbar.HabboToolbarIconEnum;
   import com.sulake.habbo.toolbar.IHabboToolbar;
   import com.sulake.habbo.toolbar.events.HabboToolbarEvent;
   import com.sulake.habbo.toolbar.events.HabboToolbarSetIconEvent;
   import com.sulake.habbo.toolbar.events.HabboToolbarShowMenuEvent;
   import com.sulake.habbo.widget.RoomWidgetEnum;
   import com.sulake.habbo.widget.events.RoomWidgetAvatarEditorUpdateEvent;
   import com.sulake.habbo.widget.events.RoomWidgetFrameUpdateEvent;
   import com.sulake.habbo.widget.events.RoomWidgetHabboClubUpdateEvent;
   import com.sulake.habbo.widget.events.RoomWidgetSettingsUpdateEvent;
   import com.sulake.habbo.widget.events.RoomWidgetToolbarClickedUpdateEvent;
   import com.sulake.habbo.widget.events.RoomWidgetTutorialEvent;
   import com.sulake.habbo.widget.events.RoomWidgetUpdateEffectsUpdateEvent;
   import com.sulake.habbo.widget.events.RoomWidgetUpdateEvent;
   import com.sulake.habbo.widget.messages.RoomWidgetAvatarEditorMessage;
   import com.sulake.habbo.widget.messages.RoomWidgetDanceMessage;
   import com.sulake.habbo.widget.messages.RoomWidgetGetEffectsMessage;
   import com.sulake.habbo.widget.messages.RoomWidgetGetSettingsMessage;
   import com.sulake.habbo.widget.messages.RoomWidgetMessage;
   import com.sulake.habbo.widget.messages.RoomWidgetNavigateToRoomMessage;
   import com.sulake.habbo.widget.messages.RoomWidgetOpenCatalogMessage;
   import com.sulake.habbo.widget.messages.RoomWidgetOpenInventoryMessage;
   import com.sulake.habbo.widget.messages.RoomWidgetRedeemClubPromoMessage;
   import com.sulake.habbo.widget.messages.RoomWidgetRequestWidgetMessage;
   import com.sulake.habbo.widget.messages.RoomWidgetSelectEffectMessage;
   import com.sulake.habbo.widget.messages.RoomWidgetSelectOutfitMessage;
   import com.sulake.habbo.widget.messages.RoomWidgetSetToolbarIconMessage;
   import com.sulake.habbo.widget.messages.RoomWidgetShowOwnRoomsMessage;
   import com.sulake.habbo.widget.messages.RoomWidgetStopEffectMessage;
   import com.sulake.habbo.widget.messages.RoomWidgetStoreSettingsMessage;
   import com.sulake.habbo.widget.messages.RoomWidgetToolbarMessage;
   import com.sulake.habbo.widget.messages.RoomWidgetWaveMessage;
   import flash.display.BitmapData;
   import flash.events.Event;
   
   public class MeMenuWidgetHandler implements IRoomWidgetHandler
   {
       
      
      private var _container:IRoomWidgetHandlerContainer = null;
      
      private var _isDisposed:Boolean = false;
      
      private var var_81:IHabboCatalog;
      
      private var var_28:IHabboInventory;
      
      private var var_195:IHabboToolbar;
      
      public function MeMenuWidgetHandler()
      {
         super();
         Logger.log("[MeMenuWidgetHandler]");
      }
      
      public function get type() : String
      {
         return RoomWidgetEnum.const_416;
      }
      
      private function setMeMenuToolbarIcon(param1:Boolean) : void
      {
         var _loc4_:* = null;
         var _loc5_:* = null;
         var _loc6_:* = null;
         var _loc7_:* = null;
         var _loc8_:* = null;
         var _loc2_:* = null;
         if(false)
         {
            _loc4_ = _container.sessionDataManager.figure;
            _loc5_ = _container.avatarRenderManager.createAvatarImage(_loc4_,AvatarScaleType.const_50);
            if(_loc5_ != null)
            {
               _loc5_.setDirection(AvatarSetType.const_43,3);
               _loc2_ = _loc5_.getCroppedImage(AvatarSetType.const_43);
            }
         }
         var _loc3_:Component = _container.roomWidgetFactory as Component;
         if(_loc3_ != null)
         {
            if(_loc2_ == null)
            {
               _loc7_ = _loc3_.assets.getAssetByName("memenu_toolbar_icon") as BitmapDataAsset;
               _loc6_ = _loc7_.content as BitmapData;
            }
            else
            {
               _loc6_ = _loc2_;
            }
            Logger.log("MeMenuWidgetHandler: set toolbar icon: " + var_195 + " " + _loc6_);
            if(var_195 != null && _loc6_ != null)
            {
               _loc8_ = new HabboToolbarSetIconEvent(HabboToolbarSetIconEvent.const_768,HabboToolbarIconEnum.MEMENU);
               _loc8_.bitmapData = _loc6_;
               var_195.events.dispatchEvent(_loc8_);
            }
         }
      }
      
      private function onHelpTutorialEvent(param1:HabboHelpTutorialEvent) : void
      {
         if(_container == null)
         {
            return;
         }
         switch(param1.type)
         {
            case HabboHelpTutorialEvent.const_98:
               _container.events.dispatchEvent(new RoomWidgetTutorialEvent(RoomWidgetTutorialEvent.const_98));
               break;
            case HabboHelpTutorialEvent.const_399:
               _container.events.dispatchEvent(new RoomWidgetTutorialEvent(RoomWidgetTutorialEvent.const_443));
         }
      }
      
      private function onFigureUpdate(param1:HabboSessionFigureUpdatedEvent) : void
      {
         if(_container == null)
         {
            return;
         }
         if(param1 == null)
         {
            return;
         }
         var _loc2_:* = param1.userId == _container.sessionDataManager.userId;
         if(_loc2_)
         {
            setMeMenuToolbarIcon(false);
         }
         if(_container != null && false)
         {
         }
      }
      
      public function update() : void
      {
         if(_container)
         {
            _container.events.dispatchEvent(new RoomWidgetFrameUpdateEvent());
         }
      }
      
      public function set container(param1:IRoomWidgetHandlerContainer) : void
      {
         if(_container != null)
         {
            if(false)
            {
               _container.sessionDataManager.events.removeEventListener(HabboSessionFigureUpdatedEvent.const_520,onFigureUpdate);
            }
            if(false)
            {
               _container.avatarEditor.events.removeEventListener(AvatarEditorClosedEvent.AVATAREDITOR_CLOSED,onAvatarEditorClosed);
            }
            if(false)
            {
               _container.habboHelp.events.removeEventListener(HabboHelpTutorialEvent.const_399,onHelpTutorialEvent);
               _container.habboHelp.events.removeEventListener(HabboHelpTutorialEvent.const_98,onHelpTutorialEvent);
            }
            _container = null;
         }
         _container = param1;
         if(_container != null && false)
         {
            _container.sessionDataManager.events.addEventListener(HabboSessionFigureUpdatedEvent.const_520,onFigureUpdate);
         }
         var_28 = _container.inventory;
         if(var_28 != null)
         {
            (var_28 as Component).events.addEventListener(HabboInventoryEffectsEvent.const_836,onAvatarEffectsChanged);
            (var_28 as Component).events.addEventListener(HabboInventoryHabboClubEvent.const_566,onHabboClubSubscriptionChanged);
         }
         var_195 = _container.toolbar;
         if(var_195)
         {
            var_195.events.addEventListener(HabboToolbarEvent.const_79,onHabboToolbarEvent);
            var_195.events.addEventListener(HabboToolbarEvent.const_58,onHabboToolbarEvent);
            setMeMenuToolbarIcon(false);
         }
         if(false)
         {
            _container.avatarEditor.events.addEventListener(AvatarEditorClosedEvent.AVATAREDITOR_CLOSED,onAvatarEditorClosed);
         }
         if(false)
         {
            _container.habboHelp.events.addEventListener(HabboHelpTutorialEvent.const_399,onHelpTutorialEvent);
            _container.habboHelp.events.addEventListener(HabboHelpTutorialEvent.const_98,onHelpTutorialEvent);
         }
         var_81 = _container.catalog;
      }
      
      public function getProcessedEvents() : Array
      {
         return [];
      }
      
      private function onAvatarEffectsChanged(param1:Event = null) : void
      {
         var _loc2_:* = null;
         if(_container == null)
         {
            return;
         }
         Logger.log("[MeMenuWidgetHandler] Received Avatar Effects Have Changed Event...\t");
         if(var_28 != null)
         {
            _loc2_ = var_28.getAvatarEffects();
            _container.events.dispatchEvent(new RoomWidgetUpdateEffectsUpdateEvent(_loc2_));
         }
      }
      
      private function onHabboClubSubscriptionChanged(param1:Event = null) : void
      {
         var _loc2_:Boolean = false;
         if(var_28 != null)
         {
            _loc2_ = false;
            if(_container != null && false)
            {
               _loc2_ = _container.sessionDataManager.hasUserRight("fuse_use_club_dance");
            }
            _container.events.dispatchEvent(new RoomWidgetHabboClubUpdateEvent(var_28.clubDays,var_28.clubPeriods,var_28.clubPastPeriods,_loc2_));
         }
      }
      
      public function get disposed() : Boolean
      {
         return _isDisposed;
      }
      
      public function getWidgetMessages() : Array
      {
         var _loc1_:* = [];
         _loc1_.push(RoomWidgetWaveMessage.const_658);
         _loc1_.push(RoomWidgetDanceMessage.const_697);
         _loc1_.push(RoomWidgetGetEffectsMessage.const_537);
         _loc1_.push(RoomWidgetSelectEffectMessage.const_691);
         _loc1_.push(RoomWidgetSelectEffectMessage.const_564);
         _loc1_.push(RoomWidgetSelectEffectMessage.const_518);
         _loc1_.push(RoomWidgetOpenInventoryMessage.const_701);
         _loc1_.push(RoomWidgetOpenCatalogMessage.const_613);
         _loc1_.push(RoomWidgetStopEffectMessage.const_715);
         _loc1_.push(RoomWidgetNavigateToRoomMessage.const_1186);
         _loc1_.push(RoomWidgetNavigateToRoomMessage.const_980);
         _loc1_.push(RoomWidgetToolbarMessage.const_533);
         _loc1_.push(RoomWidgetToolbarMessage.const_699);
         _loc1_.push(RoomWidgetAvatarEditorMessage.const_702);
         _loc1_.push(RoomWidgetAvatarEditorMessage.const_1163);
         _loc1_.push(RoomWidgetSelectOutfitMessage.const_895);
         _loc1_.push(RoomWidgetShowOwnRoomsMessage.const_628);
         _loc1_.push(RoomWidgetRequestWidgetMessage.const_541);
         _loc1_.push(RoomWidgetRedeemClubPromoMessage.const_552);
         _loc1_.push(RoomWidgetGetSettingsMessage.const_651);
         _loc1_.push(RoomWidgetStoreSettingsMessage.const_1110);
         _loc1_.push(RoomWidgetStoreSettingsMessage.const_695);
         _loc1_.push(RoomWidgetStoreSettingsMessage.const_618);
         return _loc1_;
      }
      
      public function processEvent(param1:Event) : void
      {
      }
      
      public function dispose() : void
      {
         _isDisposed = true;
         _container = null;
         var_28 = null;
         var_195 = null;
         var_81 = null;
      }
      
      private function onAvatarEditorClosed(param1:Event = null) : void
      {
         if(_container == null)
         {
            return;
         }
         Logger.log("[MeMenuWidgetHandler] Received Avatar Editor Closed Event...");
         _container.events.dispatchEvent(new RoomWidgetAvatarEditorUpdateEvent(RoomWidgetAvatarEditorUpdateEvent.const_556));
      }
      
      public function processWidgetMessage(param1:RoomWidgetMessage) : RoomWidgetUpdateEvent
      {
         var _loc2_:* = null;
         var _loc3_:* = null;
         var _loc4_:* = null;
         var _loc5_:* = null;
         var _loc6_:* = null;
         var _loc7_:* = null;
         var _loc8_:* = null;
         var _loc9_:* = null;
         var _loc10_:* = null;
         var _loc11_:* = null;
         var _loc12_:* = null;
         var _loc13_:* = null;
         var _loc14_:Boolean = false;
         var _loc15_:int = 0;
         var _loc16_:* = null;
         var _loc17_:int = 0;
         var _loc18_:int = 0;
         var _loc19_:* = null;
         var _loc20_:* = null;
         var _loc21_:* = null;
         var _loc22_:* = null;
         var _loc23_:Boolean = false;
         var _loc24_:* = null;
         var _loc25_:* = false;
         var _loc26_:* = false;
         Logger.log("[MeMenuWidgetHandler] Processing in MeMenuWidgetHandler: " + param1.type);
         switch(param1.type)
         {
            case RoomWidgetRequestWidgetMessage.const_541:
               if(_container != null && false)
               {
                  _loc8_ = new HabboToolbarEvent(HabboToolbarEvent.const_58);
                  _loc8_.iconId = HabboToolbarIconEnum.MEMENU;
                  _container.toolbar.events.dispatchEvent(_loc8_);
               }
               break;
            case RoomWidgetWaveMessage.const_658:
               if(_container != null && false)
               {
                  _loc9_ = param1 as RoomWidgetWaveMessage;
                  _container.roomSession.sendWaveMessage();
               }
               break;
            case RoomWidgetDanceMessage.const_697:
               if(_container != null && false)
               {
                  _loc10_ = param1 as RoomWidgetDanceMessage;
                  _container.roomSession.sendDanceMessage(_loc10_.style);
               }
               break;
            case RoomWidgetGetEffectsMessage.const_537:
               if(var_28 != null)
               {
                  _loc11_ = var_28.getAvatarEffects();
                  _container.events.dispatchEvent(new RoomWidgetUpdateEffectsUpdateEvent(_loc11_));
               }
               break;
            case RoomWidgetSelectEffectMessage.const_691:
               if(var_28 != null)
               {
                  _loc12_ = param1 as RoomWidgetSelectEffectMessage;
                  var_28.setEffectSelected(_loc12_.effectType);
               }
               break;
            case RoomWidgetSelectEffectMessage.const_564:
               if(var_28 != null)
               {
                  _loc13_ = param1 as RoomWidgetSelectEffectMessage;
                  var_28.setEffectDeselected(_loc13_.effectType);
               }
               break;
            case RoomWidgetOpenCatalogMessage.const_613:
               _loc2_ = param1 as RoomWidgetOpenCatalogMessage;
               if(var_81 != null && _loc2_.pageKey == RoomWidgetOpenCatalogMessage.const_581)
               {
                  var_81.openCatalogPage(CatalogPageName.const_279,true);
               }
               break;
            case RoomWidgetOpenInventoryMessage.const_701:
               _loc3_ = param1 as RoomWidgetOpenInventoryMessage;
               if(var_28 != null)
               {
                  Logger.log("MeMenuWidgetHandler open inventory: " + _loc3_.inventoryType);
                  switch(_loc3_.inventoryType)
                  {
                     case RoomWidgetOpenInventoryMessage.const_977:
                        var_81.openCatalogPage(CatalogPageName.const_1164,true);
                        break;
                     case RoomWidgetOpenInventoryMessage.const_783:
                        var_28.toggleInventoryPage(InventoryCategory.const_224);
                        break;
                     case RoomWidgetOpenInventoryMessage.const_1155:
                        var_28.toggleInventoryPage(InventoryCategory.const_68);
                        break;
                     case RoomWidgetOpenInventoryMessage.const_1312:
                        break;
                     default:
                        Logger.log("MeMenuWidgetHandler: unknown inventory type: " + _loc3_.inventoryType);
                  }
               }
               break;
            case RoomWidgetSelectEffectMessage.const_518:
            case RoomWidgetStopEffectMessage.const_715:
               Logger.log("STOP ALL EFFECTS");
               if(var_28 != null)
               {
                  var_28.deselectAllEffects();
               }
               break;
            case RoomWidgetSetToolbarIconMessage.const_957:
               _loc4_ = param1 as RoomWidgetSetToolbarIconMessage;
               switch(_loc4_.widgetType)
               {
                  case RoomWidgetSetToolbarIconMessage.const_1122:
                     break;
                  default:
                     Logger.log("MeMenuWidgetHandler: unknown icon widget type: " + _loc4_.widgetType);
               }
               break;
            case RoomWidgetNavigateToRoomMessage.const_980:
               Logger.log("MeMenuWidgetHandler: GO HOME");
               if(_container != null)
               {
                  _container.navigator.goToHomeRoom();
               }
               break;
            case RoomWidgetShowOwnRoomsMessage.const_628:
               if(_container != null)
               {
                  _container.navigator.showOwnRooms();
               }
               break;
            case RoomWidgetToolbarMessage.const_533:
               _loc5_ = param1 as RoomWidgetToolbarMessage;
               if(var_195)
               {
                  var_195.events.dispatchEvent(new HabboToolbarShowMenuEvent(HabboToolbarShowMenuEvent.const_44,HabboToolbarIconEnum.MEMENU,_loc5_.window));
                  if(var_28 != null)
                  {
                     _loc14_ = false;
                     if(_container != null && false)
                     {
                        _loc14_ = _container.sessionDataManager.hasUserRight("fuse_use_club_dance");
                     }
                     _container.events.dispatchEvent(new RoomWidgetHabboClubUpdateEvent(var_28.clubDays,var_28.clubPeriods,var_28.clubPastPeriods,_loc14_));
                  }
               }
               if(false)
               {
                  _loc15_ = _container.sessionDataManager != null ? int(_container.sessionDataManager.userId) : -1;
                  _loc16_ = _container.roomSession.userDataManager.getUserData(_loc15_);
                  _loc17_ = 0;
                  _loc18_ = 0;
                  _container.roomEngine.selectAvatar(_loc17_,_loc18_,_loc16_.id,true);
               }
               break;
            case RoomWidgetToolbarMessage.const_699:
               _loc6_ = param1 as RoomWidgetToolbarMessage;
               if(var_195)
               {
                  var_195.events.dispatchEvent(new HabboToolbarShowMenuEvent(HabboToolbarShowMenuEvent.const_408,HabboToolbarIconEnum.MEMENU,_loc6_.window));
               }
               break;
            case RoomWidgetAvatarEditorMessage.const_702:
               Logger.log("MeMenuWidgetHandler: Open avatar editor...");
               if(_container)
               {
                  _loc19_ = param1 as RoomWidgetAvatarEditorMessage;
                  _loc20_ = _loc19_.context;
                  _container.avatarEditor.openEditor(_loc20_);
                  _loc21_ = _container.sessionDataManager.figure;
                  _loc22_ = _container.sessionDataManager.gender;
                  _loc23_ = false;
                  _container.avatarEditor.loadAvatarInEditor(_loc21_,_loc22_,_loc23_);
                  if(false && !_loc23_)
                  {
                     _loc24_ = _container.config.getKey("avatar.editor.club.promo.image");
                     _loc25_ = int(_container.config.getKey("avatar.editor.club.promo")) > 0;
                     if(_loc25_ && false)
                     {
                        _container.events.dispatchEvent(new RoomWidgetAvatarEditorUpdateEvent(RoomWidgetAvatarEditorUpdateEvent.const_435,_loc24_,RoomWidgetAvatarEditorUpdateEvent.const_945));
                     }
                     _loc26_ = int(_container.config.getKey("avatar.editor.trial.promo")) > 0;
                     if(_loc26_ && true)
                     {
                        _container.events.dispatchEvent(new RoomWidgetAvatarEditorUpdateEvent(RoomWidgetAvatarEditorUpdateEvent.const_435,_loc24_,RoomWidgetAvatarEditorUpdateEvent.const_1213));
                     }
                  }
               }
               break;
            case RoomWidgetRedeemClubPromoMessage.const_552:
               _loc7_ = param1 as RoomWidgetRedeemClubPromoMessage;
               if(_loc7_ != null)
               {
                  _container.catalog.redeemClubPromo(_loc7_.code,_loc7_.isTrial);
               }
               break;
            case RoomWidgetGetSettingsMessage.const_651:
               _container.events.dispatchEvent(new RoomWidgetSettingsUpdateEvent(RoomWidgetSettingsUpdateEvent.const_324,_container.soundManager.volume));
               break;
            case RoomWidgetStoreSettingsMessage.const_695:
               _container.soundManager.volume = (param1 as RoomWidgetStoreSettingsMessage).volume;
               _container.events.dispatchEvent(new RoomWidgetSettingsUpdateEvent(RoomWidgetSettingsUpdateEvent.const_324,_container.soundManager.volume));
               break;
            case RoomWidgetStoreSettingsMessage.const_618:
               _container.soundManager.previewVolume = (param1 as RoomWidgetStoreSettingsMessage).volume;
               _container.events.dispatchEvent(new RoomWidgetSettingsUpdateEvent(RoomWidgetSettingsUpdateEvent.const_324,_container.soundManager.volume));
               break;
            default:
               Logger.log("Unhandled message in MeMenuWidgetHandler: " + param1.type);
         }
         return null;
      }
      
      private function onHabboToolbarEvent(param1:HabboToolbarEvent) : void
      {
         if(param1.type == HabboToolbarEvent.const_79)
         {
            setMeMenuToolbarIcon(false);
         }
         if(_container == null)
         {
            return;
         }
         if(param1.type == HabboToolbarEvent.const_58)
         {
            switch(param1.iconId)
            {
               case HabboToolbarIconEnum.MEMENU:
                  _container.events.dispatchEvent(new RoomWidgetToolbarClickedUpdateEvent(RoomWidgetToolbarClickedUpdateEvent.ICON_TYPE_ME_MENU));
                  break;
               case HabboToolbarIconEnum.ROOMINFO:
                  _container.events.dispatchEvent(new RoomWidgetToolbarClickedUpdateEvent(RoomWidgetToolbarClickedUpdateEvent.ICON_TYPE_ROOM_INFO));
            }
         }
      }
   }
}
