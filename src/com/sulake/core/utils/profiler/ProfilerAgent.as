package com.sulake.core.utils.profiler
{
   import com.sulake.core.runtime.ICoreUpdateReceiver;
   import com.sulake.core.runtime.IDisposable;
   import flash.utils.getQualifiedClassName;
   
   public class ProfilerAgent extends ProfilerAgentTask implements IDisposable
   {
       
      
      protected var var_854:ICoreUpdateReceiver;
      
      public function ProfilerAgent(param1:ICoreUpdateReceiver)
      {
         var_854 = param1;
         var _loc2_:String = getQualifiedClassName(var_854);
         super(_loc2_.slice(_loc2_.lastIndexOf(":") + 1,_loc2_.length));
      }
      
      override public function dispose() : void
      {
         var_854 = null;
         super.dispose();
      }
      
      public function get receiver() : ICoreUpdateReceiver
      {
         return var_854;
      }
      
      public function update(param1:int) : void
      {
         super.start();
         var_854.update(param1);
         super.stop();
      }
   }
}
