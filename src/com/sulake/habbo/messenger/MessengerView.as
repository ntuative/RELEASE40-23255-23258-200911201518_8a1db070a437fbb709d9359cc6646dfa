package com.sulake.habbo.messenger
{
   import com.sulake.core.window.IWindow;
   import com.sulake.core.window.components.IFrameWindow;
   import com.sulake.core.window.components.ITextFieldWindow;
   import com.sulake.core.window.events.WindowEvent;
   import com.sulake.core.window.events.WindowKeyboardEvent;
   import com.sulake.core.window.events.WindowMouseEvent;
   import com.sulake.habbo.communication.messages.outgoing.friendlist.SendMsgMessageComposer;
   import com.sulake.habbo.messenger.domain.Conversation;
   import com.sulake.habbo.messenger.domain.Message;
   import com.sulake.habbo.toolbar.HabboToolbarIconEnum;
   import com.sulake.habbo.toolbar.events.HabboToolbarShowMenuEvent;
   import com.sulake.habbo.window.enum.HabboWindowParam;
   import flash.events.Event;
   import flash.events.TimerEvent;
   import flash.ui.Keyboard;
   import flash.utils.Timer;
   
   public class MessengerView
   {
       
      
      private var var_1213:ConversationView;
      
      private var var_27:IFrameWindow;
      
      private var var_798:ConversationsTabView;
      
      private var var_445:Timer;
      
      private var var_132:HabboMessenger;
      
      private var var_582:ITextFieldWindow;
      
      public function MessengerView(param1:HabboMessenger)
      {
         super();
         var_132 = param1;
         var_445 = new Timer(300,1);
         var_445.addEventListener(TimerEvent.TIMER,onResizeTimer);
      }
      
      public function addMsgToView(param1:Conversation, param2:Message) : void
      {
         if(var_27 == null)
         {
            return;
         }
         if(!param1.selected)
         {
            return;
         }
         var_1213.addMessage(param2);
      }
      
      private function onResizeTimer(param1:TimerEvent) : void
      {
         Logger.log("XXX RESIZE XXX");
         this.var_1213.afterResize();
         this.var_798.refresh();
      }
      
      private function onMessageInput(param1:Event) : void
      {
         var _loc4_:int = 0;
         var _loc5_:* = null;
         var _loc2_:IWindow = IWindow(param1.target);
         if(!(param1 is WindowKeyboardEvent))
         {
            return;
         }
         var _loc3_:WindowKeyboardEvent = param1 as WindowKeyboardEvent;
         if(_loc3_.charCode == Keyboard.ENTER)
         {
            sendMsg();
         }
         else
         {
            _loc4_ = 120;
            _loc5_ = "null";
            if(_loc5_.length > _loc4_)
            {
               var_582.text = _loc5_.substring(0,_loc4_);
            }
         }
      }
      
      public function getTabCount() : int
      {
         return this.var_798 == null ? 7 : int(this.var_798.getTabCount());
      }
      
      public function openMessenger() : void
      {
         if(var_132.conversations.openConversations.length < 1)
         {
            return;
         }
         if(var_27 == null)
         {
            prepareContent();
            refresh(true);
            var_132.toolbar.events.dispatchEvent(new HabboToolbarShowMenuEvent(HabboToolbarShowMenuEvent.const_44,HabboToolbarIconEnum.MESSENGER,var_27));
         }
         else
         {
            refresh(true);
            var_27.visible = true;
            var_27.activate();
         }
      }
      
      private function sendMsg() : void
      {
         var _loc1_:String = "null";
         Logger.log("Send msg: " + _loc1_);
         if(_loc1_ == "")
         {
            Logger.log("No text...");
            return;
         }
         var _loc2_:Conversation = var_132.conversations.findSelectedConversation();
         if(_loc2_ == null)
         {
            Logger.log("No conversation...");
            return;
         }
         var_132.send(new SendMsgMessageComposer(_loc2_.id,_loc1_));
         var_582.text = "";
         var_132.conversations.addMessageAndUpdateView(new Message(Message.const_617,_loc2_.id,_loc1_,Util.getFormattedNow()));
      }
      
      private function onWindow(param1:WindowEvent, param2:IWindow) : void
      {
         if(param1.type != WindowEvent.const_47 || param2 != var_27)
         {
            return;
         }
         if(!this.var_445.running)
         {
            this.var_445.reset();
            this.var_445.start();
         }
      }
      
      private function prepareContent() : void
      {
         var_27 = IFrameWindow(var_132.getXmlWindow("main_window"));
         var _loc1_:IWindow = var_27.findChildByTag("close");
         _loc1_.procedure = onWindowClose;
         var_27.procedure = onWindow;
         var_27.title.color = 4294623744;
         var_27.title.textColor = 4287851525;
         var_798 = new ConversationsTabView(var_132,var_27);
         var_798.refresh();
         var_582 = ITextFieldWindow(var_27.findChildByName("message_input"));
         var_582.addEventListener(WindowKeyboardEvent.const_133,onMessageInput);
         var_1213 = new ConversationView(var_132,var_27);
         var_27.scaler.setParamFlag(HabboWindowParam.const_643,false);
         var_27.scaler.setParamFlag(HabboWindowParam.const_769,true);
      }
      
      public function isMessengerOpen() : Boolean
      {
         return var_27 != null && false;
      }
      
      public function refresh(param1:Boolean) : void
      {
         if(var_27 == null)
         {
            return;
         }
         var _loc2_:Conversation = var_132.conversations.findSelectedConversation();
         var_27.caption = _loc2_ == null ? "" : _loc2_.name;
         var_798.refresh();
         var_1213.refresh();
         if(var_132.conversations.openConversations.length < 1)
         {
            var_27.visible = false;
            var_132.setHabboToolbarIcon(false,false);
         }
      }
      
      private function onWindowClose(param1:WindowEvent, param2:IWindow) : void
      {
         if(param1.type != WindowMouseEvent.WINDOW_EVENT_MOUSE_CLICK)
         {
            return;
         }
         Logger.log("Close window");
         var_27.visible = false;
      }
      
      public function close() : void
      {
         if(var_27 != null)
         {
            var_27.visible = false;
         }
      }
   }
}
