package com.sulake.core.window.utils
{
   import com.sulake.core.window.IWindowContext;
   import flash.display.DisplayObject;
   
   public class InternalWindowServices implements IInternalWindowServices
   {
       
      
      private var var_122:DisplayObject;
      
      private var var_2195:uint;
      
      private var var_823:IWindowToolTipAgentService;
      
      private var var_824:IWindowMouseScalingService;
      
      private var var_354:IWindowContext;
      
      private var var_826:IWindowFocusManagerService;
      
      private var var_825:IWindowMouseListenerService;
      
      private var var_827:IWindowMouseDraggingService;
      
      public function InternalWindowServices(param1:IWindowContext, param2:DisplayObject)
      {
         super();
         var_2195 = 0;
         var_122 = param2;
         var_354 = param1;
         var_827 = new WindowMouseDragger(param2);
         var_824 = new WindowMouseScaler(param2);
         var_825 = new WindowMouseListener(param2);
         var_826 = new FocusManager(param2);
         var_823 = new WindowToolTipAgent(param2);
      }
      
      public function getMouseScalingService() : IWindowMouseScalingService
      {
         return var_824;
      }
      
      public function getFocusManagerService() : IWindowFocusManagerService
      {
         return var_826;
      }
      
      public function getToolTipAgentService() : IWindowToolTipAgentService
      {
         return var_823;
      }
      
      public function dispose() : void
      {
         if(var_827 != null)
         {
            var_827.dispose();
            var_827 = null;
         }
         if(var_824 != null)
         {
            var_824.dispose();
            var_824 = null;
         }
         if(var_825 != null)
         {
            var_825.dispose();
            var_825 = null;
         }
         if(var_826 != null)
         {
            var_826.dispose();
            var_826 = null;
         }
         if(var_823 != null)
         {
            var_823.dispose();
            var_823 = null;
         }
         var_354 = null;
      }
      
      public function getMouseListenerService() : IWindowMouseListenerService
      {
         return var_825;
      }
      
      public function getMouseDraggingService() : IWindowMouseDraggingService
      {
         return var_827;
      }
   }
}
